## Ethernaut Challenge 9

In this challenge the user is provided with a contract called [`King.sol`](./King.sol). The goal of this challenge to become the king in such a way that no one should be able to overpay & become the king.

This challenge requires user to be familiar with the following concepts.
- Solidity `fallback()` funtion.

### Solution
- Create a contract [`AttackKing.sol`](./AttackKing.sol) that has a function to call the fallback of [`King.sol`](./King.sol).
- We also include a `fallback()` function in out contract for handling event when receiving Eth. And force the transaction to fail is anyone send ether to it by `require(false, "Can't overthrow me!");` to never be overthrown.
- We call the [`AttackKing.sol`](./AttackKing.sol) with amount of eth that is greater than `prize` which makes our contract the king.

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_9
```
