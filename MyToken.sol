// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract MyToken {
    // 不同账户地址的代币余额
    mapping (address => uint) balances;

    // 代币的发行量
    uint256 public totalSupply;

    // 代币的发行人
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    // 此函数用来发币
    function mint(address recipient, uint256 amount) public {
        require(msg.sender == owner, "Only owner can mint");
        balances[recipient] += amount;
        totalSupply += amount;
    }

    // 查询某个账户地址的代币余额
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}