pragma solidity >=0.5.0;
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";


contract UpstateCoin is ERC20, TimedCrowdsale  {
    //  uint256 private _startTime;
    //  uint256 private _endtime;

    constructor(uint256 openingTime, uint256 closingTime) 
        TimedCrowdsale(openingTime, closingTime) public {

           //TODO
        }
  


}

