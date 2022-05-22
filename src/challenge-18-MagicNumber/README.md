Runtime op-code that will be stored
    PUSH1 0x42  // 602a
    PUSH1 0x00  // 6080
    MSTORE      // 51
    PUSH1 0x20  // 6020
    PUSH1 0x00  // 6000
    RETURN      // f3

    combined => 602a60805160206000f3 // Exactly 10 bytes

Initialization Opcode
    PUSH1 0x0a {size}               // 600a
    PUSH1 0x0c {position}           // 600a
    PUSH1 0x00 {destination}        // 600a
    RETURN                          // f3
    PUSH1 0x0a {length of code}     // 600a
    PUSH1 0x00 {Stored location}    // 6000
    RETURN                          // f3

    combined => 600a600a600af3600a6000f3 

Final sequence => 0x602a60805160206000f3600a600a600af3600a6000f3