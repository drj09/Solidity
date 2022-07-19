// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


contract FallbackExample{
    uint256 public result;

    // invoked when someone send pay from outside and it only work whenn there is no data in transaction  
    receive() external payable{
        result = 1;
    }

    // invoked when data is present

    fallback() external payable{
        result = 2;
    }
     



}



