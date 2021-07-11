const Apple = artifacts.require("Apple.sol")
const StakingRewardFactory = artifacts.require("staking/StakingRewardsFactory.sol")


module.exports = async function (callback) {

    apple = await Apple.deployed()
    stakingRewardFactory = await StakingRewardFactory.deployed()
    factory_deployed = await stakingRewardFactory.deploy(apple.address, 400, 24*3600)
  
    callback()
  
  }
  
  