
pragma solidity >=0.7.0 <0.9.0;

contract Registration_v2{
    
    uint randNonce = 0;
    uint nonce = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % 100;
    address myAddr = msg.sender;
    mapping(address => Device) public deviceList;

    struct Device{
        address deviceAddr;
        string deviceName;
    }


    address adminAddr = 0x2dBAf1bD7109718271527a74524879fa3B54103E;

    function sendCredentials(uint signature, address _adminAddr) public view{
        require(address(_adminAddr)==address(adminAddr) , "Receiver is NOT Admin");
    }   
}