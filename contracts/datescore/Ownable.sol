pragma solidity ^0.4.24;

/// Provides basic authorization control
contract Ownable {
    address private oOwner; // changed the name here

    // Define an Event
    event TransferOwnership(address indexed oldOwner, address indexed newOwner);

    /// Assign the contract to an owner
    constructor () internal {
        oOwner = msg.sender;
        emit TransferOwnership(address(0), oOwner);
    }

    /// Look up the address of the owner
    function owner() public view returns (address) {
        return oOwner;
    }

    /// Define a function modifier 'onlyOwner'
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /// Check if the calling address is the owner of the contract
    function isOwner() public view returns (bool) {
        return msg.sender == oOwner;
    }

    /// Define a function to renounce ownerhip
    function renounceOwnership() public onlyOwner {
        emit TransferOwnership(oOwner, address(0));
        oOwner = address(0);
    }

    /// Define a public function to transfer ownership
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /// Define an internal function to transfer ownership
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit TransferOwnership(oOwner, newOwner);
        oOwner = newOwner;
    }
}
