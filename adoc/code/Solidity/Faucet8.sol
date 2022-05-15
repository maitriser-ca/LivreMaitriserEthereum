// Identifiant de licence SPDX : CC-BY-SA-4.0

// Version du compilateur Solidity pour lequel ce programme a été écrit
pragma solidity ^0.6.4;

contract Owned {
    address payable owner;

    // Constructeur de contrat : définit le propriétaire
    constructor() public {
        owner = msg.sender;
    }

    // Modificateur de contrôle d'accès
    modifier onlyOwner {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }
}

contract Mortal is Owned {
    // Destructeur de contrat
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

contract Faucet is Mortal {
    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    // Accepte tout montant entrant
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    // Donnez de l'éther à quiconque demande
    function withdraw(uint withdraw_amount) public {
        // Limiter le montant du retrait
        require(withdraw_amount <= 0.1 ether);

        require(
            address(this).balance >= withdraw_amount,
            "Insufficient balance in faucet for withdrawal request"
        );

        // Envoie le montant à l'adresse qui l'a demandé
        msg.sender.transfer(withdraw_amount);

        emit Withdrawal(msg.sender, withdraw_amount);
    }
}
