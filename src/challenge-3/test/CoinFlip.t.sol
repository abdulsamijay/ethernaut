// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../CoinFlip.sol";
import "../CoinFlipExploit.sol";

contract ContractTest is Test {
    CoinFlip cf;
    ExploitCoinFlip ef;

    function setUp() public {
        cf = new CoinFlip();
        ef = new ExploitCoinFlip(address(cf));
    }

    function test_challenge_3() public {
        console.log("Challenge #3");
        vm.startPrank(address(1337));
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        vm.roll(block.number + 1);
        ef.flip();
        console.log("Consecutve wins ",cf.consecutiveWins());
        vm.stopPrank();
    }
}
