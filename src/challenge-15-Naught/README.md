## Ethernaut Challenge 15

In this challenge the user is provided with a contract called [`Naught.sol`](./Naught.sol). The goal of this challenge is to transfer the tokens before the timelock period.

This challenge requires user to be familiar with the following concepts.

- Basic working of ERC20 tokens.
- `approve()` & `transferFrom()` functions.

### Solution

1. The contract has restriction on `transfer()` function & not on `transferFrom()` function. We can approve our tokens using the `approve()` function to a smart contract which will be able to transfer tokens on our behalf.
2. Deploy a contract [`Holder`](./Naught.sol).
3. Call `attack()` to transfer the token.
4. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_15
```
