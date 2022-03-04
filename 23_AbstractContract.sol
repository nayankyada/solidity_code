pragma solidity >= 0.7.0 < 0.9.0;

abstract contract X {
    function y() public view virtual returns(string memory);

   
}

abstract contract z is X {
    function yy() public view returns(string memory s){
        return s;
    }
}


contract Y is z {
    function y() public override view returns(string memory){
        return "Hello";
    }
}