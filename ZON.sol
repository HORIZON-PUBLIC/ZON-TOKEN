// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract ZON is ERC20, Ownable {

    uint256 private _initialSupply = 200000000 * 10**uint256(decimals());
    address private _owner = 0xc9316EFF6F9032380D38b583E2Fe45344267ed88;

    constructor() ERC20('Horizon Land', 'ZON') {
        _mint(_owner, _initialSupply);
    }

    function rescueStuckERC20(address _token) external onlyOwner {
        uint256 _amount = IERC20(_token).balanceOf(address(this));
        IERC20(_token).transfer(owner(), _amount);
    }
}
