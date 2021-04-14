pragma solidity >=0.5.0;
import "/home/johnk/Programming/truffle-shavings/node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract NewToken is ERC20 {
    uint256 _startTime;
    uint256 _endTime;
    uint256 _currentTime;
    address payable owner;

    constructor(uint256 startTime, uint256 endTime) ERC20() public {
        _startTime = now + startTime;
        _endTime = now + endTime;
        owner = msg.sender;
    }

   

   
}
