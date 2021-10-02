// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../client/node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../client/node_modules/@openzeppelin/contracts/utils/Counters.sol";

library Library {
    struct data {
        uint256 id;
        bool isId;
    }
}

contract SimpleNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(address => Library.data) public tokens;

    constructor() ERC721("MyID", "MID") {}

    function mintTokenId(address user, string memory tokenURI)
        public
        returns (uint256)
    {
        require(!tokens[user].isId);
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(user, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokens[user].id = newItemId;
        tokens[user].isId = true;

        return newItemId;
    }
}
