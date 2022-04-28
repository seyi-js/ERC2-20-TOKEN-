
pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YourToken is ERC20{
    constructor() ERC20("SEYI ETH TOKEN", "SET"){
        _mint(msg.sender, 1000 * 10 ** 18);
    }
}