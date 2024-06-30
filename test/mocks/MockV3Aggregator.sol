// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract MockV3Aggregator is AggregatorV3Interface {
    uint8 public override decimals;
    string public override description = "Mock V3 Aggregator"; // added description field
    int256 private _latestAnswer;

    constructor(uint8 _decimals, int256 _initialAnswer) {
        decimals = _decimals;
        _latestAnswer = _initialAnswer;
    }

    function latestRoundData()
        public
        view
        override
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        return (0, _latestAnswer, 0, 0, 0);
    }

    function version() external pure override returns (uint256) {
        return 4;
    }

    function getAnswer(uint256) public view returns (int256) {
        return _latestAnswer;
    }

    function getTimestamp(uint256) public view returns (uint256) {
        return 0;
    }

    function getRoundData(uint80)
        public
        view
        override
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80
        )
    {
        return (0, _latestAnswer, 0, 0, 0);
    }
}
