pragma solidity >= 0.7.0 < 0.9.0;

contract learnMapping{
    // key and value - key can be string uint or bool - value can be anything
    mapping(string => uint) public myMap;

    // set string in mapping
    function setAddress(string memory _addr,uint _i) public {
        myMap[_addr] = _i;
    }
    // get string in mapping
    function getAddress(string memory _addr) public view returns(uint){
        return myMap[_addr];
    }
    function removeAddress(string memory _addr) public{
        delete myMap[_addr];
    }
}   