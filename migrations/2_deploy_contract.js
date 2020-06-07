var PeaceCoinToken = artifacts.require('PeaceCoinToken');
module.exports = function(deployer) {
  deployer.deploy(PeaceCoinToken);
};
