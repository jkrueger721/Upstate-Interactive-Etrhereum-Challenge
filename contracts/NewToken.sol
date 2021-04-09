pragma solidity >=0.5.0;
import "/home/johnk/Programming/truffle-shavings/node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
contract NewToken is ERC20 {
  
    uint256 _startTime; 
    uint256 _endTime;
    uint256 _currentTime; 
    address payable owner;
    uint256 value;

  constructor(uint256 startTime, uint256 endTime)
   public {
      _startTime = now + startTime;
      _endTime = now + endTime;
      owner = msg.sender;
    
  } 
    //  mint(owner, value);

  modifier isOpen(){
    _currentTime = now;
    require(_currentTime >= _startTime && _currentTime <= _endTime,"Is outside of alloted time");
    _;

  }
}