pragma solidity =0.5.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract Apple is ERC20, ERC20Detailed{
    constructor(uint256 initialSupply) ERC20Detailed("Apple", "APPL", 18) public {
        _mint(msg.sender, 1 ether * initialSupply);
    }
}