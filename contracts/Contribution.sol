pragma solidity >=0.5.0;
import "contracts/NewToken.sol";
import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";

contract Contribution is NewToken, Crowdsale {
    using SafeMath for uint256;
    mapping(address => Contributor) contributors;
    address payable owner;

    constructor(
        uint256 startTime,
        uint256 endTime,
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 rate,
        address payable wallet,
        IERC20 token
    )
        public
        NewToken(startTime, endTime, name, symbol, decimals)
        Crowdsale(rate, wallet, token)
    {
        owner = msg.sender;
        mint(owner, 2500000);
        wallet = owner;
    }

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
        address payable contributorAddress;
        uint256 contributionAmount;
    }

    function getTokenTotalSupply() public view {
        totalSupply();
    }

    function getContributorAmount(address _contributor)
        public
        returns (uint256)
    {
        return contributors[_contributor].contributionAmount;
    }

    function getContributorTokenBalance(address _contributor)
        public
        returns (uint256)
    {
        balanceOf(_contributor);
    }

    function donate() external payable isOpen {
        require(msg.value > 0, "Needs to be sent will value");

        uint256 _amount = msg.value;

        address payable _contributor = msg.sender;

        uint256 _contributionAmount = 0;

        contributors[_contributor].contributorAddress = _contributor;

        _contributionAmount == _contributionAmount.add(_amount);

        contributors[_contributor].contributionAmount = _contributionAmount;

        owner.transfer(_amount);

        transferToken(_contributor);

        emit donationContributed(now, _contributor, _amount);
    }

    function transferToken(address _contributor) internal isOpen {
        uint256 _contributorValue =
            contributors[_contributor].contributionAmount;
        transferFrom(owner, _contributor, _contributorValue);
        emit tokensTransfered(_contributor, _contributorValue);
    }
}
