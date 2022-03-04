pragma solidity >= 0.7.0 < 0.9.0;

// function modifier to restrict user to call function
contract Demo {
    address owner = msg.sender;
    uint public creationTime = block.timestamp;
    
    modifier onlyOwner(address _account){
        require(_account == msg.sender,"Sender not authorized");
        _;
    }
    
    function changeOwnerAddress(address _address) onlyOwner(owner) public  {
        owner = _address;
    }
}