//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract UnicefCoins is ERC20 {
    // address public immutable OWNER;
    address public immutable TREASURY;
    bool public taxOnOff;

    /// @notice modifier controling who can call functions
    modifier onlyOwner() {
        if (msg.sender != TREASURY) {
            revert NotOwnerAddress(msg.sender);
        }
        _;
    }

    constructor(
        address _tresury
        // address _owner
    ) ERC20("UnicefCoin", "UNI") {
        TREASURY = _tresury;
        // OWNER = _owner;
        _mint(_tresury, 350000 * 1e18);
        taxOnOff = false;
    }

    /**
    @notice function used to transfer UnicefCoins
    @dev overriden function of ERC20 transfer to include possbility for 2% tax on any transaction
     */    
    function transfer(address to, uint256 amount)
        public
        override
        returns (bool)
    {
        address treasury = _msgSender();
        if (taxOnOff == true) {
            uint256 amount_to_user = (amount * 9800) / 10000;
            _transfer(treasury, to, amount_to_user);
        } else {
            _transfer(treasury, to, amount);
        }
        return true;
    }

    /// @notice function used to toggles on/off tax switch     
    function taxSwitch() public onlyOwner returns (bool) {
        taxOnOff = !taxOnOff;
        emit TaxSwitch(taxOnOff);
        return true;
    }
    
    /// @notice emits event when tax changae state
    event TaxSwitch(bool tax_on_off);

    /// @notice error returned when not the owner address try to call function
    error NotOwnerAddress(address _address);
}
