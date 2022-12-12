# blockchain-for-iot
A hierchical private blockchain for IoT devices



Node -1 : besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --rpc-http-enabled --rpc-ws-enabled --miner-enabled --miner-coinbase 0xFE3B557E8Fb62b89F4916B721be55cEb828dBd73 --min-gas-price=0 --rpc-ws-host=0.0.0.0 --rpc-ws-apis=ADMIN,ETH,MINER,WEB3,NET,PRIV,EEA --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --revert-reason-enabled

Node -2 : besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --bootnodes= enode://282f5d8917848f44372b08dfaa7adc1612cb8f5f9c1b7ea6ab0941b92e98f7b1b1996cefef14a3bbcc4360c8978586df544fcf19864515971972bfc32e87dab5@127.0.0.1:30303 --p2p-port=30304 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8547


Node-3:  besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --bootnodes= enode://282f5d8917848f44372b08dfaa7adc1612cb8f5f9c1b7ea6ab0941b92e98f7b1b1996cefef14a3bbcc4360c8978586df544fcf19864515971972bfc32e87dab5@127.0.0.1:30303 --p2p-port=30305 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8548

Node - 4: besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --bootnodes= enode://282f5d8917848f44372b08dfaa7adc1612cb8f5f9c1b7ea6ab0941b92e98f7b1b1996cefef14a3bbcc4360c8978586df544fcf19864515971972bfc32e87dab5@127.0.0.1:30303 --p2p-port=30306 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8549

curl -X POST --data '{"jsonrpc":"2.0","method":"ibft_getValidatorsByBlockNumber","params":["latest"], "id":1}' localhost:8545


---------------------------------------##########--------------------------------------

truffle migrate --reset --network besu

truffle console --network besu



