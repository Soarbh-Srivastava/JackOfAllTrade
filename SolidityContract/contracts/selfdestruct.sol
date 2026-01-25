// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

contract ContractDestruction{

    function instatedSelfDestruction() public {
        selfdestruct(payable(msg.sender));
    }

    receive() external payable { }
}