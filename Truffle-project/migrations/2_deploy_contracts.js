const Registration = artifacts.require("Registration");
const Authentication = artifacts.require("Authentication");
const Registration_v2 = artifacts.require("Registration_v2");
module.exports = function(deployer) {
  deployer.deploy(Registration);
  deployer.deploy(Authentication);
  deployer.deploy(Registration_v2);
};
