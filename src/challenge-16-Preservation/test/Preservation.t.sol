// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Preservation, LibraryContract} from "../Preservation.sol";
import {PreservationAttack, PreservationAttackLib} from "../PreservationAttack.sol";

contract ContractTest is Test {
    Preservation p;
    PreservationAttackLib mlib;
    PreservationAttack attack;
    LibraryContract lib1;
    LibraryContract lib2;

    function test_challenge_16() public {
        console.log("Challenge #16");
        lib1 = new LibraryContract();
        lib2 = new LibraryContract();
        p = new Preservation(address(lib1), address(lib2));
        console.log("Owner of Preservation", p.owner());

        console.log("Library 1 address",p.timeZone1Library());

        mlib = new PreservationAttackLib();
        attack = new PreservationAttack();
        attack.attack(address(p), address(mlib));

        console.log("Library 1 address changed to",p.timeZone1Library());
        console.log("Owner of Preservation", p.owner());
    }
}
