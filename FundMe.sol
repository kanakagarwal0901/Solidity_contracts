// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint public minimumusd = 5;
    function fund() public payable{
        require(msg.value>minimumusd,"Min transact value is 1Eth");
    }
    function GetPrice() public{
        }

    function GetConversionRate() public{
    }
    function GetVersion() public view returns(uint){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    } 
}
