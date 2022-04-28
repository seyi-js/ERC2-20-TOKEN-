pragma solidity >=0.6.0 <0.9.0;

import "./YourToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Vendor is Ownable{
    //Token Contract
    YourToken yourToken;


    //Token price per ETH;
    uint256 public tokensPerEth = 100;

    event BuyTokens(address buyer, uint256 ethAmount, uint256 tokenAmount);

    function setTokenAddress(address tokenAddress) public onlyOwner{
        yourToken = YourToken(tokenAddress);
    }

    function buyTokens() public payable returns (uint256 tokenAmount) {

            require(msg.value > 0, "You need atlest 1 ETH to buy some tokens.");

            uint256 amountToBuy = tokensPerEth;

            //Check if the vendor contract has enough tokens for the the transaction

            uint256 vendorBalance = yourToken.balanceOf(address(this));

            require(vendorBalance >= amountToBuy, "insufficient funds.");

            //Transfer token to the user
            (bool sent) = yourToken.transfer(msg.sender, amountToBuy);

            require(sent, "error transferring token to user.");

            emit BuyTokens(msg.sender, msg.value, amountToBuy);

            return amountToBuy;
    }


    function getTokenAddressBalance() public returns (uint256 balance){
        uint256 vendorBalance = yourToken.balanceOf(address(this));

        return vendorBalance;
    }
    

    function withdraw() public onlyOwner{
        uint256 ownerBalance = address(this).balance;
        require(ownerBalance > 0, "insufficient funds.");

         payable(msg.sender).transfer(address(this).balance);

        //require(sent, "error withdrawing.");
    }


    
}
