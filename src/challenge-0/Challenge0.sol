pragma solidity ^0.8.13;
import "./strings.sol";

contract Challenge0 {
    using strings for *;

    string public password;
    bool isCleared = false;

    constructor(string memory _password) {
        password = _password;
    }

    function authenticate(string memory passkey) external {
        if ((passkey.toSlice()).equals(password.toSlice())) {
            isCleared = true;
        }
    }

    function getCleared() external view returns (bool) {
        return isCleared;
    }

    function info() external pure returns (string memory) {
        return "You will find what you need in info1().";
    }

    function info2(string memory param) external pure returns (string memory) {
        if (param.toSlice().equals("".toSlice())) {
            return 'Try info2(), but with "hello" as a parameter.';
        } else if (param.toSlice().equals("hello".toSlice())) {
            return
                "The property infoNum holds the number of the next info method to call.";
        } else {
            return "wrong paramter";
        }
    }

    function info42() external pure returns (string memory) {
        return "theMethodName is the name of the next method.";
    }

    function theMethodName() external pure returns (string memory) {
        return "The method name is method7123949";
    }
}
