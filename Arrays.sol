pragma solidity >= 0.7.0 < 0.9.0;

contract Array {
    uint[] public myArray;
    uint[] public myArray2;
    uint[5] public myArray3;

    function addElement(uint number) public {
        myArray.push(number);
    }

    function removeLastElement() public{
        myArray.pop();
    }

    function getLength() public view returns(uint){
        return myArray.length;
    }

    function remove(uint i) public{
        // it will make value to 0 so array length will not be change
        delete myArray[i];
    }
}

