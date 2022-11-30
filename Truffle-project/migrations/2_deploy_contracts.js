const Registration = artifacts.require("Registration");
const Authentication = artifacts.require("Authentication");
const Registration_v2 = artifacts.require("Registration_v2");
//const Storage = artifacts.require("Storage");
module.exports = function(deployer) {
  deployer.deploy(Registration);
  deployer.deploy(Authentication);
  deployer.deploy(Registration_v2);
  // deneme
  //deployer.deploy(Storage);
};
