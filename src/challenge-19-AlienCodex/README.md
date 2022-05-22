## Ethernaut Challenge 19

In this challenge the user is provided with a contract called [`AlienCodex.sol`](./AlienCodex.sol). The goal of this challenge is to claim the ownership of the contract.

This challenge requires user to be familiar with the following concepts.
- Solidity Integer overflow/underflow.
- Solidity storage layout.

### Solution
1. The main contract inherits `Ownable.sol` which has an address variable. The bool variable is followed just after. Therefore, the first slot of contract storage contains address & boolean combined.
2. Call the `retract()` after calling `make_contact()` function which underflows the array. The contract storage wrap around after they reached `uint256` max limit `i.e  (2 ^ 256 - 1)`.
3. We need to find the storage index that writes to slot 0 as it holds the `owner` value. Since the stoarge is wrapped around slot before `keccak256(1)` will have length of the array. That's why we need `keccak256(1)`.
```js
index = max uint256 value - keccak256(1)
// Replace X with your address
bytes32 storageValue = 0x000000000000000000000001X;
```
4. Plug `index` & `storageValue` in `revise()` function to become thw owner.

1. Run Exploit!
```sh
cd .. && forge test -vv -m test_challenge_19
```

### Additional Resources
1. [`Ethereum smart contract storage`]('https://programtheblockchain.com/posts/2018/03/09/understanding-ethereum-smart-contract-storage/')