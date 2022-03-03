// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// Define a Fallback function
// 1. Connot have a name
// 2. Does not take any input
// 3. Does not return any output
// 4. Must be declared as external

// when it will be executed
// after running given 2 point (execute after call,transfer,send and function that does'nt exist)
// 1. when we call a function that doesn't exist in contract
// 2. wh

contract FallBack{
    event Log(uint gas);
    fallback () external payable {
        // do not recommended to write much code because it will fail if it uses much gas
        // fallback function has 2300 gas and it will be used to execute
        emit Log(gasleft());
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}


// new contract will send ether to fallback contract which will triger fallback function
// we send ether to Fallback contract so we need to deploy fallback contract and pass contract address to this 
contract SendToFallBack{
    function transferToFallBack(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function callFallBack(address payable _to) public payable{
        (bool sent,) = _to.call{value:msg.value}('');
        require(sent," Faild To send!");
    }
}