## Ethernaut Challenge 3

In this challenge the user is provided with a contract called [`Coinflip.sol`](./CoinFlip.sol). The goal of this challenge is win 10 times consecutively by calling the `flip()` function of the contract.

This challenge requires user to be familiar with the following concepts..

- Pseudo-Randomness in computer systems

### Solution

- The [`CoinFlip contract`](./CoinFlip.sol) has a `flip()` function which can be called with boolean parameter.
- The contract uses `blockhash(block.number) - 1`to acheive randomness. This is dangerous as pseudo-randomness can be predicted.
- This can be exploited by writing a similar contract [`CoinFlipExploit.sol`](./CoinFlipExploit.sol) that predicts the input everytime the function is called.
- We copied over the variables that are constant i.e (`FACTOR`, `blockhash(block.number) - 1`) and use them to generate the `_guess` paramter & call `flip(_guess)` on the contract to always predict the right guess.

However, I have solved this challenge [`Challenge-3`](./src/CoinFlip.sol) using a contract that can be found in [`test/CoinFlip.t.sol`](./test/CoinFlip.t.sol).

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_3
```
