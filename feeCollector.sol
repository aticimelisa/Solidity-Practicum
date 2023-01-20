pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract FeeCollector { // General start to the FeeCollector Contract
    address public owner;   //Two Public variable for using as output of the contract
    uint256 public balance;
    
    constructor() {
        owner = msg.sender; // store information who deployed contract
    }
    
    receive() payable external { 
        balance += msg.value; // keep track of balance (in WEI)
    }
    
    
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");  //Only sender can withdraw money, otherwise they will see an error message
        require(amount <= balance, "Insufficient funds"); //If there is not enough fund in that contract, the error message will pop-up
        
        destAddr.transfer(amount); // send funds to given address
        balance -= amount; //To update balance info correctly
    }
}
