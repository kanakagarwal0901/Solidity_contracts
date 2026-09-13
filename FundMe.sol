// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint;
    uint public MinnimumUsd = 5e18;
    address[] public SendersList;
    mapping(address SendersAddress => uint Value) public SendersMapping;
    function fund() public payable{
        require(msg.value.conversion() >= MinnimumUsd);
        SendersList.push(msg.sender);
        SendersMapping[msg.sender] = SendersMapping[msg.sender] + msg.value;
    }
    function withdraw() public{
        for(i = 0; i<SendersList.length; i++){
            address SenderAddress = SendersList[i];
            SendersMapping[SendersAddress] = 0;
        }
    }
}
