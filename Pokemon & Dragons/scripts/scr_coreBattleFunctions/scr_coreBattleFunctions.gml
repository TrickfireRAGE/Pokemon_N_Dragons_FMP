// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function funct_initiativeRoll(_dexterityModifier, _additionalModifier)
{
	var _roll = funct_diceRoll(20)
	if (_additionalModifier != undefined)
	{
		var _rolled = _roll + _dexterityModifier + _additionalModifier;
		return _rolled
	}
	else
	{
		var _rolled = _roll + _dexterityModifier;
		return _rolled
	}
}

function funct_diceRoll(_diceSize)
{
	return (irandom_range(1, _diceSize));
}