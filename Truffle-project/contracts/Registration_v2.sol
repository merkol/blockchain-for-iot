
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


    address[] adminAddr = [0x2dBAf1bD7109718271527a74524879fa3B54103E,0x3c68F2cf6Fb146787e1632CA569Fcbd5f1dE9AfC,
                            0x6d15a4B9B1c734624f4f73bB23CC643a34bAA19f, 0xFaa15bb6bcb2F045Ce6E0cF4aabb858b93330F9b]
;
    function sendCredentials(uint signature, address _adminAddr) public {
        bool adminCondition = false;
        for(uint i = 0; i < adminAddr.length; i++){
            if (adminAddr[i] == _adminAddr){
                adminCondition = true;
            }
        }   
        require(adminCondition == true , "Receiver is NOT Admin");
    }
}