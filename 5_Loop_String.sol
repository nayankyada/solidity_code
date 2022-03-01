pragma solidity >= 0.7.0 < 0.9.0;

contract loop{
    uint [] public numberList = [45,545,12,8,466];
    string greetings = "hello";
    // for loop
    function getSum() public view returns(uint){
        uint sum = 0;
        for(uint i=0;i < numberList.length; i++){
            sum = sum + numberList[i];
        }
        return sum;
    }

    // accept string as arg and return it
    function getString(string memory s) public view returns(string memory){
        return s;
    }
    

    // length of string
    function getLength(string memory s) public view returns(uint){
        bytes memory stringToBytes = bytes(s);
        return stringToBytes.length;
    }
}