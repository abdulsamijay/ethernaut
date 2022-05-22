## Ethernaut Challenge 8

In this challenge the user is provided with a contract called [`Vault.sol`](./Vault.sol). The goal of this challenge to unlock the vault.

This challenge requires user to be familiar with the following concepts.

- Storage or slot packing technique while contract creation.

### Solution

- Private variables of a contract cannot be accessed from another smart contract unless it is inherting the contract. But contract storage slots can be accessed off-chain through an ethereum RPC endpoint using.

```js
const provider = new providers.JsonRpcProvider(
  { url: YOUR_ETHEREUM_RPC_URL },
  1
);
let pass = await provider.getStorageAt("YOU_INSTANCE_ADDRESS", 1);
console.log("The password is :", pass);
```

### Alternative solution
- For demostrative pruposes, I have created a function call `getValueAtSlot()` in [`Vault.sol`](./Vault.sol) to get the storage at slot `1` as it is where the value of the `password` in bytes32 is stored.

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_8
```
