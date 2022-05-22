//SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FakeERC20 is ERC20 {
    address owner;

    constructor(uint256 _supply) ERC20("FakeERC20", "FKERC20") {
        _mint(msg.sender, _supply * (10**decimals()));
        owner = msg.sender;
    }

    function transferOwner(address newOwner) public {
        require(msg.sender == owner, "Must be owner to transer");
        owner = newOwner;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}