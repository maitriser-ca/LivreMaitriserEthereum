// Version du compilateur Solidity pour lequel ce programme a été écrit
pragma solidity ^0.4.19;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';


// Un robinet pour le jeton ERC20 MET
contract METFaucet {

	StandardToken public METoken;
	address public METOwner;

	// Constructeur METFaucet, indique l'adresse du contrat METoken et
	// l'adresse du propriétaire que nous serons autorisés pour transferFrom
	function METFaucet(address _METoken, address _METOwner) public {

		// Initialise le METoken à partir de l'adresse fournie
		METoken = StandardToken(_METoken);
		METOwner = _METOwner;
	}

	function withdraw(uint withdraw_amount) public {

		// Limiter le montant du retrait à 10 MET
    	require(withdraw_amount <= 1000);

		// Utiliser la fonction transferFrom de METoken
		METoken.transferFrom(METOwner, msg.sender, withdraw_amount);
    }

	// REJETER tout éther entrant
	function () external payable { revert(); }

}
