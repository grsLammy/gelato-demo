// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// import { OpsReady } from "./gelato/OpsReady.sol";

contract DynamicCounter {
    uint256 private totalCount;
    uint256 private lastExecuted;

    // constructor(address payable _ops) OpsReady(_ops) {}

    function increaseCount(uint256 _incrementAmount) external {
        require(((block.number - lastExecuted) > 5), "Counter: increaseCount: Time not elapsed");
        totalCount = totalCount + _incrementAmount;
        lastExecuted = block.number;
    }

    function getTotalCount() external view returns (uint256) {
        return totalCount;
    }

    function getLastExecuted() external view returns (uint256) {
        return lastExecuted;
    }
}
