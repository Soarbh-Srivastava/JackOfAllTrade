// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract EventExample{

    mapping (address=>uint) balance;
    event tokenSent( address _from , address _to , uint _amount);
    constructor(){
        balance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public {
        require(balance[msg.sender]>=_amount,"insufficent balance");
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
        emit tokenSent(msg.sender, _to, _amount);
    }
}