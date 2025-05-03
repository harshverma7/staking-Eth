// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakingContract {
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
       stakeBalance[msg.sender] -= amount;
       totalStaked -= amount;
       payable(msg.sender).transfer(amount/2);        
    }


 }

 contract StakingContract2 { 
    uint256 public totalStaked;
    mapping(address => uint256) public stakedBalances;

    function stake(uint256 amount) public payable {
        require(amount > 0, "Amount must be greater than 0");
        require(msg.value == amount, "Amount must be equal to msg.value");
        totalStaked += amount;
        stakedBalances[msg.sender] += amount;
    }

    function unstake(uint256 amount) public payable {
        require(amount <= stakedBalances[msg.sender], "Not enough balance");
        totalStaked -= amount;
        stakedBalances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
