// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract FakeERC20 {
    function approve(address addr, uint256 amount) public pure returns (bool) {
        // Silence compiler
        {
            addr;
            amount;
        }
        return true;
    }

    function balanceOf(address account) public pure returns (uint256) {
        // Silence compiler
        {
            account;
        }
        return 1;
    }

    function transferFrom(
        address spender,
        address receiver,
        uint256 amount
    ) public pure returns (bool) {
        // Silence compiler
        {
            spender;
            receiver;
            amount;
        }
        return true;
    }
}
