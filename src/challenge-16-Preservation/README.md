## Ethernaut Challenge 16

In this challenge the user is provided with a contract called [`Preservation.sol`](./Preservation.sol). The goal of this challenge is to claim the ownership of the contract.

This challenge requires user to be familiar with the following concepts.

- How `delegatecall` & storage layout works in solidity.

### Solution
1. Deploy contract [`PreservationAttack.sol`](./PreservationAttack.sol) & [`PreservationAttackLib.sol`](./PreservationAttack.sol) (which has the same storage layout as the original contract). 
2. Call `attack` function on `PreservationAttack.sol` that will call `setFirstTime()` with the `PreservationAttackLib`'s address. this will override the `timeZone1Library` address with ours.
3. Then `setFirstTime()` is called with any value that now calls `setTime()` of our library which sets the `owner` of the contract to us.


1. Run Exploit!
```sh
cd .. && forge test -vv -m test_challenge_16
```
