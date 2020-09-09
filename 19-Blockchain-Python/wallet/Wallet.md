# Universal Blockchain Wallet

![newtons-coin-cradle](../Instructions/Images/newtons-coin-cradle.jpg)

## Intro
This homework will create a universal wallet that holds the keys to Ethereum (ETH), Bitcoin (BTC), and Bitcoin Testnet (BTCTEST) accounts.

## Setup
Assumptions: PHP, Python Bitcoin library (bit), and Python Ethereum library  (web3.py) are already installed. A 12 word mnemonic phrase has already been created.

A clone the hd-wallet-derive directory was created to use the hd-wallet command line tool to generate the keys.

## Functions
The following functions were created to support the universal blockchain wallet.
1) derive_wallets
- Description: Creates a key (or keys) based on a mnemonic phrase for a given blockchain.
- Input parameters:
    - mnemonic: a 12 word mnemonic phrase
    - coin: Defines what kind of wallet to create: ETH, BTC, or BTCTEST
    - numderive: Defines the number of keys to generate
- Returned values: a list of numderive keys containing:
    - path: unique path that defines the key
    - address: public address
    - privkey: private key
    - pubkey: public key
2) priv_key_to_account
- Description: Creates an Ethereum, Bitcoin or Bitcoin Testnet account
- Input parameters:
    - coin: Defines the blockchain type (ETH, BTC, or BTCTEST)
    - priv_key: private key for the account object to be created
- Returned values: account object
3) create_tx
- Description: Creates an unsigned transaction containing the metadata of the transaction
- Input parameters:
    - coin: Defines the blockchain type (ETH, BTC, or BTCTEST)
    - account: account object created from the priv_key_to_account function
    - recipient: address of transaction recipient
    - amount: the amount of coin to send
- Returned values: Metadata of unsigned transaction
4) send_tx
- Description: Calls the create_tx function to create an unsigned transaction, signs the transaction, and then sends to the appropriate blockchain network to be executed.
- Input parameters:
    - coin: Defines the blockchain type (ETH, BTC, or BTCTEST)
    - account: account object created from the priv_key_to_account function
    - recipient: address of transaction recipient
    - amount: the amount of coin to send
- Returned values: Transaction sent to blockchain network

## Verification
Since my PHP did not correctly install, I am unable to verify the transactions on the respective networks.