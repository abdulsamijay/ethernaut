## Ethernaut Challenge 20

In this challenge the user is provided with a contract called [`Denial.sol`](./Denial.sol). The goal of this challenge is to place a mechnism such that the owner cannot withdraw ether from contract even though it has it.

This challenge requires user to be familiar with the following concepts.
- Solidity `fallback()` funtion.

### Solution
1. Deploy [`Receiver`](./Denial.sol) contract that has a fallback function to receive ether. Insert an `assert(false);` statement. As it consumes all of the remaining gas & forces transaction failure. Alternatively, an infinite loop in fallback to eat gas should also work.
2. Set `partner` by calling `setWithdrawPartner()` to our deployed contract address on [`Denial`](./Denial.sol) contract.
3. The owner now will never be able to withdraw.

1. Run Exploit!
```sh
forge test -vv -m test_challenge_20
```