// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Soul {
    address public owner;

    //       collectionAddress  tokenId  approved
    mapping (address => mapping (uint => bool)) public approvedTokens;

    constructor(address _owner) {
        owner = _owner;
    }

    modifier onlyOwner {
        if (msg.sender != owner) revert();
        _;
    }

    function transferOwnership(address _newOwner) onlyOwner public returns (bool success) {
        owner = _newOwner;
        return true;
    }

    function changeSoulBoundTokenApproval(address _collection, uint256 _tokenId, bool _approved) onlyOwner public returns (bool success) {
        approvedTokens[_collection][_tokenId] = _approved;
        return true;
    }
}
