// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface IDynamicCounter {
    function increaseCount(uint256 _incrementAmount) external;

    function getTotalCount() external view returns (uint256);

    function getLastExecuted() external view returns (uint256);
}
