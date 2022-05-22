// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../King.sol";
import "../AttackKing.sol";

contract ContractTest is Test {
    King k;
    AttackKing attack;

    function test_challenge_9() public {
        k = new King{value: 1 ether}();
        attack = new AttackKing();

        console.log("Challenge #9");
        console.log("King Before", k._king());
        attack.claimThrone{value: 2 ether}(address(k));
        console.log("King after", k._king());
    }

    receive() external payable {}
}
