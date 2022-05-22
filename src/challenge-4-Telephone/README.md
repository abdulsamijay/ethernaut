## Ethernaut Challenge 4

In this challenge the user is provided with a contract called [`Telephone.sol`](./Telephone.sol). The goal of this challenge claim the ownership of the contract.

This challenge requires user to be familiar with the following concepts..

- Difference between `tx.origin` & `msg.sender`

### Solution

- The [`Telephone contract`](./Telephone.sol) has a `changeOwner()` that takes in an address value. 
- The function which can be called from a custom contract that will change the `tx.origin` value from the `msg.sender` allowing us to set whatever address we want the onwer to be.

1. Run Exploit!

```sh
forge test -vv -m test_challenge_4
```
