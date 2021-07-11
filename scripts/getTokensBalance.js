// const Factory = artifacts.require("UniswapV2Factory.sol");
const Apple = artifacts.require("Apple.sol")
const Pear = artifacts.require("Pear.sol")
const FarmToken = artifacts.require("FarmToken.sol")


module.exports = async function (callback) {

  apple = await Apple.deployed()
  farmTokenApple = await FarmToken.deployed(apple.address)
  balanceApple = await apple.balanceOf(farmTokenApple.address)
  console.log(web3.utils.fromWei(balanceApple.toString()))

  pear = await Pear.deployed()
  farmTokenPear = await FarmToken.deployed(pear.address)
  balancePear = await pear.balanceOf(farmTokenPear.address)
  console.log(web3.utils.fromWei(balancePear.toString()))

  callback()

}

