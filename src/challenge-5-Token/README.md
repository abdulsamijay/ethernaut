## Ethernaut Challenge 5

In this challenge the user is provided with a contract called [`Token.sol`](./Token.sol). The goal of this challenge is to hack the the token contract.

### Solution

- The [`Token contract`](./Token.sol) has a `transfer()` functions that takes in an address & value.
- It has a check that should be checking for interger overflow but the condition `require(balances[msg.sender] - _value >= 0);` will always returns `0`.
- Here we also need to make sure that `msg.sender` has some tokens otherwise `balances[msg.sender] -= _value;` will be overflowed.

1. Run Exploit!

```sh
forge test -vv -m test_challenge_5
```
