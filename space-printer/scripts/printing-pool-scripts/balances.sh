#!/usr/bin/bash
set -e
# SET UP VARS HERE
export CARDANO_NODE_SOCKET_PATH=$(cat pathToSocket.sh)
cli=$(cat pathToCli.sh)

script_path="../../printing-pool/printing_pool.plutus"
script=$(${cli} address build --payment-script-file ${script_path} --testnet-magic 1097911063)

customer=$(cat wallets/customer/payment.addr)
printer=$(cat wallets/printer/payment.addr)

echo
${cli} query protocol-parameters --testnet-magic 1097911063 --out-file tmp/protocol.json
${cli} query tip --testnet-magic 1097911063 | jq

echo
echo "Script Address:" ${script}
${cli} query utxo --address ${script} --testnet-magic 1097911063

echo
echo "Customer Address:" ${customer}
${cli} query utxo --address ${customer} --testnet-magic 1097911063

echo
echo "Printer Address:" ${printer}
${cli} query utxo --address ${printer} --testnet-magic 1097911063

