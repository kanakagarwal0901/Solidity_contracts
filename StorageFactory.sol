// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public listofSimpleStorages;
    function CreateSimpleStorage() public{
        SimpleStorage mySimpleStorage = new SimpleStorage();
        listofSimpleStorages.push(mySimpleStorage);
    }
    function sfStore(uint _simpleStorageIndex, uint num1) public{
        SimpleStorage mySimpleStorage = listofSimpleStorages[_simpleStorageIndex];
        mySimpleStorage.store(num1);
    }
    function sfView(uint _simpleStorageIndex) public view returns (uint){
        SimpleStorage mySimpleStorage = listofSimpleStorages[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}




