// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Force, ForceSend} from "../Force.sol";

contract ContractTest is Test {
    Force f;
    ForceSend fs;

    function setUp() public {
        f = new Force();
        fs = new ForceSend();
        deal(address(fs), 1 ether);
    }

    function test_challenge_7() public {
        console.log("Challange #7");
        console.log("Eth Balance of Force contract", address(f).balance);
        fs.forceSend(payable(address(f)));
        console.log("Eth Balance of Force contract", address(f).balance);
    }
}
