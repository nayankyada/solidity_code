//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Skulls is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable{
    using Counters for Counters.Counter;
    uint256 public minRate = 0.01 ether;
    uint256 royalityFeesInBips;
    address royalityReceiver;
    string public contractURI;
    Counters.Counter private _tokenIdCounter;

    constructor(uint256 _royalityFeesInBips,string memory _contractUri) ERC721("", "") {
        royalityFeesInBips = _royalityFeesInBips;
        contractURI = _contractUri;
        royalityReceiver = msg.sender;
    }
  function _baseURI() internal pure override returns (string memory) {
        return "https://boredapeyachtclub.com/api/mutants/";
    }
    function safeMint(address to) public payable{
        require(msg.value >= minRate,"Not Enough Ether Sent");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
    function withdraw() public payable onlyOwner{
        payable(owner()).transfer(address(this).balance);
    }
    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return interfaceId == 0x2a55205a ||  super.supportsInterface(interfaceId);
    }

    function royalityInfo(uint256 _tokenId,uint256 _salePrice) external view returns(address receiver,uint256 royalityAmount) {
        return (royalityReceiver,calculateRoyality(_salePrice));
    }

    function calculateRoyality(uint256 _salePrice) view public returns(uint256){
        return (_salePrice / 10000) * royalityFeesInBips;
    }

    function setRoyalityInfo(address _receiver,uint256 _royalityFeesInBips) public onlyOwner{
        royalityReceiver = _receiver;
        royalityFeesInBips = _royalityFeesInBips;
    } 

    function setContractURI(string calldata _contractURI) public onlyOwner {
        contractURI = _contractURI;
    }
}