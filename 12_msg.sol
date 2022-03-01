pragma solidity >= 0.7.0 < 0.9.0;

// some global variable -> msg,block also there are more check on official site

contract LedgerBalance {
    mapping(address => uint) balance;

    function updatesBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }

    function getBalance(address _address) public view returns(uint){
        return balance[_address];
    }
}

contract Updated{
    LedgerBalance public ledgerBalance ;
    address public owner;
    constructor(){
        ledgerBalance = new LedgerBalance();
        owner = msg.sender;
    }

    function updatesBalance() public {
        ledgerBalance.updatesBalance(50); // not able to update why?
    }
    function getBalance(address _address) public view returns(uint){
        uint temp = ledgerBalance.getBalance(_address); // not getting updated balance why?
        return temp;
    }
}