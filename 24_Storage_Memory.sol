// storage
// solidity contract level variables store inside storage ->  something like HDD

//memory
// solidity manage variables inside memory -> RAM

// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract StorageMemory{
    int[] public numbers;

    constructor(){
        numbers.push(10);
        numbers.push(20);

        changeArray(numbers)
    }

    function changeArray(int[] storage/memory myArray) private {
        myArray[0] = 1;
    }
}


// numbers array stored in storage because it contract level state 

// constructor will add 10 and 20 and then call changeArray

// if numbers array passed with keyword

// 1. -> storage -> then change array will access storage variable and modify data
// 2. -> memory  -> then it will make a copy of numbers array from storage into memory and pass refrence of this memory number array 
//                  so it will modify memory level numbers array insted of storage level numbers array
// so is we access storage level variable we will not get expected output
