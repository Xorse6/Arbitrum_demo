// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 private favoriteNumber; // Stores the user's favorite number

    uint256[] public favoriteNumbers; // Dynamic array to store multiple favorite numbers


    // Struct to store a person’s name and their favorite number
    struct Person {
        string name; // Person's name
        uint256 favoriteNumber; // Their favorite number
    }

    Person[] public people; // Array of Person structs to store multiple people's data

    // Enum to manage contract states (Active or Inactive)
    enum ContractState {
        Active, // State representing an active contract
        Inactive // State representing an inactive contract
    }

    ContractState public state; // State variable to store the current contract state

    event NumberUpdated(uint256 newNumber, address updatedBy);

    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        emit NumberUpdated(_favoriteNumber, msg.sender);
    }


    // Function to store a number in the storage variable
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // Function that uses a memory variable
    function updateNumber(uint256 _newNumber) public pure  returns (uint256) {
        // Memory variable is used for temporary calculations
        uint256 tempNumber = _newNumber + 5;
        return tempNumber;
    }

    // Function that uses a calldata variable
    function concatenateString(string calldata _inputString) public pure returns (string memory) {
        // Memory variable to store the concatenated result
        string memory newString = string(abi.encodePacked(_inputString, " is awesome!"));
        return newString;
    }


    function isGreaterThan(uint256 _compareValue) public view returns (bool) {
        if (favoriteNumber > _compareValue) {
            return true;
        } else {
            return false;
        }
    }

    function sumToFavoriteNumber() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        }
        return sum;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber; // Public: Provides access to the private variable
    }

    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function"; // Internal: Can be accessed within this contract or derived contracts
    }

    // Wrapper function to expose internalFunction for testing purposes
    function callInternalFunction() public pure returns (string memory) {
        return internalFunction(); // Calls the internal function from within the contract
    }

    function externalFunction() external pure returns (string memory) {
        return "This is an external function"; // External: Can only be called from outside the contract
    }

    function testExternalFunction() public view returns (string memory) {
        return this.externalFunction(); // Calls the external function within the contract using 'this'
    }

    function addFavoriteNumber(uint256 _number) public {
        favoriteNumbers.push(_number);
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function activateContract() public {
        state = ContractState.Active;
    }

    function deactivateContract() public {
        state = ContractState.Inactive;
    }

    function isActive() public view returns (bool) {
        return state == ContractState.Active;
    }

    mapping(string => uint256) public nameToFavoriteNumber;

    

    // function store(uint256 _favoriteNumber) public {
    //     favoriteNumber = _favoriteNumber;
    // }

    // function retrieve() public view returns (uint256) {
    //     return favoriteNumber;
    // }
}
