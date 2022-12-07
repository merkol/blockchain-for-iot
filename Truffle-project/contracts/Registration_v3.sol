pragma solidity 0.8.17;

contract Registration_v3{
    
    uint randNonce = 0;
    uint nonce = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % 100;
    address myAddr = msg.sender;
    mapping(address => Device) public deviceList;

    struct Device{
        address deviceAddr;
        string deviceName;
        bool isRegistered;
    }

    function getNonce() public view returns(uint) {
        return nonce;
    }
    function getAddress() public view returns(address) {
        return myAddr;
    }
    

    address[] adminAddr = [0x2dBAf1bD7109718271527a74524879fa3B54103E,0x3c68F2cf6Fb146787e1632CA569Fcbd5f1dE9AfC,
                            0x6d15a4B9B1c734624f4f73bB23CC643a34bAA19f, 0xFaa15bb6bcb2F045Ce6E0cF4aabb858b93330F9b];
    
     function signMessage(uint _nonce, address add) public view returns (bytes32) {
        // Sign the message with the address of the node
        // and return the signature
        // signB(Nb || NodeID)!!!!
        return keccak256(abi.encodePacked(_nonce, add));
    }

    function signAdminMessage(uint _nonce, uint _nonce2, address add) public view returns (bytes32) {
        // Sign the message with the address of the node
        // and return the signature
        return keccak256(abi.encodePacked(_nonce,_nonce2, add));
    }

     function verifySignature(uint _nonce, uint _nonce2,address senderAddress, bytes32 signature) public view returns (bool) {
        // Verify the signature by checking if it matches the
        // keccak256 hash of the message and the node's address
        bytes32 signToCompare = keccak256(abi.encodePacked(_nonce,_nonce2, senderAddress));
        require(signToCompare == signature, "Signature is not valid");
        return signToCompare == signature;
    }


    function verifyAdminSignature(uint _nonce, address senderAddress, bytes32 signature) public view returns (bool) {
        // Verify the signature by checking if it matches the
        // keccak256 hash of the message and the node's address
        bytes32 signToCompare = keccak256(abi.encodePacked(_nonce, senderAddress));
        require(signToCompare == signature, "Signature is not valid");
        return signToCompare == signature;
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


    function sendCredentials(uint _nonce, bytes32 signature,address add, address _adminAddr) public view isReceiverAdmin(_adminAddr) returns (uint , bytes32, address) {
        
        return(_nonce, signature, add);
        
    }


    function sendAdminCredentials(uint _nonce, uint __nonce, bytes32 signature) public view onlyAdmin()returns (uint , uint, address, bytes32){
         return(_nonce, __nonce, myAddr, signature);
    }


   
    function registerAccount(string memory device_name, address device_id)
        public
        onlyAdmin
    {
        require(
            deviceList[device_id].isRegistered == false,
            "Device already registered"
        );
        deviceList[device_id] = Device(device_id, device_name,true);
    }

    
    
}