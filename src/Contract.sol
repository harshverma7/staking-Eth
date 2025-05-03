// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract Stake {
    uint256 public totalStaked;
    mapping(address=> uint256) stakeBalance;

    function stake(uint256 amount) public payable {
        require(amount > 0, "Amount should be greater than 0");
        require(msg.value == amount , "Amount should be equal to value sent");
        stakeBalance[msg.sender] += amount;
        totalStaked += amount;        
    }

    function unstake(uint256 amount) public payable {
       require(stakeBalance[msg.sender] >= amount, "not enough balance");
       stakeBalance[msg.sender] -= amount/2;
       totalStaked -= amount/2;
       payable(msg.sender).transfer(amount/2);        
    }


 }
