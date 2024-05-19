// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volitility coin

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.18;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import

/*
 * @title Decentralized Stable Coin
 * @author Matthew Idungafa
 * Collateral: Exogenous (ETH  & BTC)
 * Minting : Algorithmic
 * Relative Stability: Stability Pegged to USD
 * This is the contract meant to be governed by DSCEngine. This contract is just the ERC20 implemetation of our stablecoin system
 */

contract DecentralizedStableCoin is ERC20Burnable {
    constructor() ERC20("DecentralizedStableCoin", "DSC") {}

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
