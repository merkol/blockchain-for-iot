// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Registration {
    address adminAdr;

    uint256 public id = 0;
    mapping(uint256 => Device) public deviceList;

    constructor(address _adminAdr) {
        adminAdr = _adminAdr;
    }

    struct Device {
        uint256 device_id;
        string device_name;
        address deviceaddress;
    }

    modifier onlyAdmin() {
        require(msg.sender == adminAdr, "Not Admin");
        _;
    }

    function registerAccount(string memory device_name, address device_address)
        public
        onlyAdmin
    {
        deviceList[id] = Device(id, device_name, device_address);
        id++;
    }
}
