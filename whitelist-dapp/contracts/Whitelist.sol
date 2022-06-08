//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract Whitelist {
    uint256 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint256 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );

        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses can't be added, limit reached"
        );

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;
    }
}
