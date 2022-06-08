// ethers.js comes with built in to Hardhat
// it's a very good library to work with ethereum

//import ethers
const { ethers } = require("hardhat");

async function main() {
  //1. somehow tell the script we want to deploy the contract
  const contract = await ethers.getContractFactory("NFTee");
  //2. Deploy it
  const deployedContract = await contract.deploy();
  //2.1 wait for deployment to finish
  await deployedContract.deployed();
  //3. Print the address of the deployed contract
  console.log("NFT Contract deployed to: ", deployedContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error.message);
    process.exit(1);
  });
