pragma solidity >= 0.7.0 < 0.9.0;

contract Operator{
    // all operators are similar to other language
    function add() public view returns(uint){
        return 10 + 8;
    }

    // require function ex
    // first argument is bool based on condition
    // second argument is error msg when condition is false
    // if require condition is false it wil stop function execution and exit (like throw exception)
    function temp() public view{
        require(2>3,"condition false error msg here");
    }

    // alternative of require is revert
    // revert throws exception
    function temp2() public view{
        if(2<3){
            revert("condition false here");
        }
    }

}