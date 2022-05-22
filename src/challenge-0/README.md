## Ethernaut Challenge 0

In this challenge the user is provided with a contract instance upon calling the `Get Instance` button on the page. The challenge is to retrieve the `password` hidden in the contract & call `authenticate()` with a password. If the user enters correct passord the isCleared flag becomes true & level is assumed to be cleared.

This challenge requires user to be familiar with the following concepts.

- Contract Instances that allows users to interact with the blockchain.
- Basic working of Web3.JS library. i.e ABI & contract deployment.

The user needs to navigate through the contract instance by opening up chrome debugger! `Ctrl + Shift + i` & type `contract.` (notice the '.') to navigate to the list of functions available. Calling `await contract.password()` retrives the password that is `ethernaut0`. Calling `await contract.authenticate('ethernaut0')` sets the flag to true.

### I have solved it a bit differently!

However, I have solved the [`Challenge-0`](./Challenge0.sol) using a contract that can be found in [`test/Challenge0.sol`](./test/Challenge0.t.sol).

1. Run Exploit!

```sh
forge test -vv -m test_challenge_0
```

