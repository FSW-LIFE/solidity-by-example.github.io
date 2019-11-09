pragma solidity ^0.5.11;

// Contract to receive Ether
contract Receiver {
    // This is a special function called the fallback.
    // The fallback function declared payable enables other contracts to
    // send Ether by send, transfer, or call.
    function () external payable {
    }

    // Helper function to check balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract TestSend {
    event Log(bool sent);

    // Try:
    // Call this function with the address of the Receiver contract as input.
    // Also send some Ether when calling this function.
    function sendEther(address payable addr) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = addr.send(msg.value);

        // Check the result of send by looking into the transaction logs.
        emit Log(sent);
    }
}

contract TestTransfer {
    // Try:
    // Call this function with the address of the Receiver contract as input.
    // Also send some Ether when calling this function.
    function sendEther(address payable addr) public payable {
        // Transfer will throw an error if it fails sending Ether.
        // This is the safest way (out of send, transfer and call) to send Ether.
        addr.transfer(msg.value);
    }
}

contract TestCall {
    event Log(bool sent);

    // Try:
    // Call this function with the address of the Receiver contract as input.
    // Also send some Ether when calling this function.
    function sendEther(address payable addr) public payable {
        // Call returns a boolean value indicating success or failure.
        // We ignore the second value returned.
        (bool sent,) = addr.call.value(msg.value)("");

        // Check the result of call by looking into the transaction logs.
        emit Log(sent);
    }
}