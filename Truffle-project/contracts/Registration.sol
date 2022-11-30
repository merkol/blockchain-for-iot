// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Registration {
    address public adminAdr;
    uint256 public id = 0;
    mapping(address => Device) public deviceList;

    constructor() public {
        adminAdr = msg.sender;
    }

    struct Device {
        address device_id;
        string device_name;
        bool isRegistered;
    }
    

    modifier onlyAdmin() {
        require(msg.sender == adminAdr, "Not Admin");
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
