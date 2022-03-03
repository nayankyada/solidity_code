// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// view -> function ensure that they will not modify the state 
// pure -> function ensure that they not read or modify the state
contract MyContract{
   uint public value;

    // function that read value but not modifing any state is  -> view
    // for this type view function we have to make a call to get value weth.call()
    function getValue() public view returns(uint){
        return value;
    }

    // function that return a somthing without reading or writing any state
    function pureFunction() public pure returns(uint){
        return 4 + 4;
    }
    // setValue setting state 
    // for this type of function we have to create transaction because of modifing state eth.transaction
    function setValue(uint _value) public{
        value = _value;
    }

}
