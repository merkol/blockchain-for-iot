// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Authentication {
    uint randNonce = 0;
    uint token = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % 100;
    address myAddr = msg.sender;

    address[] adminAddr = [0x2dBAf1bD7109718271527a74524879fa3B54103E,0x3c68F2cf6Fb146787e1632CA569Fcbd5f1dE9AfC,
                            0x6d15a4B9B1c734624f4f73bB23CC643a34bAA19f, 0xFaa15bb6bcb2F045Ce6E0cF4aabb858b93330F9b];

    function getToken() public view returns(uint) {
        return token;
    }
    function getAddress() public view returns(address) {
        return myAddr;
    }
    function signAdminMessage(uint _nonce, uint _token ) public view returns (bytes32) {
        // Sign the message with the address of the node
        // and return the signature
        // signB(Nb || NodeID)!!!!
        return keccak256(abi.encodePacked(_nonce, _token));
    }

    function verifySignature(uint _nonce, uint _token , bytes32 signature) public view returns (bool) {
        // Verify the signature by checking if it matches the
        // keccak256 hash of the message and the node's address
        bytes32 signToCompare = keccak256(abi.encodePacked(_nonce, _token));
        require(signToCompare == signature, "Signature is not valid");
        return signToCompare == signature;
    }
    function signMessage(uint _token, address add ) public view returns (bytes32) {
        // Sign the message with the address of the node
        // and return the signature
        // signB(Nb || NodeID)!!!!
        return keccak256(abi.encodePacked(_token, add));
    }

    function verifyAdminSignature(uint _token , address add,  bytes32 signature) public view returns (bool) {
        // Verify the signature by checking if it matches the
        // keccak256 hash of the message and the node's address
        bytes32 signToCompare = keccak256(abi.encodePacked(_token, add));
        require(signToCompare == signature, "Signature is not valid");
        return signToCompare == signature;
    }



     modifier onlyAdmin() {
        bool adminCondition = false;
        for(uint i = 0; i < adminAddr.length; i++){
            if (adminAddr[i] == myAddr){
                adminCondition = true;
            }
        }
        require(adminCondition == true, "Not Admin");
        _;
    }
    modifier isReceiverAdmin(address adminAddress){
        bool adminCondition = false;
        for(uint i = 0; i < adminAddr.length; i++){
            if (adminAddr[i] == adminAddress){
                adminCondition = true;
            }
        }
        
        require(adminCondition == true, "Receiver is not an Admin");
        _;
    }
    
    function sendCredentials(uint _token, bytes32 signature,address add, address _adminAddr) public view isReceiverAdmin(_adminAddr) returns (uint , bytes32, address) {
        
        return(_token, signature, add);
        
    }

    function sendAdminCredentials(uint _nonce, uint _token, bytes32 signature) public view onlyAdmin()returns (uint , uint, address, bytes32){
         return(_nonce, _token, myAddr, signature);
    }
}