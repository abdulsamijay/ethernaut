// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract GatekeeperOne {
    using SafeMath for uint256;
    address public entrant;

    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }

    modifier gateTwo() {
        require(gasleft().mod(8191) == 0);
        _;
    }

    modifier gateThree(bytes8 _gateKey) {
        /*
         * 1111 1111 1111 1111 to uint64 => 1229782938247303441 to uint32 => 286331153 (0000 0000 1111 1111)
         * 1111 1111 1111 1111 to uint64 => 1229782938247303441 to uint16 => 4369      (0000 0000 0000 1111)
         * Means last 4 bytes when converted to 32 & 16 must be the same => 0000 0000 0000 XXXX
         */
        require(
            uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)),
            "GatekeeperOne: invalid gateThree part one"
        );
        /**
         * Group =>   1    2    3    4
         * Bytes =>  0000 0000 0000 0000
         * Means value of last 8 {`3rd & 4th bytes group`} bytes when converted to 32 & 64 must not equal be same => 0000 0000 XXXX XXXX != 0000 0000 0000 XXXX
         */
        require(
            uint32(uint64(_gateKey)) != uint64(_gateKey),
            "GatekeeperOne: invalid gateThree part two"
        );
        /**
         * Means last 4 bytes must equal to last 4 bytes tx.origin's address
         * YYYY YYYY 0000 XXXX
         */
        require(
            uint32(uint64(_gateKey)) == uint16(tx.origin),
            "GatekeeperOne: invalid gateThree part three"
        );
        _;
    }

    function enter(bytes8 _gateKey)
        public
        gateOne
        gateTwo
        gateThree(_gateKey)
        returns (bool)
    {
        entrant = tx.origin;
        return true;
    }
}

contract EnterGate {
    function pass(address _addr, bytes8 key) external {
        GatekeeperOne(_addr).enter(key);
    }
}
