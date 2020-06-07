pragma solidity ^0.6.0;

import "./TokenTimelock.sol";

contract PeaceCoinTimelock is TokenTimelock {
    constructor(IERC20 token, address beneficiary, uint256 releaseTime)
        public
        TokenTimelock(token, beneficiary, releaseTime)
    {}
}