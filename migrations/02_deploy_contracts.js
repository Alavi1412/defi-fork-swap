const Factory = artifacts.require("UniswapV2Factory.sol");
const Apple = artifacts.require("Apple.sol")
const Pear = artifacts.require("Pear.sol")

module.exports = async function (deployer, network, addresses) {
  await deployer.deploy(Factory, '0xC40bb332cD6cB4E1f195379b0E04283e6DB97f7d');
  const factory = await Factory.deployed();
  if (network === 'mainnet') {
    token1Address = '';
    token2Address = '';
  } else {
    await deployer.deploy(Apple, 10000);
    await deployer.deploy(Pear, 10000);
    const apple = await Apple.deployed();
    const pear = await Pear.deployed();
    appleAddress = apple.address;
    pearAddress = pear.address;
  }
  await factory.createPair(appleAddress, pearAddress);
};
