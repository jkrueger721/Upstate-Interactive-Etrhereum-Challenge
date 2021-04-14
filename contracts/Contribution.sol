pragma solidity >=0.5.0;
import "contracts/NewToken.sol";
import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Contribution is NewToken {
    using SafeMath for uint256;
    mapping(address => Contributor) contributors;

    constructor(uint256 startTime, uint256 endTime)
        public
        NewToken(startTime, endTime)
    {}

    modifier isOpen() {
        _currentTime = now;
        require(
            _currentTime >= _startTime && _currentTime <= _endTime,
            "Is outside of alloted time"
        );
        _;
    }

    event donationContributed(uint256 date, address from, uint256 amount);

    event tokensTransfered(address to, uint256 amount);

    struct Contributor {
        address contributorAddress;
        uint256 contributionAmount;
    }

    function donate() external payable isOpen {
        require(msg.value > 0, "Needs to be sent will value");
        uint256 _amount = msg.value;
        address _contributor = msg.sender;
        contributors[_contributor].contributorAddress = _contributor;
        contributors[_contributor].contributionAmount.add(_amount);
        emit donationContributed(now, _contributor, _amount);
    }

    function transferToken(address _contributor) external payable isOpen returns(bool){
        uint256 _contributorValue =
            contributors[_contributor].contributionAmount;
        transfer(_contributor, _contributorValue);
        emit tokensTransfered(_contributor, _contributorValue);
    }
}
