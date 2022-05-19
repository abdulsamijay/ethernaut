// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../Privacy.sol";

contract ContractTest is Test {
    Privacy p;

    function test_challenge_12() public {
        bytes32[3] memory data;
        data[0] = keccak256(abi.encode(1));
        data[1] = keccak256(abi.encode(1));
        data[2] = keccak256(abi.encodePacked("Evil"));
        p = new Privacy(data);
        console.log("Locked ?", p.locked());

        emit log_named_bytes32("slot 0", p.getValueAtSlot(0));
        emit log_named_bytes32("slot 1", p.getValueAtSlot(1));
        emit log_named_bytes32("slot 2", p.getValueAtSlot(2));
        emit log_named_bytes32("slot 3", p.getValueAtSlot(3));
        emit log_named_bytes32("slot 4", p.getValueAtSlot(4));
        emit log_named_bytes32("slot 5", p.getValueAtSlot(5));
        emit log_named_bytes32("slot 6", p.getValueAtSlot(6));

        bytes16 key = bytes16(p.getValueAtSlot(5));
        p.unlock(key);
        console.log("Locked ?", p.locked());
    }
}
