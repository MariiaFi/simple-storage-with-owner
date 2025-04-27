// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Simple Storage Contract with Ownership Control
/// @notice Only the contract owner can update the stored number
/// @dev Demonstrates constructor, modifier, and access control basics

contract SimpleStorageWithOwner {
    // Private variable to store a number
    uint256 private storedNumber;

    // Address of the contract owner
    address private owner;

    // *Event to log updates, added based on the advice of a good person ;)
    event NumberStored(address indexed user, uint256 newNumber);

    /// @notice Set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    /// @notice Restricts function access to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    /// @notice Allows the owner to store a new number and emits an event
    /// @param newNumber The number to store
    function store(uint256 newNumber) public onlyOwner {
        storedNumber = newNumber;
        emit NumberStored(msg.sender, newNumber); // 🛠 Emitting event based on smart advice
    }

    /// @notice Returns the currently stored number
    /// @return The stored number
    function retrieve() public view returns (uint256) {
        return storedNumber;
    }
}
