## Ethernaut Challenge 6

In this challenge the user is provided with a contract called [`Delegate.sol`](./Delegate.sol). The goal of this challenge claim the ownership of the contract.

This challenge requires user to be familiar with the following concepts..
- Solidity `delegtecall` function & storage layout.
- Fallback functions.

### Solution

- We can simply invoke fallback of [Delegation](./Delegate.sol) which has the exact same storage variable layout as [Delegate](./Delegate.sol). It will make a `delegatecall` to [Delegate contract](./Delegate.sol) which will set the owner to out address i.e `msg.sender`.
- This storage layout is important because whenever a `delegatecall` is made to another contract `msg.sender` & `msg.value` are preserved but the storage changes will be made to the contract from which th `delegatecall` started. 
- In other word, whenever a `delegatecall` is made from `A` to function in another contract `B` that function behaves as it was the the part of the contract `A`. If any state changes are made, they are made in contract `A` storage. 

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_6
```
