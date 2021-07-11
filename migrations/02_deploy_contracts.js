const Factory = artifacts.require("UniswapV2Factory.sol");
const Apple = artifacts.require("Apple.sol")
const Pear = artifacts.require("Pear.sol")
const FarmToken = artifacts.require("FarmToken.sol")
const StakingRewardFactory = artifacts.require("staking/StakingRewardsFactory.sol")

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(Factory, '0x09A7a052b0916d1a5B1bA2f9Ba5f726Ec3e2F706');
  const factory = await Factory.deployed();
  if (network === 'mainnet') {
    token1Address = '';
    token2Address = '';
  } else {
    // Deploying the Tokens.
    await deployer.deploy(Apple, 10000);
    await deployer.deploy(Pear, 10000);
    const apple = await Apple.deployed();
    const pear = await Pear.deployed();
    appleAddress = apple.address;
    pearAddress = pear.address;

    // Deploying the Farm Tokens (Staking): Pure Solidity
    // await deployer.deploy(FarmToken, appleAddress)
    // const farmTokenApple = await FarmToken.deployed()

    // await deployer.deploy(FarmToken, pearAddress)
    // const farmTokenPear = await FarmToken.deployed()

    // Staking using Uniswap
    await deployer.deploy(StakingRewardFactory, appleAddress, 1626033790);
    const stakingRewardFactory = await StakingRewardFactory.deployed();

  }
  await factory.createPair(appleAddress, pearAddress);
};
