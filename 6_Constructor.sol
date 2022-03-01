pragma solidity >= 0.7.0 < 0.9.0;

contract Parent {
    string public str;
    uint public num = 0;
    // executed only once when contract deploy
    // only one constructor per contract
    // can be public or internal
    // in case no constructor defined, a default constructor is present
    constructor(string memory s,uint n) public{
        str = s;
        num = n;
    }
}

// Child contract inherits Parent contract
// method_1 ->  call super class constructor
contract Child is Parent ("Child",101) {
    function getName() public view returns(string memory){
        return str;
    }
}

// method_2 ->  call super class constructor
contract Child2 is Parent{
    uint public chil ;
    constructor(string memory s,uint n,uint c) Parent(s,n) public {
        chil = c;
    }
    function getName() public view returns(string memory){
        return str;
    }
}