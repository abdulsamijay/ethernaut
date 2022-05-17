## Ethernaut Challenge 1 - using foundry

In this challenge the user is provided with a contract called [`Fallback`](./Fallback.sol). The goal of this challenge is to become the onwer of the contract & drain all the funds (Eth).

This challenge requires user to be familiar with the following concepts.

- Fallback functions & when they are triggered.
- Ownable & access control functionality.

### Solution

- The contract has a `owner` which is set when the contract is first deployed.
- There are two functions that allows `msg.sender` to become `owner` of the contract. First one is `contribute()` function which takes ether & adds it againts a mapping called contibutions. But here our contributions are negligeable to the current `owner`.
- The other option is the `fallback()` function which is automatically triggered when Eth is directly sent to the contract. the `fallback()` only checks if we have `contribution > 0` & `msg.value > 0` which is very feasible to us.
- So, First we call `contribute()` with `Eth > 0` (i.e 0.0009 Eth) this will increase our value from 0 to some positive number. Then we send `Eth > 0` (i.e 0.1 Eth) to the contract where our conditions fulfill & now we are the `owner` of the contract.
- Next, we call `withdraw()` & receive all the funds to ourself. (0x1337 in this case).

However, I have solved this challenge [`Challenge-1`](./src/Challenge1.sol) using a contract that can be found in [`test/Challenge1.sol`](./test/Challenge1.t.sol).

1. `Cd` into challenge-1/

```sh
    cd challenge-1/
```
2. Run forge build
```sh
    forge build
```
3. Exploit!
```sh
    forge test -vv -m test_challenge_1
```
