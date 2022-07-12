// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import { IResolver } from "../Interface/IResolver.sol";
import { IDynamicCounterTest } from "../Interface/IDynamicCounterTest.sol";

contract CounterResolver is IResolver {
    address public immutable COUNTER;

    constructor(address _counter) {
        COUNTER = _counter;
    }

    function checker() external view override returns (bool canExec, bytes memory execPayload) {
        uint256 lastExecuted = IDynamicCounterTest(COUNTER).getLastExecuted();

        canExec = (block.timestamp - lastExecuted) > 120;

        uint256 countToIncrease = IDynamicCounterTest(COUNTER).getTotalCount() * 2;

        execPayload = abi.encodeWithSelector(IDynamicCounterTest.increaseCount.selector, countToIncrease);
    }
}