## Ethernaut Challenge 11

In this challenge the user is provided with a contract called [`Elevator.sol`](./Elevator.sol). The goal of this challenge is to set the variable `top` to true.

### Solution
- Create a contract [`Top.sol`](./Top.sol) that has a function called `isLastFloor()` as it is what is expected by the Elevator contract.
- The function is called twice, at first call to `isLastFloor()` it sets the `floor` variable to our `floor` value. We return `false` here.
- Based on the `floor` value we can on the second call to `isLastFloor()` we return `true`.

1. Run Exploit!

```sh
cd .. && forge test -vv -m test_challenge_11
```
