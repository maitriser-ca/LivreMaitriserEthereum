// Identifiant de licence SPDX : CC-BY-SA-4.0

// Version du compilateur Solidity pour lequel ce programme a été écrit
pragma solidity 0.6.4;

// Notre premier contrat est un faucet !
contract Faucet {
    // Accepte tout montant entrant
    receive() external payable {}

    // Donnez de l'éther à quiconque demande
    function withdraw(uint withdraw_amount) public {
        // Limiter le montant du retrait
        require(withdraw_amount <= 100000000000000000);

        // Envoie le montant à l'adresse qui l'a demandé
        msg.sender.transfer(withdraw_amount);
    }
}