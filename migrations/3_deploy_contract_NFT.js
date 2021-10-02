var SimpleNFT = artifacts.require("./SimpleNFT.sol");

module.exports = function (deployer) {
  deployer.deploy(SimpleNFT);
};
