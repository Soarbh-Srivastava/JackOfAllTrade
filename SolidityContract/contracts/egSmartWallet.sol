// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Wallet{
    struct Transcation{
        uint timestamp;
        uint ammount;
    }
    struct Balance{
        uint totalBalance;
        uint numOfDeposit;
        mapping (uint => Transcation) deposits;
        uint numOfWithdrawal;
        mapping (uint => Transcation) withdrawals;
    }
    
    mapping (address => Balance) public balances;

    function getDeposit(address _from,uint _numOfDeposit) public view  returns (Transcation memory){
        return balances[_from].deposits[_numOfDeposit];
    }


    function depositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;

        Transcation memory deposit = Transcation(block.timestamp,msg.value);
        balances[msg.sender].deposits[balances[msg.sender].numOfDeposit] = deposit;
        balances[msg.sender].numOfDeposit++;
    }
    function withdrawMoney() public payable {
        balances[msg.sender].totalBalance -= msg.value;

        Transcation memory withdrawal = Transcation(block.timestamp,msg.value);
        balances[msg.sender].withdrawals[balances[msg.sender].numOfDeposit] = withdrawal;
        balances[msg.sender].numOfWithdrawal++;
    }
}
