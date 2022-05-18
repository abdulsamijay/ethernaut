## Ethernaut Challenge 2 - using foundry

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

However, I have solved this challenge [`Challenge-2`](./src/Challenge2.sol) using a contract that can be found in [`test/Challenge2.sol`](./test/Challenge2.t.sol).

1. `Cd` into challenge-2/

```sh
    cd challenge-2/
```

2. Run forge build

```sh
    forge build
```

3. Exploit!

```sh
    forge test -vv -m test_challenge_2
```
