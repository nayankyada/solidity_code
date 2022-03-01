pragma solidity >= 0.7.0 < 0.9.0;

// some global variable -> msg,block also there are more check on official site

contract Block {
    uint public storedData;
    uint public time;
    uint public blocknumber;
    function setData() public {
        storedData = block.difficulty;
        time = block.timestamp;
        blocknumber = block.number;
    }
}