const Registration = artifacts.require("Registration");
const Authentication = artifacts.require("Authentication");
//const Storage = artifacts.require("Storage");
module.exports = function(deployer) {
  //const adminAddress = '0x2dBAf1bD7109718271527a74524879fa3B54103E'
  deployer.deploy(Registration);
  deployer.deploy(Authentication);
  //deployer.deploy(Storage);
};