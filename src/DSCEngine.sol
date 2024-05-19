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
 * Our DSC system should always be "overcollateralized". At no point, should the value of all collateral br <= the $ backed value of all the DSC tokens.
 *
 * @notice This contract is the core of the DSC system. It handles all the logic for mining and redeeming DSC, as well as depositing & withdrawing collateral.
 * @notice This contract is VERY loosely based on the MakerDAO DSS (DAI) system.
 */

contract DSCEngine {
    ////////////////
    // Errors     //
    ////////////////
    error DSCEngine__NeedsMoreThanZero();
    error DSCEngine__TokenAddressesAndPriceFeedAddressesMustBeSameLength();

    ////////////////
    // State Variables     //
    ////////////////
    mapping(address token => address priceFeed) private s_priceFeeds; // tokenToPriceFeed

    /////////////////
    // Modifiers   //
    /////////////////
    modifier moreThanZero(uint256 amount) {
        if (amount == 0) {
            revert DSCEngine__NeedsMoreThanZero();
        }
        _;
    }

    /////////////////
    // Functions   //
    /////////////////
    constructor(
        address[] memory tokenAddresses,
        address[] memory priceFeedAddress,
        address dscAddress
    ) {
        if (tokenAddresses.length != priceFeedAddresses.length) {
            revert DSCEngine__TokenAddressesAndPriceFeedAddressesMustBeSameLength();
        }
    }

    /////////////////
    // External Functions   //
    /////////////////
    function depositCollateralAndMintDsc() external {}

    /*
     * @param tokenCollateralAddress The address of the token to deposit as collateral
     * @param amountCollateral The amount of collateral to deposit
     */

    function depositCollateral(
        address tokenCollateralAddress,
        uint256 amountCollateral
    ) external moreThanZero(amountCollateral) {}

    function redeemCollateralForDsc() external {}

    function redeemCollateral() external {}

    // Threshold to let's say 150%
    // $100 ETH -> $75 ETH
    // $50 DSC

    function mintDsc() external {}

    function burnDsc() external {}

    function liquidate() external {}

    function getHealthFactor() external view {}
}
