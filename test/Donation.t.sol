import "forge-std/Test.sol";
import "forge-std/console.sol";

pragma solidity 0.8.20;

import "forge-std/Test.sol";

import "src//Donation.sol";

contract ContractBTest is Test {
    Donation donation;
    uint256 testNumber;
    address alice = vm.addr(1);
    address bob = vm.addr(2);
    address caleb = vm.addr(3);

    function setUp() public {
        donation = new Donation();
    }

    function testDonate() public {
        donation.donate{value: 1000}();
        assertEq(donation.userDonations(address(this)), 1000);
    }

    function testClaimUnicefCoins() public {
        donation.donate{value: 1000}();
        donation.claimUnicefCoins();
        assertEq(donation.userDonations(address(this)), 0);
        assertEq(donation.unitokenBalance(), 1000);
    }
}
