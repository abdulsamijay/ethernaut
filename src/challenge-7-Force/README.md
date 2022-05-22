## Ethernaut Challenge 7

In this challenge the user is provided with a contract called [`Force.sol`](./Force.sol). The goal of this challenge to send ether to the contract that has no ability to receive ether.

This challenge requires user to be familiar with the following concepts..
- Solidity `selfdestruct()` function

### Solution
- We create a contract [`ForceSend`](./Force.sol) & use selfdestruct to forcefully send the ether to the contract.
- Since the contract addresses can be predicted, it is possible to send ether to an address & later deploy a contract at it.

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_7
```
