// Put Functions Below
function funct_diceVisual(_result, _xPosition, _yPosition, _modifier, _diceSize)
{
	var _diceObject = obj_diceRoll20;
	switch (_diceSize)
	{
		case(4):
			_diceObject = obj_diceRoll4;
			break;
		case(6):
			_diceObject = obj_diceRoll6;
			break;
		case(8):
			_diceObject = obj_diceRoll8;
			break;
		case(10):
			_diceObject = obj_diceRoll10;
			break;
		case(12):
			_diceObject = obj_diceRoll12;
			break;
		case(20):
			_diceObject = obj_diceRoll20;
			break;
	}		
			
	var _diceInstance = instance_create_layer(_xPosition, _yPosition, "Dice_Rolls", _diceObject);
	_diceInstance.result = _result;
	_diceInstance.modifier = _modifier;
	return _diceInstance;
	
}

