// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Wallet{
    
    PaymentRecived  public payment;

    function payContract() public payable {
        payment = new PaymentRecived(msg.sender,msg.value);
    }
    
}
contract PaymentRecived{
    address public  to;
    uint public amount;

    constructor(address _to, uint _amount){
        to = _to;
        amount =_amount;
    }
}

contract wallet2{
    struct PaymentReciveStruct{
        address to;
        uint amount;
    }

    PaymentReciveStruct public payment;

    function payContract2() public payable {
        payment = PaymentReciveStruct(msg.sender, msg.value);
    }

}