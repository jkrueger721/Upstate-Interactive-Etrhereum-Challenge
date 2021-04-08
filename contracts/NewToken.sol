pragma solidity >=0.5.0;
import "/home/johnk/Programming/truffle-shavings/node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
contract NewToken is ERC20Mintable {
  
    uint256 _startTime; 
    uint256 _endTime;
    uint256 _currentTime; 

  constructor(uint256 startTime, uint256 endTime)
   public {
      _startTime = startTime;
      _endTime = endTime;
      
  }

  modifier isOpen(){
    _currentTime = now;
    require(_currentTime >= _startTime && _currentTime <= _endTime,"Is outside of alloted time");
    _;

  }
}