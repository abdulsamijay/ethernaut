// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {PassGateKeeperTwo, GateKeeperTwo} from "../GateKeeperTwo.sol";

contract ContractTest is Test {
    GateKeeperTwo g;
    PassGateKeeperTwo p;

    function setUp() public {
        g = new GateKeeperTwo();
    }

    function test_challenge_14() public {
        console.log("Challenge #14");
        console.log("Entrant address", g.entrant());
        p = new PassGateKeeperTwo(address(g));
        console.log("Entrant address", g.entrant());
    }
}
