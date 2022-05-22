// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Force {
    /*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/
}

contract ForceSend {
    function forceSend(address payable _addr) public {
        selfdestruct(_addr);
    }
}
