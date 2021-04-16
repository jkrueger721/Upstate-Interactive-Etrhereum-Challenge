pragma solidity >=0.5.0;
import "/home/johnk/Programming/truffle-shavings/node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "/home/johnk/Programming/truffle-shavings/node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

contract NewToken is ERC20Mintable, ERC20Detailed {
    uint256 _startTime;
    uint256 _endTime;
    uint256 _currentTime;

    constructor(
        uint256 startTime,
        uint256 endTime,
        string memory name,
        string memory symbol,
        uint8 decimals
    ) public ERC20Mintable() ERC20Detailed(name, symbol, decimals) {
        _startTime = now + startTime;
        _endTime = now + endTime;
    }
}
