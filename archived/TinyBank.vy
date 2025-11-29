# @version ^0.4.1
# @license MIT

import ManagedAccess as ManagedAccess
initializes: ManagedAccess

INIT_REWARD: constant(uint256) = 1 * 10 ** 18

interface IMyToken:
    def transfer(_amount: uint256, _to: address): nonpayable
    def transferFrom(_owner: address, _to: address, _amount: uint256): nonpayable
    def mint(_amount: uint256, _to: address): nonpayable

event Staked:
    _owner: indexed(address)
    _amount: uint256

event Withdraw:
    _amount: uint256
    _to: indexed(address)

staked: public(HashMap[address, uint256])
totalStaked: public(uint256)

stakingToken: IMyToken

rewardPerBlock: uint256
lastClaimedBlock: HashMap[address, uint256]
# owner: address
# manager: address

@deploy
def __init__(_stakingToken: IMyToken):
    self.stakingToken = _stakingToken
    self.rewardPerBlock = INIT_REWARD
    ManagedAccess.__init__(msg.sender, msg.sender)
    # self.owner = msg.sender
    # self.manager = msg.sender

# @internal
# def onlyOwner(_owner: address):
#     assert _owner == self.owner, "You are not authorized"
