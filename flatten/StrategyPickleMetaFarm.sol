// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol

// SPDX-License-Identifier: MIT

// pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20Upgradeable {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * // importANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol


// pragma solidity ^0.6.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMathUpgradeable {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/math/MathUpgradeable.sol


// pragma solidity ^0.6.0;

/**
 * @dev Standard math utilities missing in the Solidity language.
 */
library MathUpgradeable {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}


// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol


// pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library AddressUpgradeable {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [// importANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * // importANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/token/ERC20/SafeERC20Upgradeable.sol


// pragma solidity ^0.6.0;

// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20Upgradeable {
    using SafeMathUpgradeable for uint256;
    using AddressUpgradeable for address;

    function safeTransfer(IERC20Upgradeable token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20Upgradeable token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20Upgradeable token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20Upgradeable token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20Upgradeable token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20Upgradeable token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


// Dependency file: /Users/present/code/super-sett/interfaces/curve/ICurveFi.sol

// pragma solidity >=0.5.0 <0.8.0;

interface ICurveFi {
    function get_virtual_price() external returns (uint256 out);

    function add_liquidity(uint256[2] calldata amounts, uint256 min_mint_amount)
        external;

    function add_liquidity(
        // sBTC pool
        uint256[3] calldata amounts,
        uint256 min_mint_amount
    ) external;

    function add_liquidity(
        // bUSD pool
        uint256[4] calldata amounts,
        uint256 min_mint_amount
    ) external;

    function get_dy(
        int128 i,
        int128 j,
        uint256 dx
    ) external returns (uint256 out);

    function get_dy_underlying(
        int128 i,
        int128 j,
        uint256 dx
    ) external returns (uint256 out);

    function exchange(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;

    function exchange(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy,
        uint256 deadline
    ) external;

    function exchange_underlying(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy
    ) external;

    function exchange_underlying(
        int128 i,
        int128 j,
        uint256 dx,
        uint256 min_dy,
        uint256 deadline
    ) external;

    function remove_liquidity(
        uint256 _amount,
        uint256 deadline,
        uint256[2] calldata min_amounts
    ) external;

    function remove_liquidity_imbalance(
        uint256[2] calldata amounts,
        uint256 deadline
    ) external;

    function remove_liquidity_imbalance(
        uint256[3] calldata amounts,
        uint256 max_burn_amount
    ) external;

    function remove_liquidity(uint256 _amount, uint256[3] calldata amounts)
        external;

    function remove_liquidity_imbalance(
        uint256[4] calldata amounts,
        uint256 max_burn_amount
    ) external;

    function remove_liquidity(uint256 _amount, uint256[4] calldata amounts)
        external;

    function commit_new_parameters(
        int128 amplification,
        int128 new_fee,
        int128 new_admin_fee
    ) external;

    function apply_new_parameters() external;

    function revert_new_parameters() external;

    function commit_transfer_ownership(address _owner) external;

    function apply_transfer_ownership() external;

    function revert_transfer_ownership() external;

    function withdraw_admin_fees() external;

    function coins(int128 arg0) external returns (address out);

    function underlying_coins(int128 arg0) external returns (address out);

    function balances(int128 arg0) external returns (uint256 out);

    function A() external returns (int128 out);

    function fee() external returns (int128 out);

    function admin_fee() external returns (int128 out);

    function owner() external returns (address out);

    function admin_actions_deadline() external returns (uint256 out);

    function transfer_ownership_deadline() external returns (uint256 out);

    function future_A() external returns (int128 out);

    function future_fee() external returns (int128 out);

    function future_admin_fee() external returns (int128 out);

    function future_owner() external returns (address out);
}


// Dependency file: /Users/present/code/super-sett/interfaces/curve/ICurveGauge.sol

// pragma solidity >=0.5.0 <0.8.0;

interface ICurveGauge {
    function deposit(uint256 _value) external;

    function deposit(uint256 _value, address addr) external;

    function balanceOf(address arg0) external view returns (uint256);

    function withdraw(uint256 _value) external;

    function withdraw(uint256 _value, bool claim_rewards) external;

    function claim_rewards() external;

    function claim_rewards(address addr) external;

    function claimable_tokens(address addr) external returns (uint256);

    function claimable_reward(address addr) external view returns (uint256);

    function integrate_fraction(address arg0) external view returns (uint256);
}

// Dependency file: /Users/present/code/super-sett/interfaces/uniswap/IUniswapRouterV2.sol

// pragma solidity >=0.5.0 <0.8.0;

interface IUniswapRouterV2 {
    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        external
        returns (
            uint256 amountA,
            uint256 amountB,
            uint256 liquidity
        );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function getAmountsOut(uint256 amountIn, address[] calldata path) external view returns (uint256[] memory amounts);

    function getAmountsIn(uint256 amountOut, address[] calldata path) external view returns (uint256[] memory amounts);

    function swapETHForExactTokens(
        uint256 amountOut,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapExactETHForTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapExactTokensForETH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);
}


// Dependency file: /Users/present/code/super-sett/interfaces/uniswap/IUniswapPair.sol

// pragma solidity ^0.6.0;
interface IUniswapPair {
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}


// Dependency file: /Users/present/code/super-sett/interfaces/badger/IController.sol

// pragma solidity >=0.5.0 <0.8.0;

interface IController {
    function withdraw(address, uint256) external;

    function balanceOf(address) external view returns (uint256);

    function earn(address, uint256) external;

    function want(address) external view returns (address);

    function rewards() external view returns (address);

    function vaults(address) external view returns (address);
}


// Dependency file: /Users/present/code/super-sett/interfaces/badger/IMintr.sol


// pragma solidity >=0.5.0 <0.8.0;

interface IMintr {
    function mint(address) external;
}


// Dependency file: /Users/present/code/super-sett/interfaces/badger/IStrategy.sol


// pragma solidity >=0.5.0 <0.8.0;

interface IStrategy {
    function want() external view returns (address);

    function deposit() external;

    // NOTE: must exclude any tokens used in the yield
    // Controller role - withdraw should return to Controller
    function withdrawOther(address) external returns (uint256 balance);

    // Controller | Vault role - withdraw should always return to Vault
    function withdraw(uint256) external;

    // Controller | Vault role - withdraw should always return to Vault
    function withdrawAll() external returns (uint256);

    function balanceOf() external view returns (uint256);

    function getName() external pure returns (string memory);

    function setStrategist(address _strategist) external;

    function setWithdrawalFee(uint256 _withdrawalFee) external;

    function setPerformanceFeeStrategist(uint256 _performanceFeeStrategist) external;

    function setPerformanceFeeGovernance(uint256 _performanceFeeGovernance) external;

    function setGovernance(address _governance) external;

    function setController(address _controller) external;
}


// Dependency file: /Users/present/code/super-sett/interfaces/pickle/IPickleJar.sol

// pragma solidity ^0.6.0;
interface IPickleJar {
    function deposit(uint256 _amount) external;
    function withdraw(uint256 _shares) external;
    function withdrawAll() external;
    function token() external view returns (address);
    function balanceOf(address account) external view returns (uint256);
    function getRatio() external view returns (uint256);
}

// Dependency file: /Users/present/code/super-sett/interfaces/pickle/IPickleChef.sol

// pragma solidity ^0.6.0;
interface IPickleChef {
    function deposit(uint256 _pid, uint256 _amount) external;
    function withdraw(uint256 _pid, uint256 _amount) external;
    function poolInfo(uint256 _pid) external view returns (address, uint256, uint256, uint256);
    function pendingPickle(uint256 _pid, address _user) external view returns (uint256);
    function userInfo(uint256 _pid, address _user) external view returns (uint256, uint256);
}


// Dependency file: /Users/present/code/super-sett/interfaces/pickle/IPickleStaking.sol

// pragma solidity ^0.6.0;
interface IPickleStaking {
    function balanceOf(address account) external view returns (uint256);
    function earned(address account) external view returns (uint256);
    function stake(uint256 amount) external;
    function withdraw(uint256 amount) external;
    function getReward() external;
    function exit() external;
}

// Dependency file: /Users/present/code/super-sett/interfaces/erc20/IWETH.sol

// pragma solidity >=0.5.0 <0.8.0;

interface IWETH {
    function deposit() external payable;

    function withdraw(uint256 wad) external;

    event Deposit(address indexed dst, uint256 wad);
    event Withdrawal(address indexed src, uint256 wad);
}


// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/proxy/Initializable.sol


// pragma solidity >=0.4.24 <0.7.0;


/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since a proxied contract can't have a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 * 
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {UpgradeableProxy-constructor}.
 * 
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 */
abstract contract Initializable {

    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier initializer() {
        require(_initializing || _isConstructor() || !_initialized, "Initializable: contract is already initialized");

        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }

        _;

        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    /// @dev Returns true if and only if the function is running in the constructor
    function _isConstructor() private view returns (bool) {
        // extcodesize checks the size of the code stored in an address, and
        // address returns the current address. Since the code is still not
        // deployed when running a constructor, any checks on its code size will
        // yield zero, making it an effective way to detect if a contract is
        // under construction or not.
        address self = address(this);
        uint256 cs;
        // solhint-disable-next-line no-inline-assembly
        assembly { cs := extcodesize(self) }
        return cs == 0;
    }
}


// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/GSN/ContextUpgradeable.sol


// pragma solidity ^0.6.0;
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal initializer {
        __Context_init_unchained();
    }

    function __Context_init_unchained() internal initializer {
    }
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
    uint256[50] private __gap;
}


// Dependency file: /Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol


// pragma solidity ^0.6.0;

// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/GSN/ContextUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

/**
 * @dev Contract module which allows children to implement an emergency stop
 * mechanism that can be triggered by an authorized account.
 *
 * This module is used through inheritance. It will make available the
 * modifiers `whenNotPaused` and `whenPaused`, which can be applied to
 * the functions of your contract. Note that they will not be pausable by
 * simply including this module, only once the modifiers are put in place.
 */
contract PausableUpgradeable is Initializable, ContextUpgradeable {
    /**
     * @dev Emitted when the pause is triggered by `account`.
     */
    event Paused(address account);

    /**
     * @dev Emitted when the pause is lifted by `account`.
     */
    event Unpaused(address account);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state.
     */
    function __Pausable_init() internal initializer {
        __Context_init_unchained();
        __Pausable_init_unchained();
    }

    function __Pausable_init_unchained() internal initializer {
        _paused = false;
    }

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function paused() public view returns (bool) {
        return _paused;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    modifier whenNotPaused() {
        require(!_paused, "Pausable: paused");
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    modifier whenPaused() {
        require(_paused, "Pausable: not paused");
        _;
    }

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    function _pause() internal virtual whenNotPaused {
        _paused = true;
        emit Paused(_msgSender());
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    function _unpause() internal virtual whenPaused {
        _paused = false;
        emit Unpaused(_msgSender());
    }
    uint256[49] private __gap;
}


// Dependency file: deps/@openzeppelin/contracts-upgradeable/proxy/Initializable.sol


// pragma solidity >=0.4.24 <0.7.0;


/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since a proxied contract can't have a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 * 
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {UpgradeableProxy-constructor}.
 * 
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 */
abstract contract Initializable {

    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier initializer() {
        require(_initializing || _isConstructor() || !_initialized, "Initializable: contract is already initialized");

        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }

        _;

        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    /// @dev Returns true if and only if the function is running in the constructor
    function _isConstructor() private view returns (bool) {
        // extcodesize checks the size of the code stored in an address, and
        // address returns the current address. Since the code is still not
        // deployed when running a constructor, any checks on its code size will
        // yield zero, making it an effective way to detect if a contract is
        // under construction or not.
        address self = address(this);
        uint256 cs;
        // solhint-disable-next-line no-inline-assembly
        assembly { cs := extcodesize(self) }
        return cs == 0;
    }
}


// Dependency file: contracts/badger-sett/SettAccessControl.sol

// pragma solidity ^0.6.11;

// import "deps/@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

/*
    Common base for permissioned roles throughout Sett ecosystem
*/
contract SettAccessControl is Initializable {
    address public governance;
    address public strategist;
    address public keeper;

    // ===== MODIFIERS =====
    function _onlyGovernance() internal view {
        require(msg.sender == governance, "onlyGovernance");
    }

    function _onlyGovernanceOrStrategist() internal view {
        require(msg.sender == strategist || msg.sender == governance, "onlyGovernanceOrStrategist");
    }

    function _onlyAuthorizedActors() internal view {
        require(msg.sender == keeper || msg.sender == strategist || msg.sender == governance, "onlyAuthorizedActors");
    }

    // ===== PERMISSIONED ACTIONS =====

    /// @notice Change strategist address
    /// @notice Can only be changed by governance itself
    function setStrategist(address _strategist) external {
        _onlyGovernance();
        strategist = _strategist;
    }

    /// @notice Change keeper address
    /// @notice Can only be changed by governance itself
    function setKeeper(address _keeper) external {
        _onlyGovernance();
        keeper = _keeper;
    }

    /// @notice Change governance address
    /// @notice Can only be changed by governance itself
    function setGovernance(address _governance) public {
        _onlyGovernance();
        governance = _governance;
    }

    uint256[50] private __gap;
}


// Dependency file: contracts/badger-sett/strategies/BaseStrategy.sol


// pragma solidity ^0.6.11;

// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/token/ERC20/SafeERC20Upgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";
// import "/Users/present/code/super-sett/interfaces/uniswap/IUniswapRouterV2.sol";
// import "/Users/present/code/super-sett/interfaces/badger/IController.sol";
// import "/Users/present/code/super-sett/interfaces/badger/IStrategy.sol";

// import "contracts/badger-sett/SettAccessControl.sol";

abstract contract BaseStrategy is PausableUpgradeable, SettAccessControl {
    using SafeERC20Upgradeable for IERC20Upgradeable;
    using AddressUpgradeable for address;
    using SafeMathUpgradeable for uint256;

    event Withdraw(uint256 amount);
    event WithdrawAll(uint256 balance);
    event WithdrawOther(address token, uint256 amount);
    event SetStrategist(address strategist);
    event SetGovernance(address governance);
    event SetController(address controller);
    event SetWithdrawalFee(uint256 withdrawalFee);
    event SetPerformanceFeeStrategist(uint256 performanceFeeStrategist);
    event SetPerformanceFeeGovernance(uint256 performanceFeeGovernance);
    event Harvest(uint256 harvested, uint256 indexed blockNumber);

    address public want; // Want: Curve.fi renBTC/wBTC (crvRenWBTC) LP token

    uint256 public performanceFeeGovernance;
    uint256 public performanceFeeStrategist;
    uint256 public withdrawalFee;

    uint256 public constant MAX_FEE = 10000;
    address public constant uniswap = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D; // Uniswap Dex

    address public controller;
    address public guardian;

    function __BaseStrategy_init(
        address _governance,
        address _strategist,
        address _controller,
        address _keeper,
        address _guardian
    ) public initializer {
        __Pausable_init();
        governance = _governance;
        strategist = _strategist;
        keeper = _keeper;
        controller = _controller;
        guardian = _guardian;
    }

    // ===== Modifiers =====

    function _onlyController() internal view {
        require(msg.sender == controller, "onlyController");
    }

    function _onlyAuthorizedActorsOrController() internal view {
        require(
            msg.sender == keeper || msg.sender == strategist || msg.sender == governance || msg.sender == controller,
            "onlyAuthorizedActorsOrController"
        );
    }

    function _onlyAuthorizedPausers() internal view {
        require(msg.sender == guardian || msg.sender == strategist || msg.sender == governance, "onlyPausers");
    }

    /// ===== View Functions =====

    /// @notice Get the balance of want held idle in the Strategy
    function balanceOfWant() public view returns (uint256) {
        return IERC20Upgradeable(want).balanceOf(address(this));
    }

    /// @notice Get the total balance of want realized in the strategy, whether idle or active in Strategy positions.
    function balanceOf() public virtual view returns (uint256) {
        return balanceOfWant().add(balanceOfPool());
    }

    function isTendable() public virtual view returns (bool) {
        return false;
    }

    /// ===== Permissioned Actions: Governance =====

    function setGuardian(address _guardian) external {
        _onlyGovernance();
        guardian = _guardian;
    }

    function setWithdrawalFee(uint256 _withdrawalFee) external {
        _onlyGovernance();
        withdrawalFee = _withdrawalFee;
    }

    function setPerformanceFeeStrategist(uint256 _performanceFeeStrategist) external {
        _onlyGovernance();
        performanceFeeStrategist = _performanceFeeStrategist;
    }

    function setPerformanceFeeGovernance(uint256 _performanceFeeGovernance) external {
        _onlyGovernance();
        performanceFeeGovernance = _performanceFeeGovernance;
    }

    function setController(address _controller) external {
        _onlyGovernance();
        controller = _controller;
    }

    function deposit() public virtual whenNotPaused {
        _onlyAuthorizedActorsOrController();
        uint256 _want = IERC20Upgradeable(want).balanceOf(address(this));
        if (_want > 0) {
            _deposit(_want);
        }
        _postDeposit();
    }

    // ===== Permissioned Actions: Controller =====

    /// @notice Withdraw all funds, normally used when migrating strategies
    function withdrawAll() external virtual whenNotPaused returns (uint256 balance) {
        _onlyController();

        _withdrawAll();

        _transferToVault(IERC20Upgradeable(want).balanceOf(address(this)));
    }

    /// @notice Controller-only function to Withdraw partial funds, normally used with a vault withdrawal
    function withdraw(uint256 _amount) external virtual whenNotPaused {
        _onlyController();

        uint256 _balance = IERC20Upgradeable(want).balanceOf(address(this));

        // Withdraw some from activities if idle want is not sufficient to cover withdrawal
        if (_balance < _amount) {
            _amount = _withdrawSome(_amount.sub(_balance));
            _amount = _amount.add(_balance);
        }

        // Process withdrawal fee
        uint256 _fee = _processWithdrawalFee(_amount);

        // Transfer remaining to Vault to handle withdrawal
        _transferToVault(_amount.sub(_fee));
    }

    // NOTE: must exclude any tokens used in the yield
    // Controller role - withdraw should return to Controller
    function withdrawOther(address _asset) external virtual whenNotPaused returns (uint256 balance) {
        _onlyController();
        _onlyNotProtectedTokens(_asset);

        balance = IERC20Upgradeable(_asset).balanceOf(address(this));
        IERC20Upgradeable(_asset).safeTransfer(controller, balance);
    }

    /// ===== Permissioned Actions: Authoized Contract Pausers =====

    function pause() external {
        _onlyAuthorizedPausers();
        _pause();
    }

    function unpause() external {
        _onlyAuthorizedPausers();
        _unpause();
    }

    /// ===== Internal Helper Functions =====

    /// @notice If withdrawal fee is active, take the appropriate amount from the given value and transfer to rewards recipient
    /// @return The withdrawal fee that was taken
    function _processWithdrawalFee(uint256 _amount) internal returns (uint256) {
        if (withdrawalFee == 0) {
            return 0;
        }

        uint256 fee = _amount.mul(withdrawalFee).div(MAX_FEE);
        IERC20Upgradeable(want).safeTransfer(IController(controller).rewards(), fee);
        return fee;
    }

    /// @dev Helper function to process an arbitrary fee
    /// @dev If the fee is active, transfers a given portion in basis points of the specified value to the recipient
    /// @return The fee that was taken
    function _processFee(
        address token,
        uint256 amount,
        uint256 feeBps,
        address recipient
    ) internal returns (uint256) {
        if (feeBps == 0) {
            return 0;
        }
        uint256 fee = amount.mul(feeBps).div(MAX_FEE);
        IERC20Upgradeable(token).safeTransfer(recipient, fee);
        return fee;
    }

    /// @dev Reset approval and approve exact amount
    function _safeApproveHelper(
        address token,
        address recipient,
        uint256 amount
    ) internal {
        IERC20Upgradeable(token).safeApprove(recipient, 0);
        IERC20Upgradeable(token).safeApprove(recipient, amount);
    }

    function _transferToVault(uint256 _amount) internal {
        address _vault = IController(controller).vaults(address(want));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20Upgradeable(want).safeTransfer(_vault, _amount);
    }

    /// @notice Swap specified balance of given token on Uniswap with given path
    function _swap(
        address startToken,
        uint256 balance,
        address[] memory path
    ) internal {
        _safeApproveHelper(startToken, uniswap, balance);
        IUniswapRouterV2(uniswap).swapExactTokensForTokens(balance, 0, path, address(this), now);
    }

    function _swapEthIn(uint256 balance, address[] memory path) internal {
        IUniswapRouterV2(uniswap).swapExactETHForTokens{value: balance}(0, path, address(this), now);
    }

    function _swapEthOut(
        address startToken,
        uint256 balance,
        address[] memory path
    ) internal {
        _safeApproveHelper(startToken, uniswap, balance);
        IUniswapRouterV2(uniswap).swapExactTokensForETH(balance, 0, path, address(this), now);
    }

    /// @notice Add liquidity to uniswap for specified token pair, utilizing the maximum balance possible
    function _add_max_liquidity_uniswap(address token0, address token1) internal {
        uint256 _token0Balance = IERC20Upgradeable(token0).balanceOf(address(this));
        uint256 _token1Balance = IERC20Upgradeable(token1).balanceOf(address(this));

        _safeApproveHelper(token0, uniswap, _token0Balance);
        _safeApproveHelper(token1, uniswap, _token1Balance);

        IUniswapRouterV2(uniswap).addLiquidity(token0, token1, _token0Balance, _token1Balance, 0, 0, address(this), block.timestamp);
    }

    // ===== Abstract Functions: To be implemented by specific Strategies =====

    /// @dev Internal deposit logic to be implemented by Stratgies
    function _deposit(uint256 _want) internal virtual;

    function _postDeposit() internal virtual {
        //no-op by default
    }

    /// @notice Specify tokens used in yield process, should not be available to withdraw via withdrawOther()
    function _onlyNotProtectedTokens(address _asset) internal virtual;

    function getProtectedTokens() external virtual view returns (address[] memory);

    /// @dev Internal logic for strategy migration. Should exit positions as efficiently as possible
    function _withdrawAll() internal virtual;

    /// @dev Internal logic for partial withdrawals. Should exit positions as efficiently as possible.
    /// @dev The withdraw() function shell automatically uses idle want in the strategy before attempting to withdraw more using this
    function _withdrawSome(uint256 _amount) internal virtual returns (uint256);

    /// @dev Realize returns from positions
    /// @dev Returns can be reinvested into positions, or distributed in another fashion
    /// @dev Performance fees should also be implemented in this function
    /// @dev Override function stub is removed as each strategy can have it's own return signature for STATICCALL
    // function harvest() external virtual;

    /// @dev User-friendly name for this strategy for purposes of convenient reading
    function getName() external virtual pure returns (string memory);

    /// @dev Balance of want currently held in strategy positions
    function balanceOfPool() public virtual view returns (uint256);

    uint256[50] private __gap;
}


// Root file: contracts/badger-sett/strategies/pickle/StrategyPickleMetaFarm.sol


pragma solidity ^0.6.11;
pragma experimental ABIEncoderV2;

// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/math/MathUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";
// import "/Users/present/code/super-sett/deps/@openzeppelin/contracts-upgradeable/token/ERC20/SafeERC20Upgradeable.sol";

// import "/Users/present/code/super-sett/interfaces/curve/ICurveFi.sol";
// import "/Users/present/code/super-sett/interfaces/curve/ICurveGauge.sol";
// import "/Users/present/code/super-sett/interfaces/uniswap/IUniswapRouterV2.sol";
// import "/Users/present/code/super-sett/interfaces/uniswap/IUniswapPair.sol";

// import "/Users/present/code/super-sett/interfaces/badger/IController.sol";
// import "/Users/present/code/super-sett/interfaces/badger/IMintr.sol";
// import "/Users/present/code/super-sett/interfaces/badger/IStrategy.sol";
// import "/Users/present/code/super-sett/interfaces/pickle/IPickleJar.sol";
// import "/Users/present/code/super-sett/interfaces/pickle/IPickleChef.sol";
// import "/Users/present/code/super-sett/interfaces/pickle/IPickleStaking.sol";
// import "/Users/present/code/super-sett/interfaces/erc20/IWETH.sol";

// import "contracts/badger-sett/strategies/BaseStrategy.sol";

/* StrategyPickleMetaFarm
    A "meta-vault" strategy that deposits the want into the appropriate PickleJar. The recieved 'pWant' tokens are staked into the appropriate farm to increase rewards. Pickle gathered from this can be periodically 'recycled' into the Pickle farm to compound rewards.

    Parts of this implementation are inspired by bantegs' StrategyUniswapPairPickle for Yearn Vaults V2:
    https://github.com/banteg/strategy-uni-lp-pickle/blob/master/contracts/StrategyUniswapPairPickle.sol
*/
contract StrategyPickleMetaFarm is BaseStrategy {
    using SafeERC20Upgradeable for IERC20Upgradeable;
    using AddressUpgradeable for address;
    using SafeMathUpgradeable for uint256;

    address public pickleJar;
    uint256 public pid; // Pickle Chef Token ID
    address public curveSwap; // Curve renBtc Swap
    address public lpComponent; // wBTC for renCrv and sCrv

    address public constant pickle = 0x429881672B9AE42b8EbA0E26cD9C73711b891Ca5;
    address public constant pickleChef = 0xbD17B1ce622d73bD438b9E658acA5996dc394b0d;
    address public constant pickleStaking = 0xa17a8883dA1aBd57c690DF9Ebf58fC194eDAb66F;

    address public constant weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant wbtc = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;

    uint256 public picklePerformanceFeeGovernance;
    uint256 public picklePerformanceFeeStrategist;

    uint256 public lastHarvested;

    event NotifyWithdrawMismatch(uint256 expected, uint256 actual, uint256 remainingStaked);
    event Tend(uint256 pickleTended, uint256 wethConverted);

    event PickleHarvest(
        uint256 pickleFromStakingRewards,
        uint256 pickleFromHarvest,
        uint256 totalPickleToConvert,
        uint256 pickleRecycled,
        uint256 ethConverted,
        uint256 wethHarvested,
        uint256 lpComponentDeposited,
        uint256 lpDeposited,
        uint256 governancePerformanceFee,
        uint256 strategistPerformanceFee,
        uint256 timestamp,
        uint256 blockNumber
    );

    struct HarvestData {
        uint256 preExistingWant;
        uint256 preExistingPickle;
        uint256 pickleFromStakingRewards;
        uint256 pickleFromHarvest;
        uint256 totalPickleToConvert;
        uint256 pickleRecycled;
        uint256 ethConverted;
        uint256 wethHarvested;
        uint256 lpComponentDeposited;
        uint256 lpDeposited;
        uint256 lpPositionIncrease;
        uint256 governancePerformanceFee;
        uint256 strategistPerformanceFee;
    }

    struct TendData {
        uint256 pickleTended;
        uint256 wethConverted;
    }

    function initialize(
        address _governance,
        address _strategist,
        address _controller,
        address _keeper,
        address _guardian,
        address[4] memory _wantConfig,
        uint256 _pid,
        uint256[3] memory _feeConfig
    ) public initializer {
        __BaseStrategy_init(_governance, _strategist, _controller, _keeper, _guardian);

        want = _wantConfig[0];
        pickleJar = _wantConfig[1];
        curveSwap = _wantConfig[2];
        lpComponent = _wantConfig[3];

        pid = _pid;

        (address lp, , , ) = IPickleChef(pickleChef).poolInfo(pid);

        // // Confirm pickle-related addresses
        require(IPickleJar(pickleJar).token() == address(want), "PickleJar & Want mismatch");
        require(lp == pickleJar, "pid & Pickle jar mismatch");

        picklePerformanceFeeGovernance = _feeConfig[0];
        picklePerformanceFeeStrategist = _feeConfig[1];
        withdrawalFee = _feeConfig[2];

        // Grant infinite approval to Pickle
        IERC20Upgradeable(want).safeApprove(pickleJar, type(uint256).max);
        IERC20Upgradeable(pickleJar).safeApprove(pickleChef, type(uint256).max);
        IERC20Upgradeable(pickle).safeApprove(pickleStaking, type(uint256).max);
    }

    /// ===== View Functions =====

    function getName() external override pure returns (string memory) {
        return "StrategyPickleMetaFarm";
    }

    // TODO: Return a valid balance of pool
    function balanceOfPool() public override view returns (uint256) {
        (uint256 _staked, ) = IPickleChef(pickleChef).userInfo(pid, address(this));
        return _staked;
    }

    function isTendable() public override view returns (bool) {
        return true;
    }

    function getProtectedTokens() external override view returns (address[] memory) {
        address[] memory protectedTokens = new address[](3);
        protectedTokens[0] = want;
        protectedTokens[1] = pickleJar;
        protectedTokens[2] = pickle;
        return protectedTokens;
    }

    /// ===== Permissioned Actions: Governance =====

    function setPicklePerformanceFeeStrategist(uint256 _picklePerformanceFeeStrategist) external {
        _onlyGovernance();
        picklePerformanceFeeStrategist = _picklePerformanceFeeStrategist;
    }

    function setPicklePerformanceFeeGovernance(uint256 _picklePerformanceFeeGovernance) external {
        _onlyGovernance();
        picklePerformanceFeeGovernance = _picklePerformanceFeeGovernance;
    }

    /// ===== Internal Core Implementations =====

    function _onlyNotProtectedTokens(address _asset) internal override {
        require(want != _asset, "want");
        require(pickleJar != _asset, "pickleJar");
        require(pickle != _asset, "pickle");
    }

    /// @notice Deposit any want in the strategy into the mechanics
    /// @dev want -> pickleJar, pWant -> pWantFarm (handled in postDeposit hook)
    function _deposit(uint256 _want) internal override {
        if (_want > 0) {
            IPickleJar(pickleJar).deposit(_want);
        }
    }

    function _postDeposit() internal override {
        uint256 _jar = IERC20Upgradeable(pickleJar).balanceOf(address(this));
        if (_jar > 0) {
            IPickleChef(pickleChef).deposit(pid, _jar);
        }
    }

    /// @dev Transfer non-harvested rewards directly to rewards contract
    function _withdrawAll() internal override {
        uint256 _stakedPickle = IPickleStaking(pickleStaking).balanceOf(address(this));

        if (_stakedPickle > 0) {
            IPickleStaking(pickleStaking).exit();
        }

        // Unstake all pWant from Chef
        (uint256 _pSharesStaked, ) = IPickleChef(pickleChef).userInfo(pid, address(this));

        if (_pSharesStaked > 0) {
            IPickleChef(pickleChef).withdraw(pid, _pSharesStaked);
        }

        // Withdraw from pickle vault
        IPickleJar(pickleJar).withdrawAll();

        // Send un-harvested rewards to rewards contract
        uint256 _weth = IERC20Upgradeable(weth).balanceOf(address(this));
        uint256 _pickle = IERC20Upgradeable(pickle).balanceOf(address(this));

        IERC20Upgradeable(weth).transfer(IController(controller).rewards(), _weth);
        IERC20Upgradeable(pickle).transfer(IController(controller).rewards(), _pickle);
    }

    /// @notice Partially withdraw from strategy, unrolling rewards
    function _withdrawSome(uint256 _amount) internal override returns (uint256) {
        uint256 _before = IERC20Upgradeable(want).balanceOf(address(this));

        // Determine number of pToken shares in Chef
        (uint256 _staked, ) = IPickleChef(pickleChef).userInfo(pid, address(this));

        // Determine the amount of pTokens to withdraw to recieve the correct amount of want, based on the ratio between pTokens and want
        uint256 _withdraw = _amount.mul(1e18).div(IPickleJar(pickleJar).getRatio());

        // Banteg's Note: This could result in less amount freed because of rounding error
        IPickleChef(pickleChef).withdraw(pid, MathUpgradeable.min(_staked, _withdraw));

        // Banteg's Note: This could result in less amount freed because of withdrawal fees
        uint256 _jar = IERC20Upgradeable(pickleJar).balanceOf(address(this));
        IPickleJar(pickleJar).withdraw(_jar);

        // TODO: Test code, consider removing to save a little on gas
        uint256 _after = IERC20Upgradeable(want).balanceOf(address(this));
        if (_amount != _after.sub(_before)) {
            (uint256 _stakedAfter, ) = IPickleChef(pickleChef).userInfo(pid, address(this));
            emit NotifyWithdrawMismatch(_amount, _after.sub(_before), _stakedAfter);
        }

        // Return the actual amount withdrawn if less than requested
        return MathUpgradeable.min(_after.sub(_before), _amount);
    }

    /// @notice Harvest from strategy mechanics, realizing increase in underlying position
    function harvest() external whenNotPaused returns (HarvestData memory) {
        _onlyAuthorizedActors();

        HarvestData memory harvestData;

        harvestData.preExistingWant = IERC20Upgradeable(want).balanceOf(address(this));
        harvestData.preExistingPickle = IERC20Upgradeable(pickle).balanceOf(address(this));

        uint256 _stakedPickle = IPickleStaking(pickleStaking).balanceOf(address(this));

        // Harvest WETH Rewards & Unstake Pickle
        if (_stakedPickle > 0) {
            IPickleStaking(pickleStaking).exit();
        }

        uint256 _afterPickleStakingExit = IERC20Upgradeable(pickle).balanceOf(address(this));
        harvestData.pickleFromStakingRewards = _afterPickleStakingExit.sub(harvestData.preExistingPickle);

        // Harvest WETH gains
        IPickleStaking(pickleStaking).getReward();

        // Harvest Pickle gains
        _harvestPickle();

        harvestData.totalPickleToConvert = IERC20Upgradeable(pickle).balanceOf(address(this));

        harvestData.pickleFromHarvest = harvestData.totalPickleToConvert.sub(
            harvestData.pickleFromStakingRewards.sub(harvestData.preExistingPickle)
        );

        lastHarvested = now;

        // Convert any Pickle to ETH, after fees
        if (harvestData.totalPickleToConvert > 0) {
            harvestData.governancePerformanceFee = _processFee(
                pickle,
                harvestData.totalPickleToConvert,
                picklePerformanceFeeGovernance,
                governance
            );
            harvestData.strategistPerformanceFee = _processFee(
                pickle,
                harvestData.totalPickleToConvert,
                picklePerformanceFeeStrategist,
                strategist
            );

            harvestData.pickleRecycled = IERC20Upgradeable(pickle).balanceOf(address(this));

            address[] memory path = new address[](2);
            path[0] = pickle;
            path[1] = weth;

            _swapEthOut(pickle, harvestData.pickleRecycled, path);
        }

        harvestData.wethHarvested = IERC20Upgradeable(pickle).balanceOf(address(this));
        if (harvestData.wethHarvested > 0) {
            IWETH(weth).withdraw(harvestData.wethHarvested);
        }

        harvestData.ethConverted = address(this).balance;

        // Unwrap WETH to ETH, convert to WBTC in order to add to LP position
        if (harvestData.ethConverted > 0) {
            address[] memory path = new address[](2);
            path[0] = weth;
            path[1] = wbtc;

            _swapEthIn(harvestData.ethConverted, path);
        }

        // Add wBTC to increase LP position
        harvestData.lpComponentDeposited = IERC20Upgradeable(wbtc).balanceOf(address(this));
        if (harvestData.lpComponentDeposited > 0) {
            _safeApproveHelper(wbtc, curveSwap, harvestData.lpComponentDeposited);
            ICurveFi(curveSwap).add_liquidity([0, harvestData.lpComponentDeposited], 0);
        }

        // Deposit new want into position
        harvestData.lpDeposited = IERC20Upgradeable(want).balanceOf(address(this));
        if (harvestData.lpDeposited > 0) {
            _deposit(harvestData.lpDeposited);
            _postDeposit();
        }

        harvestData.lpPositionIncrease = harvestData.lpDeposited.sub(harvestData.preExistingWant);

        emit PickleHarvest(
            harvestData.pickleFromStakingRewards,
            harvestData.pickleFromHarvest,
            harvestData.totalPickleToConvert,
            harvestData.pickleRecycled,
            harvestData.ethConverted,
            harvestData.wethHarvested,
            harvestData.lpComponentDeposited,
            harvestData.lpDeposited,
            harvestData.governancePerformanceFee,
            harvestData.strategistPerformanceFee,
            now,
            block.number
        );
        emit Harvest(harvestData.lpPositionIncrease, block.number);

        return harvestData;
    }

    /// @notice Compound PICKLE and WETH gained from farms into more pickle for staking rewards
    /// @notice Any excess PICKLE sitting in the Strategy will be staked as well
    function tend() external whenNotPaused returns (TendData memory) {
        _onlyAuthorizedActors();

        TendData memory tendData;

        // Harvest WETH gains
        IPickleStaking(pickleStaking).getReward();
        tendData.wethConverted = IERC20Upgradeable(pickle).balanceOf(address(this));

        // Convert WETH into Pickle
        if (tendData.wethConverted > 0) {
            address[] memory path = new address[](2);
            path[0] = weth;
            path[1] = pickle;

            _swap(weth, tendData.wethConverted, path);
        }

        // Harvest Pickle from Chef
        _harvestPickle();
        tendData.pickleTended = IERC20Upgradeable(pickle).balanceOf(address(this));

        // Deposit gathered PICKLE into staking to increase WETH
        if (tendData.pickleTended > 0) {
            _safeApproveHelper(pickle, pickleStaking, tendData.pickleTended);
            IPickleStaking(pickleStaking).stake(tendData.pickleTended);
        }

        emit Tend(tendData.pickleTended, tendData.wethConverted);
        return tendData;
    }

    /// ===== Internal Helper Functions =====

    /// @notice Realize Pickle gains by depositing zero (Pickle is harvested on any deposit or withdraw)
    function _harvestPickle() internal {
        IPickleChef(pickleChef).deposit(pid, 0);
    }

    /// @dev PickleMetaFarm needs to be able to recieve ETH to execute Uni trades.
    /// @dev Only Uniswap Router is able to send ETH
    receive() external payable {}

    // require(msg.sender == uniswap, "Only accept ETH from Uniswap");
}