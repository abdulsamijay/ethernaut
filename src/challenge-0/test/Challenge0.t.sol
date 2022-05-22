// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../Challenge0.sol";

contract ContractTest is Test {
    Challenge0 c0;

    function test_Challenge_0() public {
        console.log("Challenge #0");
        c0 = new Challenge0("ethernaut0");

        // Wrong pass.
        c0.authenticate("12345");
        assert(c0.getCleared() == false);

        // Level cleared successfully.
        c0.authenticate("ethernaut0");
        assert(c0.getCleared());
    }
}
