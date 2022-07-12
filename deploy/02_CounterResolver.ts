import { getNamedAccounts } from "hardhat";
import { DeployFunction } from "hardhat-deploy/dist/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

const func: DeployFunction = async (hre: HardhatRuntimeEnvironment) => {
    const { deployments } = hre;
    const { deploy } = deployments;
    const { deployer } = await getNamedAccounts();

    const DynamicCounterTestContract = await deployments.get("DynamicCounterTest");

    await deploy("CounterResolver", {
        from: deployer,
        args: [DynamicCounterTestContract.address],
        log: true,
        skipIfAlreadyDeployed: true,
        contract: "CounterResolver",
    });
};

func.tags = ["CounterResolver"];
func.dependencies = ["DynamicCounterTest"];
export default func;
