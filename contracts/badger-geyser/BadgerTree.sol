// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "deps/@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol";
import "deps/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
import "deps/@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "deps/@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
import "deps/@openzeppelin/contracts-upgradeable/cryptography/MerkleProofUpgradeable.sol";
import "interfaces/badger/ICumulativeMultiTokenMerkleDistributor.sol";

contract BadgerTree is Initializable, AccessControlUpgradeable, ICumulativeMultiTokenMerkleDistributor, PausableUpgradeable {
    using SafeMathUpgradeable for uint256;

    struct MerkleData {
        bytes32 root;
        bytes32 contentHash;
    }

    bytes32 public constant ROOT_UPDATER_ROLE = keccak256("ROOT_UPDATER_ROLE");
    bytes32 public constant GUARDIAN_ROLE = keccak256("GUARDIAN_ROLE");

    uint256 public currentCycle;
    bytes32 public merkleRoot;
    bytes32 public merkleContentHash;

    bytes32 public pendingMerkleRoot;
    bytes32 public pendingMerkleContentHash;

    mapping(address => mapping(address => uint256)) claimed;
    mapping(address => uint256) totalClaimed;

    function initialize(
        address admin,
        address initialUpdater,
        address initialGuardian
    ) public initializer {
        __AccessControl_init();
        __Pausable_init_unchained();

        _setupRole(DEFAULT_ADMIN_ROLE, admin); // The admin can edit all role permissions
        _setupRole(ROOT_UPDATER_ROLE, initialUpdater);
        _setupRole(GUARDIAN_ROLE, initialGuardian);
    }

    /// ===== Modifiers =====

    /// @notice Admins can approve new root updaters or admins
    function _onlyAdmin() internal view {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "onlyAdmin");
    }

    /// @notice Root updaters can update the root
    function _onlyRootUpdater() internal view {
        require(hasRole(ROOT_UPDATER_ROLE, msg.sender), "onlyRootUpdater");
    }

    function _onlyGuardian() internal view {
        require(hasRole(GUARDIAN_ROLE, msg.sender), "onlyGuardian");
    }

    function getCurrentMerkleData() external view returns (MerkleData memory) {
        return MerkleData(merkleRoot, merkleContentHash);
    }

    /// @notice Claim accumulated rewards for a set of tokens at a given cycle number
    function claim(
        address[] calldata tokens,
        uint256[] calldata cumulativeAmounts,
        uint256 index,
        uint256 cycle,
        bytes32[] calldata merkleProof
    ) external whenNotPaused {
        require(cycle == currentCycle, "Invalid cycle");

        // Verify the merkle proof.
        bytes32 node = keccak256(abi.encodePacked(index, msg.sender, cycle, tokens, cumulativeAmounts));
        require(MerkleProofUpgradeable.verify(merkleProof, merkleRoot, node), "Invalid proof");

        // Claim each token
        for (uint256 i = 0; i < tokens.length; i++) {

            uint256 claimable = cumulativeAmounts[i].sub(claimed[msg.sender][tokens[i]]);

            require(claimable > 0, "Excessive claim");

            claimed[msg.sender][tokens[i]] = claimed[msg.sender][tokens[i]].add(claimable);

            require(claimed[msg.sender][tokens[i]] == cumulativeAmounts[i], "Claimed amount mismatch");
            require(IERC20Upgradeable(tokens[i]).transfer(msg.sender, cumulativeAmounts[i]), "Transfer failed");

            emit Claimed(msg.sender, tokens[i], cumulativeAmounts[i], cycle, now);
        }
    }

    // ===== Root Updater Restricted =====

    /// @notice Propose a new root and content hash, which will be stored as pending until approved
    function publishRoot(bytes32 root, bytes32 contentHash) external whenNotPaused {
        _onlyRootUpdater();

        pendingMerkleRoot = root;
        pendingMerkleContentHash = contentHash;

        emit RootProposed(currentCycle.add(1), pendingMerkleRoot, pendingMerkleContentHash, now);
    }

    /// ===== Guardian Restricted =====

    /// @notice Approve the current pending root and content hash
    function approveRoot(bytes32 root, bytes32 contentHash) external {
        require(root == pendingMerkleRoot, "Incorrect root");
        require(contentHash == pendingMerkleContentHash, "Incorrect content hash");

        currentCycle = currentCycle.add(1);
        merkleRoot = root;
        merkleContentHash = contentHash;

        emit RootUpdated(currentCycle, root, contentHash, now);
    }

    /// @notice Pause publishing of new roots
    function pause() external {
        _onlyGuardian();
        _pause();
    }

    /// @notice Unpause publishing of new roots
    function unpause() external {
        _onlyGuardian();
        _unpause();
    }
}
