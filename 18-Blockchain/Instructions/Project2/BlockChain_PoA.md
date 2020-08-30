# How to Setup a Proof of Authority Blockchain (Mac Users)

## Assumptions
- User already has installed [MyCrypto](https://www.mycrypto.com/)
- User has installed the [Go Ethereum](https://geth.ethereum.org/downloads/) Tools
    - Save the "Geth & Tools 1.9.7"  to desired working location
    - Name working directory: Geth_Tools
- If you are reusing a blockchain directory, please remove old nodes.  Code example below assumes you have 2 nodes, node1 and node2 respectively
    > rm -Rf node1/geth node2/geth

## Create a New Wallet using a Mnemonic Phrase
- Open the MyCrypto App
- Click 'Create New Wallet' on the left hand side
![New Wallet](Screenshots/14_createwallet.png)
- Click 'Generate a Wallet' under Create New Wallet
![Generate Wallet](Screenshots/15_GenerateWallet.png)
- Click 'Generate a Mnemonic Phrase' under Mnemonic Phrase
![phrase](Screenshots/16_mnemonic.png)
- Save the 12 words, in order, in a safe location.  This will be your mnemonic phrase.  After saving the 12-word phrase, click 'Confirm Phrase'
- Now select the 12 words in the same order as shown on the previous screen to confirm your phrase. Click 'Confirm Phrase'
- Click 'Go to Account'
- Click on 'Change network' on the left hand side
![network](Screenshots/17_changenetwork.png)
- Click 'Kovan'
![kovan](Screenshots/18_kovan.png)
- Click 'Mnemonic Phrase'
- Enter your 12-word mnemonic phrase
- Click 'Choose address'
![address](Screenshots/19_address.png)
- Choose 'Testnet (ETH)' as the address
- Click any of the addresses that you want to unlock
- Click 'Unlock'
- Click 'copy address' underneath Account Address.  This is your public address.  Save this in the same location as your 12-word mnemonic phrase
![public address](Screenshots/20_mnemonicpublic.png)

Now that you have a wallet, let's fund it!
- Go to https://faucet.kovan.network/ and login with your GitHub Account
- Copy your Kovan public Address
- Click 'Send me KETH'
![ETH](Screenshots/21_ETH.png)
KETH should be on it's way!  Let's go back to your wallet to check!
- Click the refresh icon under Account Balance.  You should now have 1 ETH.
![KETH](Screenshots/22_KETHfunded.png)
- Click on 'Wallet Info' on the top to get access to your private key.
- Click on the 'eye' icon to view your private key and store with your public address and 12-word phrase
![private key](Screenshots/23_private.png)

Repeat the steps above to create a second wallet for the blockchain.

## Setup a Custom Blockchain
- Open a new Terminal, Terminal 1, and navigate to the Geth_Tools working directory
- Run puppeth
    > ./puppeth

    - If you receive the below error click 'Cancel.'
    ![Puppeth Warning](Screenshots/1_puppeth.png)
    - Go to System Preferences -> Security & Privacy -> General and then click 'Allow Anyway' next to the puppeth warning
    ![Puppeth Security](Screenshots/2_puppeth.png)
    - Go back to Terminal 1 and re-run puppeth
    > ./puppeth
    - Click 'Open'
    ![Puppeth Open](Screenshots/3_puppeth.png)


- Specify your network name
    > fintech829

    ![NetworkName](Screenshots/4_NetworkName.png)

- Configure your new genesis block using Proof of Authority
    - 2 Configure new genesis
    - 1 Create new genesis from scratch
    - 2 Clique - proof-of-authority
    - enter (default 15 seconds)
    ![Genesis](Screenshots/5_Genesis.png)

- Define the accounts to seal and pre-fund
    - Paste the public address of the first account to seal and press enter
    - Paste the public address of the second account to seal and press enter
    - Paste the public address of the first account to pre-fund and press enter
    - Paste the public address of the second account to pre-fund and press enter
    - Do not pre-fund with 1 wei
    ![Accounts](Screenshots/6_accounts.png)

- Specify the chain ID
    > 829
    
    ![ID](Screenshots/7_ID.png)

Congratulations! You completed the creation of your genesis block.

- Export your genesis block for use
    - 2 Manage existing genesis
    - 2 Export genesis configuration
    - enter (current folder)
    ![Export](Screenshots/8_export.png)

Now that your genesis block is exported, it is ready to be used.  Type control C to exit from puppeth.

## Setup Nodes
- In your Geth_Tools directory set up node1
    > ./geth account new --datadir node1
    - If you get a geth error, click 'Cancel'
    ![Geth_error](Screenshots/9_geth.png)
    - Go to System Preferences -> Security & Privacy -> General and then click 'Allow Anyway' next to the geth warning
    ![Geth_security](Screenshots/10_geth.png)
    - Go back to Terminal 1 and re-run puppeth
    > ./geth account new --datadir node1
    - Click 'Open'
    ![Geth_allow](Screenshots/11_geth.png)
- Define a password for node1
- Confirm password
- Store your password, public key and private key in a safe location
![node1_setup](Screenshots/12_node1.png)

- Set up node2
    > ./geth account new --datadir node2
- Define a password for node2
- Confirm password
- Store your password, public key and private key in a safe location
![node2_setup](Screenshots/13_node2.png)

- Initialize both nodes
    - Initialize node1
    > ./geth init fintech829.json --datadir node1
    - Initialize node2
    > ./geth init fintech829.json --datadir node2

- Start mining
    > ./geth --datadir node1 --mine --minerthreads 1
    - Save the enode from the scrolling text.
    ![enode](Screenshots/24_enode.png)

- Open a second Terminal, Terminal 2, and navigate to the same Geth_Tools directory
- Start mining the second node using the enode from Terminal 1
    > ./geth --datadir node2 --port 30304 --rpc --bootnodes "enode://9adc086c41b67815636355f9d8289e816dbe3cf6dcd38a115045d56f0549c0d05a3abe489df535692ede9b292c694cfb69f413751e57b4534708e77eb49fa4c0@127.0.0.1:30303"

## Send Test Transaction
Could not complete this step as the mining for the Proof of Authority did not work.