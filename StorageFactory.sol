// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    address[] public listofSimpleStoragesAddress;
    function CreateSimpleStorage() public{
        SimpleStorage mySimpleStorage = new SimpleStorage();
        listofSimpleStoragesAddress.push(address(mySimpleStorage));
    }
    function sfStore(uint _simpleStorageIndex, uint num1) public{
        address mySimpleStorage = listofSimpleStoragesAddress[_simpleStorageIndex];
        SimpleStorage(mySimpleStorage).store(num1);
    }
    function sfView(uint _simpleStorageIndex) public view returns (uint){
        address mySimpleStorage = listofSimpleStoragesAddress[_simpleStorageIndex];
        return SimpleStorage(mySimpleStorage).retrieve();
    }
}




