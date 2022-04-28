let YourToken = artifacts.require("./YourToken.sol");
let Vendor = artifacts.require("./Vendor.sol");
let ethers = require("ethers");

contract("YourToken", function (accounts) {
  let TokenInstance;
  let VendorInstance;

  beforeEach(async function () {
    TokenInstance = await YourToken.deployed();

    VendorInstance = await Vendor.deployed();

    VendorInstance.setTokenAddress(TokenInstance.address);
  });

  describe("Buy Token", () => {
    it("should buy token", async () => {
      try {
        const result = await TokenInstance.balanceOf(accounts[0]);
        console.log(result);

        const result2 = await VendorInstance.getTokenAddressBalance();
        console.log(result2);
        // const response = await VendorInstance.buyTokens({
        //   value: ethers.utils.parseEther("1"),
        //   from: accounts[1],
        // });

        // console.log(response);
      } catch (error) {
        console.log(error);
      }
    });
  });
});
