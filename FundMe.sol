// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint;
    uint public constant MinnimumUsd = 5e18;
    address[] public SendersList;
    mapping(address SendersAddress => uint Value) public SendersMapping;
    address public immutable OwnerAddress;
    constructor(){
        msg.sender = OwnerAddress;
    }
    function fund() public payable{
        require(msg.value.conversion() >= MinnimumUsd);
        SendersList.push(msg.sender);
        SendersMapping[msg.sender] = SendersMapping[msg.sender] + msg.value;
    }
    function withdraw() public OnlyOwner{
        for(i = 0; i<SendersList.length; i++){
            address SenderAddress = SendersList[i];
            SendersMapping[SendersAddress] = 0;
        }
        SendersList = address[](0);
        (bool CallSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(CallSuccess,"Transaction Failed");
    }
    modifier OnlyOwner(){
        require(msg.sender == OwnerAddress);
        _;
    }
    receive() external payable {
        fund();
    }
    fallback() external payable { 
        fund();
    }
}
