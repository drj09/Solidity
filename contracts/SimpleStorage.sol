// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {
      //types in solidity : boolean,uint,int,address,bytes


        bool public hasFavoriteNumber = false;
        uint256 public favoriteNumber = 5;
        string favoriteNumberInText = "Five";
        int256 favoriteInt = -5;
        address myAddress = 0x542EEbB2C9472f48c1b2b134bc1B514082C46812;
        bytes32 favoriteBytes = "cat";

        uint256 fav;     //This is getting initialized to zero! 


        function store(uint256 _favoriteNumber) public virtual{
            favoriteNumber = _favoriteNumber;
            hasFavoriteNumber = true;

        }


        struct People{
            uint256 favoriteNumber;
            string name;
        }

        //creating one instance of the Peoplez
        People public person = People({favoriteNumber:2,name:"Dheeraj"});

        People[] public people;
        
        //calldata => temp storage that can't modify
        //memory => temp storage that can be modify    ( only have to use when array struct and mapping type)
        //storage => permanent variable that can be modified

        function addPerson(string memory _name,uint256 _favoriteNumber) public{
            people.push(People(_favoriteNumber,_name));
            nameToFavoriteNumber[_name] = _favoriteNumber;
        }

        mapping(string => uint256) public nameToFavoriteNumber;

        
        function retrieve() public view returns (uint256){
            return favoriteNumber;
        }





}


// 0xd9145CCE52D386f254917e481eB44e9943F39138