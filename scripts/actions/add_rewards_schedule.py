from config.active_emissions import emissions
import datetime
import json
import os
from scripts.actions.helpers.GeyserDistributor import GeyserDistributor
from scripts.actions.helpers.StakingRewardsDistributor import StakingRewardsDistributor
import time
import warnings

import brownie
import pytest
from brownie import Wei, accounts, interface, rpc
from config.badger_config import badger_config
from dotmap import DotMap
from helpers.constants import *
from helpers.gnosis_safe import (
    GnosisSafe,
    MultisigTx,
    MultisigTxMetadata,
    convert_to_test_mode,
    exec_direct,
    get_first_owner,
)
from helpers.registry import registry
from helpers.time_utils import days, hours, to_days, to_timestamp, to_utc_date
from helpers.utils import initial_fragments_to_current_fragments, to_digg_shares, val
from rich import pretty
from rich.console import Console
from scripts.systems.badger_system import BadgerSystem, connect_badger
from tabulate import tabulate

console = Console()
pretty.install()


def main():
    badger = connect_badger("deploy-final.json")
    admin = badger.devProxyAdmin
    multisig = badger.devMultisig
    contracts = badger.contracts_upgradeable
    deployer = badger.deployer

    expectedMultisig = "0xB65cef03b9B89f99517643226d76e286ee999e77"
    assert multisig == expectedMultisig

    rest = RewardsSchedule(badger)

    rest.setStart(to_timestamp(datetime.datetime(2021, 2, 4, 12, 00)))
    rest.setDuration(days(7))

    # TODO: Set to read from config emissions. Emit auto-compounding events & on-chain readable data in Unified Rewards Logger.

    rest.setAmounts(emissions.active)

    rest.setExpectedTotals(
        {"badger": Wei("149606.49 ether"), "digg": to_digg_shares(138.69)}
    )

    rest.printState("Week ?? - who knows anymore")

    rest.testTransactions()

    # print("overall total ", total)
    # print("expected total ", expected)

    # assert total == expected

    # console.print(
    #     "\n[green] ✅ Total matches expected {} [/green]".format(val(expected))
    # )

