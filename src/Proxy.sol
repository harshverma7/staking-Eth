// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract StakingProxy {
    uint256 public totalStaked;
    mapping(address => uint256) public stakedBalances;

    address public implementation;

    constructor (address _implementation){
        implementation = _implementation;
    }

    fallback() external  {
        (bool success, ) = implementation.delegatecall(msg.data);
         require(success, "Delegatecall failed");
    }  
}