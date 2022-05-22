// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../GatekeeperOne.sol";

contract ContractTest is Test {
    GatekeeperOne g;
    EnterGate e;

    bytes8 key;

    function setUp() public {
        g = new GatekeeperOne();
        e = new EnterGate();
        key = bytes8(0xa729821864227e84) & 0xFFFFFFFF0000FFFF;
    }

    function test_challenge_13() public {
        console.log("Challenge #13");
        // e.pass{gas: 491460}(address(g), key);
    }
}
