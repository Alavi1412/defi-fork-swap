pragma solidity =0.5.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
// import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract FarmToken is ERC20, ERC20Detailed {
    using Address for address;
    using SafeMath for uint256; // As of Solidity v0.8.0, mathematical operations can be done safely without the need for SafeMath
    // using SafeERC20 for IERC20;

    IERC20 public token;

    constructor(address _token) ERC20Detailed("FarmToken", "FRM", 18) public{
        token = IERC20(_token);
    }
    // constructor(address _token) ERC20Detailed("FarmToken", "FRM", 18) public {
    //     _mint(msg.sender, 1 ether * initialSupply);
    // }
}
