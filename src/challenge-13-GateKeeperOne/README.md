## Ethernaut Challenge 13

In this challenge the user is provided with a contract called [`GatekeeperOne.sol`](./GatekeeperOne.sol). The goal of this challenge is to set the `entrant` variable to `tx.origin`.

This challenge requires user to be familiar with the following concepts.

- Difference between `tx.origin` & `msg.sender`.
- How `gasleft()` is used in solidity.
- How solidity type casting works.

### Solution

The function which sets `entrant` value to `tx.origin` has 3 modifiers each with its own conditions.

1. `gateOne()` simply checks if the `msg.sender` & `tx.origin` is not same. It is similar to how we solved [Telephone.sol](../challenge-4-Telephone/Telephone.sol). It can be bypassed by calling that function from a smart contract.
2. `gateTwo()` checks if amount of gas left for execution should be divisible by `8191`.
3. `gateThree()` requires key that is of bytes8 which check for 3 conditions.
   1. `uint32(uint64(_gateKey)) == uint16(uint64(_gateKey))`.<br> - Left hand of the condition casts `bytes8` to `uint64` then to `uint32`. <br>
      Assuming `A` = 0x 1111 1111 (bytes8) <br>
      Casting `A` to `uint64` = 0x 1111 1111 1111 1111 = 1229782938247303441 <br>
      Then casting `A` to `uint32` it becomes 0x 0000 0000 1111 1111 <br> - Right Hand of the condition casts `bytes8` to `uint64` then to `uint16`<br>
      Assuming `A` = 0x 1111 1111 (bytes8) <br>
      Casting `A` to `uint64` = 0x 1111 1111 1111 1111 = 1229782938247303441 <br>
      Then casting `A` to `uint16` it becomes 0x 0000 0000 0000 1111 <br>
      Simplified, it means bits from 9-12 must be zero.
   2. `uint32(uint64(_gateKey)) != uint64(_gateKey)` <br>
      - This simply states first 8 bits in `bytes8` cannot be equal to last 8 bits of `bytes8`.
   3. `uint32(uint64(_gateKey)) == uint16(tx.origin)` <br>
      Means last 2 bytes must equal to last 2 bytes `tx.origin's` address.
4. To sum it up, the we need `bytes8` such that the following holds `0x 1000 0000 0000 <2 bytes of tx.origin>`.
5. Now we need to specify gas while calling te function this can be bruteforced on local enviroment.

6. Run Exploit!

```sh
forge test -vv -m test_challenge_13
```

### Other resource related to this challenge!

1. Another solution by masking. [`Nicole Zhu`]("https://medium.com/coinmonks/ethernaut-lvl-13-gatekeeper-1-walkthrough-how-to-calculate-smart-contract-gas-consumption-and-eb4b042d3009"). <br>

```js
bytes8 key = bytes8(0x000000000000abcd) & 0xFFFFFFFF0000FFFF // replace 'abcd' with last 2 bytes of your tx.origin address
```
