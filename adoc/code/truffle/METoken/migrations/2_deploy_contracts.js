var METoken = artifacts.require("METoken");

module.exports = function(deployer) {
  // Déployer le contrat METoken comme seule tâche
  deployer.deploy(METoken);
};
