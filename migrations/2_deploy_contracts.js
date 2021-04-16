var Contribution = artifacts.require("./Contribution.sol");
//var NewToken = artifacts.require("./NewToken.sol");

module.exports = function(deployer, network, accounts) {
  // Use the accounts within your migrations.
  deployer.deploy(Contribution,5555, 66666,"NewToken","NTK","10",{from:accounts[0]});
 // deployer.deploy(NewToken,5555, 66666,"NewToken","NTK","10",{from:accounts[0]});
};