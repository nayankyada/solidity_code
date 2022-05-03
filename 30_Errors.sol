// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

/// Not enough funds for transfer. Requested `requested`,
/// but only `available` available.
error NotEnoughFunds(uint requested, uint available);

contract Token {
    uint minimumAmount  = 4;
    function transfer(uint amount) public view {
        if (minimumAmount > amount)
            revert NotEnoughFunds(amount, minimumAmount);
    }
}