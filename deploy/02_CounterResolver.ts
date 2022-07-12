import { getNamedAccounts } from "hardhat";
import { DeployFunction } from "hardhat-deploy/dist/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

const func: DeployFunction = async (hre: HardhatRuntimeEnvironment) => {
    const { deployments } = hre;
    const { deploy } = deployments;
    const { deployer } = await getNamedAccounts();

    const DynamicCounter = await deployments.get("DynamicCounter");

    await deploy("CounterResolver", {
        from: deployer,
        args: [DynamicCounter.address],
        log: true,
        skipIfAlreadyDeployed: true,
        contract: "CounterResolver",
    });
};

func.tags = ["CounterResolver"];
func.dependencies = ["DynamicCounter"];

export default func;
