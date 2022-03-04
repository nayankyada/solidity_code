// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping(address => uint) public balances;
    event Sent(address from,address to,uint amount);
    
    constructor(){
        minter = msg.sender;
    }

    // make new coins and send them to an address
    // only owner can send these coin
    function mint(address reciever,uint amount)public {
        require(msg.sender == minter);
        balances[reciever] += amount; 
    }

    error insufficientBalance(uint requested,uint available);
    // send any amount of coin to an existing address
    function send(address reciever,uint amount) public{
        if(amount > balances[msg.sender]){
            revert insufficientBalance({
                requested:amount,
                available:balances[msg.sender]
            });
        }
        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Sent(msg.sender,reciever,amount);
    }

}