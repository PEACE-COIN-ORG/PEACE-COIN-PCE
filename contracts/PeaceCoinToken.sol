pragma solidity ^0.6.0;

import "./AccessControl.sol";
import "./Context.sol";
import "./ERC20.sol";
import "./ERC20Burnable.sol";

/**
 * @dev {ERC20} Peace Coin Token
 *
 * REACH, to the Future of this Planet.
 * Richness cannot be measured by the amount of money.
 * If you can get anything you want,
 * and if you can go anywhere you want to, is it enough? 
 * You cannot feel “rich” without sharing your time or feelings with someone…
 * That is the reason why people support and cuddle each other.
 * Appreciate small happiness around us.
 * Then pass it to somebody next to you.
 * Somebody close to you, 
 * or somebody in the world, even if you haven’t met…
 * If every person passes “ARIGATO” one by one,
 * Our future should be much richer…
 * We will hold richness that we haven’t experienced yet…
 * With PEACE COIN.
 * Across borders and across the sea,
 * Reach, to the future of this planet.
 *
 */
contract PeaceCoinToken is Context, AccessControl, ERC20Burnable {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE` to the
     * account that deploys the contract.
     *
     * See {ERC20-constructor}.
     */
    constructor(string memory name, string memory symbol) public ERC20(name, symbol) {
    
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _setupRole(MINTER_ROLE, _msgSender());
    }

    /**
     * @dev Creates `amount` new tokens for `to`.
     *
     * See {ERC20-_mint}.
     *
     * Requirements:
     *
     * - the caller must have the `MINTER_ROLE`.
     */
    function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, _msgSender()), "ERC20Minter: must have minter role to mint");
        _mint(to, amount);
    }


    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override(ERC20) {
        super._beforeTokenTransfer(from, to, amount);
    }
}
