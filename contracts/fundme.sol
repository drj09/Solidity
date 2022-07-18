// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;
    uint256 public minimumUsd = 50 * 1e18;    // 1 * 10 ** 18

    function fund() public payable{

        //after getting library we can use this fucntion directly
        msg.value.getConversionRate();
        // require((msg.value) >= minimumUsd,"Didn't send enough !"); 

    }

    


}