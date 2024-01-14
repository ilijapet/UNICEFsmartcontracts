// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "./UnicefCoins.sol";

contract Donation is Ownable {
    UnicefCoins public unitoken;
    address public immutable OWNER;
    mapping(address => uint256) public userDonations;

    constructor() Ownable(msg.sender) {
        unitoken = new UnicefCoins(address(this));
        OWNER = msg.sender;
    }

    function donate() public payable {
        userDonations[msg.sender] += msg.value;
        emit DonationEvent(msg.sender, msg.value);
    }

    function claimUnicefCoins() public {
        require(userDonations[msg.sender] > 0, "Your balance is 0!");
        require(
            unitoken.balanceOf(address(this)) > 0,
            "Tresury UniToken balance is 0!"
        );
        uint256 amount = userDonations[msg.sender];
        userDonations[msg.sender] = 0;
        bool success = unitoken.transfer(msg.sender, amount);
        require(success, "Transfer of tokens failed.");
        emit ClaimTokenEvent(msg.sender, amount);
    }

    // add NATSPEC comment
    function withdrow() public onlyOwner {
        uint256 bal = address(this).balance;
        (bool suc, ) = payable(OWNER).call{value: bal}("");
        require(suc, "Tx has failed!");
        // emit withdraw event
        emit WithdrawEvent(msg.sender, bal);
    }

    function donatorTokenBalance() public view returns (uint256) {
        uint256 bal = userDonations[msg.sender];
        return bal;
    }

    function unitokenBalance() public view returns (uint256) {
        uint256 bal = unitoken.balanceOf(msg.sender);
        return bal;
    }

    event DonationEvent(address, uint256);
    event ClaimTokenEvent(address, uint256);
    event WithdrawEvent(address, uint256);
}
