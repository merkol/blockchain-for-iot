const Registration_v2 = artifacts.require('/Users/merkol/Developer/blockchain-for-iot/Truffle-project/contracts/Registration_v2.sol')

var Web3 = require('web3')

// var web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))

var web3 = new Web3('http://localhost:8545')

module.exports = async function(callback) {
    const reg = await Registration_v2.deployed()
    let nonce = await reg.getNonce()
    
    
    const hash = await web3.utils.soliditySha3(nonce)
    console.log("NONCE VALIUE IS", nonce)
    console.log("HASH VALUE IS", hash)
    const address = await reg.getAddress()
    console.log("ADDRESS VALUE IS", address)
    try{
    const signature = await web3.eth.sign("Hello World", address)
    }
    catch(err){
        console.log("ERROR IS", err)
    }

    console.log("SIGNATURE VALUE IS", signature)
    /*
    try{
        var result = await reg.sendCredentials(512, '0x2dBAf1bD7109718271527a74524879fa3B54103E')
    }
    
    catch(err){
        console.log(err)
    }
    
    console.log(result)
    */
    callback()
}
