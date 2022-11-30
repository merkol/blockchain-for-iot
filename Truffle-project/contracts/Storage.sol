pragma solidity ^0.8.7;

contract Storage {
    uint public data;

    function set(uint _data) external {
        data = _data;
    }
}