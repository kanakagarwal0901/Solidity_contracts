// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";
contract AddFive is SimpleStorage{
  function store(uint num1) public override{
    myFavoriteNumber = num1 + 5;
  }
}
