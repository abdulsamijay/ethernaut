// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Vault} from "../Vault.sol";

contract ContractTest is Test {
    Vault v;

    function setUp() public {
        bytes32 password = 0xb68fe43f0d1a0d7aef123722670be50268e15365401c442f8806ef83b612976b;
        v = new Vault(password);
    }

    function test_challenge_8() public {
        console.log("Challange #8");
        console.log("Contract locked ?", v.locked());
        emit log_named_bytes32("slot0 => Bool    ", v.getValueAtSlot(0));
        bytes32 slot1 = v.getValueAtSlot(1);
        emit log_named_bytes32("slot1 => Bytes32 ", slot1);
        v.unlock(slot1);
        console.log("Contract locked ?", v.locked());
    }
}
