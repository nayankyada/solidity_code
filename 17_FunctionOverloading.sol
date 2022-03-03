// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract FunctionOverloading{
   function x(uint _x) public view returns(uint){
       return _x ;
   }
   function x(uint _x,uint _y) public view returns(uint){
       return _x + _y ;
   }
}



