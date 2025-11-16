# @version ^0.3.0
# @license MIT

name: public(String[64])
symbol: public(String[32])
decimals: public(uint256)
totalSupply: public(uint256)

@external
def __init__(_name: String[64], _symbol: String[32], _decimals: uint256, _totalSupply: uint256):
    self._name = _name
    self._symbol = _symbol
    self.decimals = _decimals
    self.totalSupply = _totalSupply
