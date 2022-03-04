pragma solidity >= 0.7.0 < 0.9.0;

contract Event {
    // we can set indexed
    // which helps outsider to get access this event data
    // we can set only 3 property as a indexed
    // indexed propert require higher gas
    event NewTrade(uint indexed date,address from,address indexed to,uint indexed amount);

    function trade(address to,uint amount) external {
        emit NewTrade(block.timestamp,msg.sender,to,amount);
    }
}