const Registration_v2 = artifacts.require('/Users/merkol/Developer/blockchain-for-iot/Truffle-project/contracts/Registration_v2.sol')

var Web3 = require('web3')

var web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:8545'))

module.exports = async function(callback) {
    const reg = await Registration_v2.deployed()
    const nonce = await reg.getNonce()
    const address = await reg.getAddress()
    console.log('Node address is ', await reg.getAddress())
    const signature = await reg.signMessage(10)
    try{
    const credentials = await reg.sendCredentials(signature, '0x2dBAf1bD7109718271527a74524879fa3B54103E')
    console.log('Node Credentials are ', credentials)
    }
    catch(err){
       console.log('Node Credentials are invalid')
       console.log(err)

    }
    const adminReg = await Registration_v2.new()
    const adminAddress = await adminReg.getAddress()
    console.log('Admin address is ', adminAddress)

    const adminSignature = await adminReg.signMessage(await adminReg.getNonce())
    try{
    const adminCredentials = await adminReg.sendCredentials(adminSignature, '0x2dBAf1bD7109718271527a74524879fa3B54103E')
    console.log('Admin credentials are ', adminCredentials)
    }
    catch(err){
        console.log('Admin credentials are invalid')
    }

    await adminReg.registerAccount("owen" , address)   
    console.log('Device list', await adminReg.deviceList(address))
    


   
    
    
   
    
    callback()
}
