# blockchain-for-iot
A hierchical private blockchain for IoT devices



Node -1 : besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all"

Node -2 : besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --bootnodes= enode://d82c978eb7129bc557d0948411e8ec0f17a969148c37379027a80739fc93da2bfc894c715120cf9c3291226b63a54f2a6506715a65fb14014eecc0ad54e8c560@127.0.0.1:30303 --p2p-port=30304 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8546


Node-3: besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --bootnodes= enode://d82c978eb7129bc557d0948411e8ec0f17a969148c37379027a80739fc93da2bfc894c715120cf9c3291226b63a54f2a6506715a65fb14014eecc0ad54e8c560@127.0.0.1:30303 --p2p-port=30305 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8547


Node - 4: besu --data-path=data --genesis-file=/Users/merkol/Developer/blockchain-for-iot/IBFT-Network/genesis.json --bootnodes= enode://d82c978eb7129bc557d0948411e8ec0f17a969148c37379027a80739fc93da2bfc894c715120cf9c3291226b63a54f2a6506715a65fb14014eecc0ad54e8c560@127.0.0.1:30303 --p2p-port=30306 --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8548


---------------------------------------##########--------------------------------------

truffle migrate --reset --network besu

truffle console --network besu



