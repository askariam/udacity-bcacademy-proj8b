const HDWalletProvider = require('truffle-hdwallet-provider');
const infuraKey = "ead59da72e1b443cbf0e46c2bf3a96d2";

// to read the mnemonic from a secret file that will not be published to github
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, `https://rinkeby.infura.io/v3/${infuraKey}`),
      network_id: 4 ,       // Ropsten's id
      gas: 4500000,        // Ropsten has a lower block limit than mainnet
     // confirmations: 2,    // # of confs to wait between deployments. (default: 0)
      timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
    //  skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
    }
  },
  compilers : {
    solc: {
      version: "^0.4.24"
    }
  }
};