var NewToken = artifacts.require("./NewToken.sol");


module.exports = function(deployer, network, accounts) {
  // Use the accounts within your migrations.
  deployer.deploy(NewToken, 5555, 6566);
}