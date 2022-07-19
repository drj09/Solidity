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
      // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \ 
    //         yes  no
    //         /     \
    //    receive()?  fallback() 
    //     /   \ 
    //   yes   no
    //  /        \
    //receive()  fallback()



}



