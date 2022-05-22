// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Creator, MagicNum} from "../MagicNumber.sol";

contract ContractTest is Test {
    MagicNum m;
    Creator c;

    function test_challenge_18() public {
        console.log("Challenge #18");
        c = new Creator();
        m = new MagicNum();
        console.log("Created address =>", c.setAddress(address(m)));
        console.log("Solver address", m.solver());
    }
}
