// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
  SimpleStorage public simplestorage;
  function createsimplestorage() public{
    simplestorage = new SimpleStorage();
  }
}
