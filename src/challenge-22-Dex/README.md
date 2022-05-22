## Ethernaut Challenge 21

In this challenge the user is provided with a contract called [`Dex.sol`](./Dex.sol). The goal of this challenge is to drain token0.

### Solution
1. The problem in this contract is the way the contract quotes token prices. Initially the user is given `10 token0` & `10 token1`. The dex already has `100 token0` & `100 token1`. The initial price is `1 token0` = `1 token1`.
2. Swapping `10 token0` for `token1` gives us `20 token1` & `0 token0`. But the dex now has `110 token0` & `90 token1`. The next quote price if we swap `20 token1` for `token0` it gives us `24 token0` which is better than before.
3. Swapping tokens back & forth a few more times gives us better & better price & we drain all of the funds in the dex.

1. Run Exploit!
```sh
forge test -vv -m test_challenge_21
```