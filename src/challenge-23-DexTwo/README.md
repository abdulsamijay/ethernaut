## Ethernaut Challenge 22

In this challenge the user is provided with a contract called [`DexTwo.sol`](./DexTwo.sol). The goal of this challenge is to drain token0 & token1 from the dex.

### Solution
1. The [`DexTwo`](./DexTwo.sol) contract has no criteria to check against paired token.
2. This can be exploited by creating a custom ERC20 [`FakeERC20.sol`](./FakeERC20.sol) token that mimicks functions as a normal ERC20 & always returns 1 while checking the balance. This is important because we dont want the denominator to be zero while draining or our transaction will fail. i,e `( price = x * y / 1 = x * y )`
3. Swap our `fakeToken` for `token0` to drain `token0`.
4. Swap our `fakeToken` for `token1` to drain `token1`.

1. Run Exploit!
```sh
forge test -vv -m test_challenge_22
```