// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";

import "../Elevator.sol";

contract ContractTest is Test {
    Elevator e;
    Top t;

    function test_challenge_11() public {
        e = new Elevator();
        t = new Top();
        console.log("Is the top floor", e.top());
        t.attack(address(e));
        console.log("Is the top floor", e.top());
    }
}
