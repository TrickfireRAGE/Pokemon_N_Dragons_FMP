// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function funct_modifierCheck(_stat)
{
	var _modifier = "NOT_SET";
	switch (_stat)
		{
			case(0):
			case(1):
				_modifier = -5;
				return _modifier;
				break;
			case(2):
			case(3):
				_modifier = -4;
				return _modifier;
				break;
			case(4):
			case(5):
				_modifier = -3;
				return _modifier;
				break;
			case(6):
			case(7):
				_modifier = -2;
				return _modifier;
				break;
			case(8):
			case(9):
				_modifier = -1;
				return _modifier;
				break;				
			case(10):
			case(11):
				_modifier = 0;
				return _modifier;
				break;
			case(12):
			case(13):
				_modifier = 1;
				return _modifier;
				break
			case(14):
			case(15):
				_modifier = 2;
				return _modifier;
				break;
			case(16):
			case(17):
				_modifier = 3;
				return _modifier;
				break;
			case(18):
			case(19):
				_modifier = 4;
				return _modifier;
				break;
			case(20):
			case(21):
				_modifier = 5;
				return _modifier;
				break;
			case(22):
			case(23):
				_modifier = 6;
				return _modifier;
				break;
			case(24):
			case(25):
				_modifier = 7;
				return _modifier;
				break;
		}
}

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