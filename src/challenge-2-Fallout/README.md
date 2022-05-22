## Ethernaut Challenge 2

In this challenge the user is provided with a contract called [`Fallout`](./Fallout.sol). The goal of this challenge is to become the onwer of the contract & drain all the funds (Eth).

This challenge requires user to be familiar with the following concepts.

- Fallback functions & when they are triggered.
- Ownable & access control functionality.
- Attention to detail!

### Solution

- The contract has a `owner` variable.
- There are a lot of functions available for us to start from.
- If we look closely, there is a function called `Fallout()` which accepts ether & allows anybody to become onwer by sending Eth to that function.
- The user becomes the new owner of the contract.

However, I have solved the [`Fallback`](./Fallback.sol) using a contract that can be found in [`test/Challenge2.sol`](./test/Fallout.t.sol).

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_2
```
