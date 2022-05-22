// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MagicNum {
    address public solver;

    constructor() public {}

    function setSolver(address _solver) public {
        solver = _solver;
    }

    /*
    ____________/\\\_______/\\\\\\\\\_____        
     __________/\\\\\_____/\\\///////\\\___       
      ________/\\\/\\\____\///______\//\\\__      
       ______/\\\/\/\\\______________/\\\/___     
        ____/\\\/__\/\\\___________/\\\//_____    
         __/\\\\\\\\\\\\\\\\_____/\\\//________   
          _\///////////\\\//____/\\\/___________  
           ___________\/\\\_____/\\\\\\\\\\\\\\\_ 
            ___________\///_____\///////////////__
  */
}

contract Creator {
    function setAddress(address _magicNumAddress) external returns (address) {
        bytes32 salt = keccak256(abi.encodePacked("CREATOR"));
        bytes
            memory bytecode = "0x602a60805160206000f3600a600a600af3600a6000f3";
        address contractAddr;
        assembly {
            /**
             * Using Create2 OPCODE
             */
            contractAddr := create2(
                0,
                add(mload(bytecode), 0x20),
                mload(bytecode),
                salt
            )

            /**
             * Using Create OPCODE
             * contractAddr := create(0, add(mload(bytecode), 0x20), mload(bytecode))
             */
        }
        MagicNum(_magicNumAddress).setSolver(contractAddr);
        return contractAddr;
    }
}
