// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Basic {
    // global var
    uint global = 5 ;

    // function function-name(pram-list) scope returns(){
    // statements }
    function temp() public pure returns(uint){
        // variables writting here are local to this function
        uint a = 10; // local variable
        uint b = 20; // local variable
        return a + b;
    }

    function sum(uint a,uint b) public view returns(uint){
        return a + b + global; // global is global variable
    }
}