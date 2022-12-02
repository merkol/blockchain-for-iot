const PrivateKeyProvider = require('@truffle/hdwallet-provider');
const privateKeys = [
  '0x8f2a55949038a9610f50fb23b5883af3b4ecb3c3bb792cbcefbd1542c692be63', // Node B
  '0x13e013ad6915a140eb6f3f776cbef51a552319b0415fdacba1c836ecf1aa644f' // Admin
];

const privateKeyProvider = new  PrivateKeyProvider(
  privateKeys,
  'http://127.0.0.1:8545',
  1,
  3
)
module.exports = {
  compilers:{
    solc:{
      version:"^0.8.7"
  }
  },
  networks:{
    besu:{
      provider: privateKeyProvider,
      network_id: '*'
    }
  }
}
