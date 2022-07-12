// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import { IResolver } from "../Interface/IResolver.sol";
import { IDynamicCounter } from "../Interface/IDynamicCounter.sol";

contract CounterResolver is IResolver {
    address public immutable COUNTER;

    constructor(address _counter) {
        COUNTER = _counter;
    }

    function checker() external view override returns (bool canExec, bytes memory execPayload) {
        uint256 lastExecuted = IDynamicCounter(COUNTER).getLastExecuted();

        canExec = (block.number - lastExecuted) > 5;

        uint256 countToIncrease = IDynamicCounter(COUNTER).getTotalCount() + 10;

        execPayload = abi.encodeWithSelector(IDynamicCounter.increaseCount.selector, countToIncrease);
    }
}
