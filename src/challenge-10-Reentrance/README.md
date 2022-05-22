## Ethernaut Challenge 10

In this challenge the user is provided with a contract called [`Reentrance.sol`](./Reentrance.sol). The goal of this challenge to drain the contract.

This challenge requires user to be familiar with the following concepts.
- Checks-effects-interaction pattern

### Solution
- Create a contract [`Atatck.sol`](./Atatck.sol) that has a function to call the fallback of [`Reentrance.sol`](./Reentrance.sol) using `drain()`.
- When the ether are received in `Attack` contract it invoke its fallback function where it gives us the control over the execution.
- We call the `withdraw()` in the fallback to re-enter the contract to drain it.

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_10
```
