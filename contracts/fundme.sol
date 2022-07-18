// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;
    uint256 public minimumUsd = 50 * 1e18;    // 1 * 10 ** 18
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable{

        //after getting library we can use this fucntion directly
        msg.value.getConversionRate();
        // require((msg.value) >= minimumUsd,"Didn't send enough !"); 
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value; 
    }

    function withdraw() public {

        for(uint256 funderIndex = 0;funderIndex < funders.length; funderIndex = funderIndex++){
            //code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](0);
        //actually withdraw funds


        /*there are 3 ways to send Ether:
            1. transfer  :  throw error   and gas fees is 2300
            2. send      :  give boolean if transfer was successful   and gas fees is 2300 
            3. call      :  can Modifiy gas fees here
        */
        payable(msg.sender).transfer(address(this).balance);



    }



}