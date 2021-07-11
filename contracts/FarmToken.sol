pragma solidity =0.5.16;
// Custom Farming without using uniswap staking
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

    // Get the balance of user for the Farm Token.
    function balance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    
    // Deposit Token to Farm and mint the Farm Token
    function deposit(uint256 _amount) public {
    // Amount must be greater than zero
    require(_amount > 0, "amount cannot be 0");

    // Transfer MyToken to smart contract
    token.transferFrom(msg.sender, address(this), _amount);

    // Mint FarmToken to msg sender
    _mint(msg.sender, _amount);
    }

    // Withdraw Farm Token
    function withdraw(uint256 _amount) public {
    // Burn FarmTokens from msg sender
    _burn(msg.sender, _amount);

    // Transfer MyTokens from this smart contract to msg sender
    token.transfer(msg.sender, _amount);
}


}
