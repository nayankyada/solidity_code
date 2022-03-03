pragma solidity >= 0.7.0 < 0.9.0;

// Functionmodifier is here
contract Owner{
    address owner;

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner {
       require(msg.sender == owner);
       _;
    // underscore continues with the function
    }

    modifier cost(uint price) {
       require(msg.value >= price);
       _;
    // underscore continues with the function
    }

}
contract Register is Owner{
    mapping(address => bool) public registerAddresses;
    uint price;

    constructor(uint initialPrice) public{
        price =initialPrice;
    }

    function register() public payable cost(price){
        registerAddresses[msg.sender] = true;
    }

    // onlyOwner is a function modifier here
    function changePrice(uint _price) public onlyOwner{
        price = _price;
    }
}