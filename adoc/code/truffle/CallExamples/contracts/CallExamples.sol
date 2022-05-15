pragma solidity ^0.4.22;

contract calledContract {
    event callEvent(address sender, address origin, address from);
    function calledFunction() public {
        emit callEvent(msg.sender, tx.origin, this);
    }
}

library calledLibrary {
    event callEvent(address sender, address origin,  address from);
    function calledFunction() public {
        emit callEvent(msg.sender, tx.origin, this);
    }
}

contract caller {

    function make_calls(calledContract _calledContract) public {

        // Appel calledContract et callLibrary directement
        _calledContract.calledFunction();
        calledLibrary.calledFunction();

        // Appels de bas niveau utilisant l'objet d'adresse pour le contrat appelé
        require(address(_calledContract).
        call(bytes4(keccak256("calledFunction()"))));
        require(address(_calledContract).
        delegatecall(bytes4(keccak256("calledFunction()"))));
	}
}
