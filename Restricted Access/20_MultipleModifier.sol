pragma solidity >= 0.7.0 < 0.9.0;

contract RestrictedAccess {
    address owner = msg.sender;
    uint public creationTime = block.timestamp;
    
    modifier onlyOwner(address _account){
        require(_account == msg.sender,"Sender not authorized");
        _;
    }

    modifier onlyAftert(uint _time){
        require(block.timestamp >= _time,"Function is called too early!");
        _;
    } 

    // function will change owner address only by owner using function modifier
    function changeOwnerAddress(address _address) onlyOwner(owner) onlyAftert(creationTime + 30 seconds) public  {
        owner = _address;
    }

    // write a function that can disown the current owner
    // only run the function 3 week after the creation of the contract
    function disown() onlyOwner(owner) public{
        delete owner;
    }
}