import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-vyper";

const config: HardhatUserConfig = {
  solidity: "0.8.28",

  vyper: {
    compilers: [
      { version: "0.4.1" }
    ],
  },

  networks: {
    kairos: {
      url: "https://public-en-kairos.node.kaia.io",
      accounts: ["0x7f1eedbbf12dfd66bc90a22cdf8134aa834c908633d5889ed14ddb1d279f10f9"],
    },
  },

  etherscan: {
    apiKey: {
      kairos: "unnecessary",
    },

    customChains: [
      {
        network: "kairos",
        chainId: 1001,
        urls: {
          apiURL: "https://kairos-api.kaiascan.io/hardhat-verify",
          browserURL: "https://kairos.kaiascan.io",
        },
      },
    ],
  },
};

export default config;
