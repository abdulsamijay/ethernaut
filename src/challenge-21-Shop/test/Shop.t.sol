// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Shop, BuyerContract} from "../Shop.sol";

contract ContractTest is Test {
    Shop s;
    BuyerContract b;

    function test_challenge_21() public {
        console.log("Challenge #21");
        s = new Shop();
        b = new BuyerContract(address(s));
        console.log("Price before", s.price());
        b.buy();
        console.log("Price After", s.price());
    }
}
