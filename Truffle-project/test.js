const Registration_v3 = artifacts.require('/Users/merkol/Developer/blockchain-for-iot/Truffle-project/contracts/Registration_v3.sol')
const Authentication = artifacts.require('/Users/merkol/Developer/blockchain-for-iot/Truffle-project/contracts/Authentication.sol')
const KeyExchange = artifacts.require('/Users/merkol/Developer/blockchain-for-iot/Truffle-project/contracts/KeyExchange.sol')


var Web3 = require('web3')

var web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:8545'))

module.exports = async function(callback) {
    const reg = await Registration_v3.deployed()
    const nonce = await reg.getNonce()
    const address = await reg.getAddress()
    
    console.log("Node nonce is: ", nonce)
    console.log('Node address is ', address)
    
    const adminReg = await Registration_v3.new({from : "0x2dBAf1bD7109718271527a74524879fa3B54103E"})
    const adminNonce = await adminReg.getNonce()
    const adminAddress = await adminReg.getAddress()

    console.log('Admin nonce is ', adminNonce)
    console.log('Admin address is ', adminAddress)

    const signature = await reg.signMessage(nonce, address);
    const credentials = await reg.sendCredentials(nonce, signature, address, adminAddress)
        
    const nodeBverification = await adminReg.verifyAdminSignature(credentials[0], credentials[2], credentials[1])
    const nb = credentials[0]
    console.log('Node B verification is ', nodeBverification)
    
    const adminSignature = await adminReg.signAdminMessage(credentials[0], adminNonce ,adminAddress);
    const adminCredentials = await adminReg.sendAdminCredentials(credentials[0], adminNonce , adminSignature)
    
    const adminVerification = await reg.verifySignature(adminCredentials[0], adminCredentials[1], adminCredentials[2], adminCredentials[3])

    console.log("Admin verification is ", adminVerification)
    
    const secondSign = await reg.signMessage(adminCredentials[1], adminCredentials[2]);
    const secondCredentials = await reg.sendCredentials(adminCredentials[1], secondSign, adminCredentials[2], adminAddress)

    const secondVerification = await adminReg.verifyAdminSignature(secondCredentials[0], secondCredentials[2], secondCredentials[1])

    console.log('Second verification is ', secondVerification)

    await adminReg.registerAccount("owen" , address)

    console.log('Device list', await adminReg.deviceList(address))


    //-------------------------------------------------------------------- END OF REGISTRATION --------------------------------------------------------------------//
   
    const auth = await Authentication.deployed()
    const authAdmin = await Authentication.new({from : "0x2dBAf1bD7109718271527a74524879fa3B54103E"})
    
    const adminAuthSign = await authAdmin.signAdminMessage(nb, await authAdmin.getToken())
   

    console.log('Admin auth sign is ', adminAuthSign)
    const adminAuthCredentials = await authAdmin.sendAdminCredentials(nb, await authAdmin.getToken(), adminAuthSign)
    console.log(adminAuthCredentials[1])

    const adminAuthVerification = await auth.verifySignature(adminAuthCredentials[0], adminAuthCredentials[1], adminAuthCredentials[3])
    
    console.log('Admin auth verification is ', adminAuthVerification)

    const authSign = await auth.signMessage(adminAuthCredentials[1], adminAuthCredentials[2])
    const authCredentials = await auth.sendCredentials(adminAuthCredentials[1], authSign, adminAuthCredentials[2], adminAuthCredentials[2])

    const authVerification = await authAdmin.verifyAdminSignature(authCredentials[0], authCredentials[2], authCredentials[1])

    console.log('Node B verification is ', authVerification)


    //-------------------------------------------------------------------- END OF AUTHENTICATION --------------------------------------------------------------------//

    const exchange = await KeyExchange.deployed()
    const exchangeA = await KeyExchange.new({from : "0x2dBAf1bD7109718271527a74524879fa3B54103E"})

    const publicKey = await exchange.generateKeys1()

    console.log('Exhange private key is ', await exchange.privateKey)
    console.log('ExhangeA private key is ', await exchangeA.privateKey)
    console.log('Exchange public key is ',  await exchange.prime())






   
    
    
   
    
    callback()
}
