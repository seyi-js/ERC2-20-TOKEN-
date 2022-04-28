const YourToken = artifacts.require("YourToken");

module.exports = async function (deployer) {
  const t = deployer.deploy(YourToken);
  console.log(await t);
};
