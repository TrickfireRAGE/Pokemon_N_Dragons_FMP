// Put Functions Below
function funct_d20Visual(_result, _xPosition, _yPosition, _modifier)
{
	var _diceInstance = instance_create_layer(_xPosition, _yPosition, "Dice_Rolls", obj_diceRoll20);
	_diceInstance.result = _result;
	_diceInstance.modifier = _modifier;
	return _diceInstance;
	
}