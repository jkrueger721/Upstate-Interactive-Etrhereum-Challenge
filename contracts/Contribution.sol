pragma solidity >= 0.5.0;
import "contracts/NewToken.sol";
import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
contract Contribution is NewToken {
    using SafeMath for uint256;
    mapping (uint256 => address) contributors;

}