pragma solidity =0.5.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract Pear is ERC20, ERC20Detailed{
    constructor(uint256 initialSupply) ERC20Detailed("Pear", "PEAR", 18) public {
        _mint(msg.sender, initialSupply);
    }
}