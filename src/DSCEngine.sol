// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volatility coin

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

/**
 * @title DSCEngine
 * @author Matthew Idungafa
 * The system is designed to be as minimal as possible, and have the tokens mantain a 1 token == $1 peg.
 * This stablecoin has the properties:
 *  - Exogenous Collateral: ETH & BTC
 * Dollar Pegged
 *  Algorithmitically stable
 *
 * It is similar to DAI if DAI had no governance , no fees and was only backed by WETH and WBTC
 *
 * @notice This contract is the core of the DSC system. It handles all the logic for mining and redeeming DSC, as well as depositing & withdrawing collateral.
 * @notice This contract is VERY loosely based on the MakerDAO DSS (DAI) system.
 */

contract DSCEngine {

}
