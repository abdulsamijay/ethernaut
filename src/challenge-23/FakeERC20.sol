// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract FakeERC20 {
    function approve(address, uint256 amount) public returns (bool) {
        return true;
    }

    function balanceOf(address account) public returns (uint256) {
        return 1;
    }

    function transferFrom(
        address spender,
        address receiver,
        uint256 amount
    ) public returns (bool) {
        return true;
    }
}
