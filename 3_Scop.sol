pragma solidity >= 0.7.0 < 0.9.0;

// state variable vs local variable
contract C {

    // variable or function with public scope is accessible outside the contract and inside the contract

    uint public globaldata = 100; // state variable -> this global we can access inside any function within this contract 
    uint private privatevar = 100; // state variable -> this global we can access inside any function within this contract but not outside because of private
    uint internal ex = 10; // state ->  within contract, inherited contract not outside contract
    // external variable not usefull because we can't access within contract so


    function x() public view returns(uint){
        uint xx = 10; // local variable ->  local to this function only
        return xx;
    }
    function y() public view returns(uint){
        uint yy = 25; // local variable -> this data also local for this function only
        return yy + globaldata;
    }

    function z() public returns(uint){
        uint zz = 25;
        globaldata = 500; // changing global var here 
        // rule : function who change state of contract is not viewable and it always payable or non payable so we cant make this 
        // function as view
        // because to change the state of contract we have to create transaction and to execute it we have to pay gas
        return zz + globaldata;
    }


    // public function accessible in both side outside and inside 

    // here we made p as private function so we can't call it outside the contract so remix editor 
    // will not provide button to call this function
    function p() private view returns(string memory){
        return "p private function called inside contract only";
    }

    function q() public view returns(string memory){
        // this way we can call private function
        return p();
    }

    // external not allows to call function inside contract only allows to call outside contract
    // so we can't call this function as we have call private p function
    // remix editor provides button for this because this function accessible outside only so
    function c() external view returns(string memory){
        return "c external function called outside contract only";
    }


}

// public  ->  within contract, outside contract, inherited contract
// private -> only within contract
// internal -> within contract, inherited contract
// external -> only outside contract


// external function are accessible only outside contract
// external variable are not usefull because we can't use inside contract 