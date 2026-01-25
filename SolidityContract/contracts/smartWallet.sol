// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

contract consumer{
  function getBalance() view public  returns (uint){
    return address(this).balance;
  }
  function withdrawMoney() public payable  {}
}

contract smartWallet
{
  address payable public  owner;
  mapping (address => uint) public  allowances;
  mapping (address=> bool)  public isAllowed;
  mapping (address => bool) public  guardian;
  mapping (address=>mapping (address => bool)) nextOwnerGuardianVotingBool;
  address payable  public  nextowner;
  uint guardianResetVote;
  uint public constant confirmationFromGuardianReset = 3;

  constructor(){
    owner = payable (msg.sender);
  }

  function setGuardian(address _guardian, bool _isGuardian) public {
    require(msg.sender == owner, "you are not the owner, Aborting!");
    guardian[_guardian] = _isGuardian;
  }

  function purposeNewowner(address payable _newowner) public {
    require(guardian[msg.sender] == true,"you are not a guardian, Aborting");
    require(nextOwnerGuardianVotingBool[_newowner][msg.sender] == false,"you have already vote");
    if(_newowner!=nextowner){
        nextowner = _newowner;
        guardianResetVote = 0;
        }
        nextOwnerGuardianVotingBool[nextowner][msg.sender] = true;
        guardianResetVote++;
    if(guardianResetVote>= confirmationFromGuardianReset){
        owner = nextowner;
        nextowner = payable(address(0));
    }
  }

  function setallowances(address _for , uint _amount) public {
    require(msg.sender ==  owner,"you are not the owner, Aborting!");
    allowances[_for] =_amount;
    if (_amount>0){
        isAllowed[_for] = true;
    } 
    else {
        isAllowed[_for] = false;
    }
  }


  function withdrawMoney(address payable  _to, uint _amount ,bytes memory payload)public returns (bytes memory){
    if(msg.sender != owner){
        require(isAllowed[msg.sender],"you are not allowed to make a transtion, contact onwer");
        require(allowances[msg.sender]>= _amount,"You are try to send more then in the account");
        uint oldAllowance = allowances[msg.sender];
        allowances[msg.sender] = oldAllowance - _amount;
    }
    (bool success, bytes memory returnData) = _to.call{value:_amount}(payload);
    require(success,"Aborting, call not success ");
    return returnData;
  }


  receive() external payable{}
}