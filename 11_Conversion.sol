pragma solidity >= 0.7.0 < 0.9.0;

contract learnConversion{
    // uint 16 mins 
    // low value = 0
    // high value = 2^16 -1

    // conversion to small type
    uint32 a = 0x123456;
    uint16 b = uint16(a);

    // conversion to higher type it will pad 0 to left
    uint16 c = 0x1234;
    uint32 d = uint32(a);

    // 10^18 wei -> 1 Ether
    // 1 ether = 1e18
    function test() public view returns(bool){
        // if assert condition true then only function will execute further
        assert(100000000000000000 wei == 1 ether); // similart to require and we can replace it with if(){revert()}
        return true;
    }

    function timetest() public view returns(bool){
        assert(1 minutes == 60 seconds);
        assert(24 hours == 1440 minutes);
        assert(1 days == 24 hours );
        assert(1 weeks == 7 days);
        return true;
    }

}