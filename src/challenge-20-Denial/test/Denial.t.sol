// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Denial, Receiver} from "../Denial.sol";

contract ContractTest is Test {
    Denial d;
    Receiver r;

    function test_challenge_20() public {
        console.log("Challenge #20");
        d = new Denial();
        r = new Receiver();
        address(d).call{value: 1 ether}("");
        d.setWithdrawPartner(address(r));
        console.log("addr d", d.partner());
        
        // Will always Fail! Uncomment to run the test.
        //d.withdraw{gas: 1000000}();
    }
}
