## Ethernaut Challenge 17

In this challenge the user is provided with a contract called [`Recovery.sol`](./Recovery.sol). The goal of this challenge is to claim the ownership of the contract.

This challenge requires user to be familiar with the following concepts.
- How Contract address is predicted or computed. 

### Solution
1. Compute the Token contract address using factory address.
2. Call `selfdestruct()` on computed address to recover funds. 

1. Run Exploit!
```sh
forge test -vv -m test_challenge_17
```

### Alternative Solution
```js
const computeAddress = ethers.utils.getContractAddress({
  from: RECOVERY_CONTRACT_ADDRESS,
  nonce: BigNumber.from(`1`),
});
```
