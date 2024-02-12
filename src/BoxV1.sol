// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

// storage is stored in the proxy, NOT the implementation
// BEWARE. storage is handled according to storage slots, not variable names
contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    // consturctors cannot be used in upgradeable contracts
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    // Instead of a constructor the follwing function can be used instead
    function initialize() public initializer {
        __Ownable_init(msg.sender); // sets owner to msg.sender
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}
