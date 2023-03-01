// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


 contract NaughtCoin  {

  // string public constant name = 'NaughtCoin';
  // string public constant symbol = '0x0';
  // uint public constant decimals = 18;
  uint public timeLock = block.timestamp + 10 * 365 days;
  uint256 public INITIAL_SUPPLY;
  address public player;

  constructor(address _player) 
   {
    player = _player;
    // _totalSupply = INITIAL_SUPPLY;
    // _balances[player] = INITIAL_SUPPLY;
  }
   mapping(address => uint256) private _balances;
     function balanceOf(address account) public view returns (uint256) {
     
    }
  function transfer(address _to, uint256 _value)  public lockTokens returns(bool) {
  }
    function approve(address spender, uint256 amount) public returns (bool) {
       
    }
    function transferFrom(address from, address to, uint256 amount) public  returns (bool) {
     
    }
  // Prevent the initial owner from transferring tokens until the timelock has passed
  modifier lockTokens() {
    if (msg.sender == player) {
      require(block.timestamp > timeLock);
      _;
    } else {
     _;
    }
  } 
} 