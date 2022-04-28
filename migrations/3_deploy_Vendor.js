const Vendor = artifacts.require("Vendor");
module.exports = async function (deployer) {
  deployer.deploy(Vendor);
};
