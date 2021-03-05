pragma solidity ^0.5.5;

import "./MarketCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract MarketCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {

    constructor( 
        uint rate, // rate in TKNbits
        MarketCoin token, // token name
        address payable wallet, // company's fundraising wallet that holds ETH sent from users
        uint256 goal, // goal of the crowdsale
        uint256 openingTime, // testing: uint fakenow
        uint256 closingTime // testing: closingTime = fakenow + 2 minutes
        )
        
        Crowdsale(rate, wallet, token)
        MintedCrowdsale()
        CappedCrowdsale(goal)
        TimedCrowdsale(openingTime, closingTime) // testing: TimedCrowdsale(fakenow, fakenow + 2 minutes)
        RefundableCrowdsale(goal)
        
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        public
        
    {
        // constructor can stay empty
    }
}

contract MarketCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;
    

    constructor(
        // @TODO: Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet, // this address will recieve all Ether raised by the sale
        uint256 goal
        // testing: uint fakenow
    )
        public
    {
        // @TODO: create the MarketCoin and keep its address handy
        
        MarketCoin token = new MarketCoin(name, symbol, 0);
        token_address = address(token);

        // @TODO: create the MarketCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        
        MarketCoinSale token_sale = new MarketCoinCoinSale(1, token, wallet, goal, now, now + 24 weeks);  
        // testing: replace now with fakenow and replace 24 weeks with 5 minutes
        token_sale_address = address(token_sale);


        // make the MarketCoinSale contract a minter, then have the MarketCoinSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}