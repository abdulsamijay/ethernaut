// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Reentrance} from "../Reentrance.sol";
import {Attack} from "../Attack.sol";

contract ContractTest is Test {
    Reentrance r;
    Attack attack;

    function setUp() public {
        r = new Reentrance();
        attack = new Attack();
    }

    function test_challenge_10() public {
        console.log("Challenge #10");
        deal(address(1337), 0.5 ether);
        r.donate{value: 10 ether}(address(r));
        r.donate{value: 1 ether}(address(attack));
        attack.drain{value: 1 ether}(address(r));
    }
}
