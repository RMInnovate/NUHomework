from constants import *

import os
from dotenv import load_dotenv
from pathlib import Path
rel_path = Path('../../../Python') / '.env'
load_dotenv(rel_path)
private_key = os.getenv("MNEMONIC")

from web3 import Web3
w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))
from eth_account import Account
account_one = Account.from_key(private_key)
print(account_one.address)

def derive_wallets(mnemonic, coin, numderive):
    command = 'php hd-wallet-derive.php -g --mnemonic="{mnemonic}" --numderive="{numderive}" --coin="{coin}" --cols=path,address,privkey,pubkey --format=json'
    p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    (output, err) = p.communicate()
    keys = json.loads(output)
    return keys


def priv_key_to_account():
    return



def create_tx(coin, account, recipient, amount):
    if coin == 'ETH'
        gasEstimate = w3.eth.estimateGas(
            {"from": account.address, "to": recipient, "value": amount}
        )   
        return {
            "from": account.address,
            "to": recipient,
            "value": amount,
            "gasPrice": w3.eth.gasPrice,
            "gas": gasEstimate,
            "nonce": w3.eth.getTransactionCount(account.address),
            "chainID":
        }
    else
        return PrivateKeyTestnet.prepare_transaction(account.address, [(to, amount, BTC)])
        


def send_tx(coin, account, recipient, amount):
    if coin == 'ETH'
        raw_tx = create_tx(coin, account, recipient, amount)
        signed_tx = account.sign_transaction(raw_tx)
        result = w3.eth.sendRawTransaction(signed_tx.rawTransaction)
        print(result)
    else
        raw_tx = create_tx(coin, account, recipient, amount)
        signed_tx = account.sign_transaction(raw_tx)
        result = NetworkAPI.broadcast_tx_testnet(signed_tx)
        print(result)    
    return result.hex()