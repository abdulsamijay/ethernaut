// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../Telephone.sol";
import "../TelephoneExploit.sol";

contract ContractTest is Test {
    Telephone t;
    TelephoneExploit te;

    function setUp() public {
        t = new Telephone();
        te = new TelephoneExploit(address(t));
    }

    function test_challenge_4() public {
        console.log("Challenge #4");
        console.log("Onwner Of telephone before", t.owner());

        vm.startPrank(address(1337));
        te.forwardCall(address(1337));
        vm.stopPrank();

        console.log("Onwner of telephone before", t.owner());
    }
}
