
pragma solidity >=0.7.0 <0.9.0;

contract Registration_v2{
    
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
    
     function signMessage(uint _nonce) public view returns (bytes32) {
        // Sign the message with the address of the node
        // and return the signature
        return keccak256(abi.encodePacked(_nonce, address(this)));
    }

    function verifySignature(uint _nonce, bytes32 signature) public view returns (bool) {
        // Verify the signature by checking if it matches the
        // keccak256 hash of the message and the node's address
        return signature == keccak256(abi.encodePacked(_nonce, address(this)));
    }

    function sendCredentials(bytes32 signature, address _adminAddr) public view {
        bool adminCondition = false;
        for(uint i = 0; i < adminAddr.length; i++){
            if (adminAddr[i] == _adminAddr){
                adminCondition = true;
            }
        }
        
        if(myAddr != _adminAddr){
            require(adminCondition == true , "Receiver is NOT Admin");
        }
        
        require(verifySignature(nonce, signature) == true, "Signature is NOT Valid");
    

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