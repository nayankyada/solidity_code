pragma solidity >= 0.7.0 < 0.9.0;

contract DecisionMaking{
    uint oranges = 5;
    function testOranges(uint temp) public view returns(bool){
        if(oranges >= temp){
            return true;
        }
        else{
            return false;
        }
    }
}