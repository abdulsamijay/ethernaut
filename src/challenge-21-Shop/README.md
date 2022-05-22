## Ethernaut Challenge 21

In this challenge the user is provided with a contract called [`Shop.sol`](./Shop.sol). The goal of this challenge is to set the variable `price` to be less than 100.

### Solution
- Create a contract [`BuyerContract.sol`](./BuyerContract.sol) that has a function called `price()` as it is what is expected by the `Shop` contract.
- The `price()` function is called twice, at first call to `price()` it sets the `isSold` variable to our `price` value. We return `101` to pass the condition.
- Based on the `isSold` value we can on the second call to `price()`, return `0`.

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_21
```
