// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../Token.sol";
import "../TokenExploit.sol";

contract ContractTest is Test {
    Token t;
    TokenExploit te;

    function setUp() public {
        t = new Token(100);
        te = new TokenExploit(address(t));
        t.transfer(address(te), 20);
        t.transfer(address(1337), 20);
    }

    function test_challenge_5() public {
        console.log("Initial balance of 0x1337", t.balanceOf(address(1337)));
        vm.startPrank(address(te));
        te.exploit(address(1337), 10000);
        vm.stopPrank();
        console.log("final balance of 0x1337", t.balanceOf(address(1337)));
    }
}
