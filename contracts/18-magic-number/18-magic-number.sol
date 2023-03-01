// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MagicNum {

  address public solver;

  constructor() {}

  function setSolver(address _solver) public {
    solver = _solver;
  }

  /*
    ____________/\\\_______/\\\\\\\\\_____        
     __________/\\\\\_____/\\\///////\\\___       
      ________/\\\/\\\____\///______\//\\\__      
       ______/\\\/\/\\\______________/\\\/___     
        ____/\\\/__\/\\\___________/\\\//_____    
         __/\\\\\\\\\\\\\\\\_____/\\\//________   
          _\///////////\\\//____/\\\/___________  
           ___________\/\\\_____/\\\\\\\\\\\\\\\_ 
            ___________\///_____\///////////////__
  */
}

contract AttackMagic {
    constructor() {
        assembly {
            mstore(0, hex"602a3d5260203df3") 
            return (0, 8)
        }
    }
}
//69602a60005260206000f3600052600a6016f3
//0x2dA156Ba86A96d117b3287528865AF8e96b00238
// 0x602A60005260206000F3 0x136f4b078baD0CfAb7EE9f85CCaebFF8813fBFD8