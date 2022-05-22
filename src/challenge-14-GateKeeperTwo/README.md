## Ethernaut Challenge 14

In this challenge the user is provided with a contract called [`GatekeeperTwo.sol`](./GatekeeperTwo.sol). The goal of this challenge is to set the `entrant` variable to `tx.origin`.

This challenge requires user to be familiar with the following concepts.
- Difference between `tx.origin` & `msg.sender`.
- Properties of XOR operations.
- Contract creation mechanism & `extcodesize()` function. 

### Solution
0. First we deploy a contract [`PassGateKeeperTwo`](./GateKeeperTwo.sol).
The function which sets `entrant` value to `tx.origin` has 3 modifiers each with its own conditions.
1. `gateOne()` simply checks if the `msg.sender` & `tx.origin` is not same. It is similar to how we solved [Telephone.sol](../challenge-4-Telephone/Telephone.sol). It can be bypassed by calling `enter()` function from a smart contract.
2. `gateTwo()` checks if the caller has code associated with the address. If so, this will revert. Meaning the caller cannot be a smart contract. This can be bypassed by calling `enter()` function from the constructor of the `PassGateKeeperTwo` contract.
3. `gateThree()` has the condition. `uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == uint64(0) - 1`. <br>
    - From properties of XOR (^), If<br> `A ^ B = C, then A ^ C = B`
```
bytes8 _gateKey = bytes8(
    uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1)
);
```

1. Run Exploit!

```sh
forge test -vv -m test_challenge_14
```
