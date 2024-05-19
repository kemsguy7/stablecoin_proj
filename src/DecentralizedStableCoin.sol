import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/*
 * @title Decentralized Stable Coin
 * @author Matthew Idungafa
 * @notice This contract implements a stablecoin system governed by DSCEngine.
 * Collateral: Exogenous (ETH & BTC)
 * Minting: Algorithmic
 * Relative Stability: Stability pegged to USD
 */

contract DecentralizedStableCoin is ERC20Burnable, Ownable {
    // Error declarations
    error DecentralizedStableCoin__MustBeMoreThanZero();
    error DecentralizedStableCoin__BurnAmountExceedsBalance();
    error DecentralizedStableCoin__NotZeroAddress();

    // Constructor to initialize the ERC20 token with a name and symbol
    constructor() ERC20("DecentralizedStableCoin", "DSC") Ownable(msg.sender) {}

    // Function to burn a specified amount of tokens, only callable by the owner
    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender); // Get the balance of the caller
        if (_amount <= 0) {
            // Check if the burn amount is greater than zero
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }
        if (balance < _amount) {
            // Check if the caller has enough balance
            revert DecentralizedStableCoin__BurnAmountExceedsBalance();
        }
        super.burn(_amount); // Call the parent contract's burn function
    }

    // Function to mint a specified amount of tokens to a given address, only callable by the owner
    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            // Check if the recipient address is not the zero address
            revert DecentralizedStableCoin__NotZeroAddress();
        }
        if (_amount <= 0) {
            // Check if the mint amount is greater than zero
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }
        _mint(_to, _amount); // Call the parent contract's mint function to mint the tokens
        return true; // Return true to indicate success
    }
}
