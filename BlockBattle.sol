// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Game is Ownable{
    mapping(address => bool) public isPlayer;
    mapping(address => uint256) public scores;
    uint256 public count;
    address public someone;
    uint16 public count2;
    uint8 public count3;
    address public someone2;
    event NewPlayer(address indexed player);
    event NewScore(address indexed player, uint256 indexed score);
    event ExternalEvent(uint256 indexed count);


    modifier onlyPlayer(){
        require(isPlayer[msg.sender],"Please register as player");
        _;
    }

    function register() external{
        require(!isPlayer[msg.sender],"Already registered as a player");
        isPlayer[msg.sender] = true;
        emit NewPlayer(msg.sender);
    }

    function addPoint() external onlyPlayer{
        scores[msg.sender] += 1;
        emit NewScore(msg.sender,scores[msg.sender]);
    }

    function run() external{
        count = count+1;
        emit ExternalEvent(count);
    }
}