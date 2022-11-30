const Registration_v2 = artifacts.require('/Users/merkol/Developer/blockchain-for-iot/Truffle-project/contracts/Registration_v2.sol')

var Web3 = require('web3')

var web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))

module.exports = async function(callback) {
    const reg = await Registration_v2.deployed()
    let nonce = await reg.getNonce()    
   
    
    //const hash = await web3.utils.soliditySha3(nonce)
    //const hash = web3.eth.accounts.hashMessage(nonce);
    console.log("NONCE VALIUE IS", nonce)
    //console.log("HASH VALUE IS", hash)
    const address = await reg.getAddress()
    console.log("ADDRESS VALUE IS", address)

    //const signature = await web3.eth.sign("Hello World", address)
    let sign = await web3.eth.accounts.sign(nonce, "0x8f2a55949038a9610f50fb23b5883af3b4ecb3c3bb792cbcefbd1542c692be63")
    console.log("SIGNATURE VALUE IS", sign)


    let verify = await web3.eth.accounts.recover(sign)
    console.log("VERIFY VALUE IS", verify)
    
    try{
        var result = await reg.sendCredentials(sign, '0x2dBAf1bD7109718271527a74524879fa3B54103E')
    }
    
    catch(err){
        console.log(err)
    }
    
    console.log(result)
    
    callback()
}
