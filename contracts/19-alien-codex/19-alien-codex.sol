// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

// import '../helpers/Ownable-05.sol';

contract AlienCodex /*is Ownable*/ {

  bool public contact;
  bytes32[] public codex;

  modifier contacted() {
    assert(contact);
    _;
  }
  
  function make_contact() public {
    contact = true;
  }

  function record(bytes32 _content) contacted public {
    codex.push(_content);
  }

  function retract() contacted public {
    codex.length--;
  }

  function revise(uint i, bytes32 _content) contacted public {
    codex[i] = _content;
  }
}
// 0x0000000000000000000000000000000000000000000000000000000000000001
 // 90743482286830539503240959006302832933333810038750515972785732718729991261126, 0x0000000000000000000000AfF1f53D623289851D4a64d4DA2f64D226665F0F01

 // 25048606950485655920330026002385074919936174626890048066671851289183138378809 
 // 25048606950485655920330026002385074919936174626890048066671851289183138378810 0x000000000000000000000000AfF1f53D623289851D4a64d4DA2f64D226665F0F


 // cb371be217faa47dab94e0d0ff0840c6cbf41645f0dc1a6ae3f34447155a76f3