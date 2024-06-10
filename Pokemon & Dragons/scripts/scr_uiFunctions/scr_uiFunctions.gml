// This Script is for all the functions used for the UI for easier coding


function funct_textUI(_xPosition, _yPosition, _string, _scale, _colour, _alpha, _alignment)
{
	if (_alignment != undefined)
	{
		draw_set_halign(_alignment);
	}
	
	draw_text_transformed_colour(_xPosition, _yPosition,
	_string,
	_scale, _scale,
	0,
	_colour, _colour,
	_colour, _colour,
	_alpha);
}

function funct_selectionUI(_xPosition, _yPositionArray, _optionVariable, _sprite, _spriteSubImage, _lengthArray, _scaleX, _scaleY, _alpha, _colour)
{
	for (var i = 0; i <= _lengthArray; i++;)
	{
		if (_optionVariable == i)
		{
			draw_sprite_ext(_sprite, _spriteSubImage,
			_xPosition, _yPositionArray[i],
			_scaleX, _scaleY,
			0, _colour,
			_alpha);
		}
	}
}

function funct_soundBarUI(_sound, _xPosition, _yPosition, _scale, _colour) // Redo this
{
	_sound *= 100;
	var _soundText = string_format(_sound, 3, 0);
	var _scaleTextNumber = _scale * 2;
	var _scaleTextTitle = _scale * 1.5;
	var _scaleArrows = _scale * 0.8;
	draw_set_halign(fa_center);
	
	var _yPositionA = _yPosition / 2.5;

	funct_textUI(_xPosition, _yPositionA,
		"Volume", _scaleTextTitle,
		_colour, 1);

	funct_textUI(_xPosition, _yPosition,
		_soundText, _scaleTextNumber,
		_colour, 1);
	
	var _xPositionB = _xPosition / 2;
	var _xPositionC = _xPosition * 1.5;
	
	draw_sprite_ext(spr_choiceArrow, 0,
			_xPositionC, _yPosition,
			_scaleArrows, _scaleArrows,
			0, _colour,
			1);
	
	draw_sprite_ext(spr_choiceArrow, 0,
			_xPositionB, _yPosition,
			_scaleArrows, _scaleArrows,
			180, _colour,
			1);
	
	draw_set_halign(fa_left);
}

function funct_battleHealthUI(_sprite, _currentHealth, _maxHP, _lv, _name)
{
	var _scale = (global.gameResolutionWidth / 1920) * 4;
	var _hpPercentage = _currentHealth / _maxHP;
	var _hpPercentageImage = (_hpPercentage * 100) - 1;
	var _xPosition = "NOT_SET";
	var _yPosition = "NOT_SET";
	
	floor(_currentHealth);
	
	switch (_sprite) // Updated Health Code to remove need for local variables within coreUI
	{
		case(spr_healthPlayerUI):
			_xPosition = global.gameResolutionWidth / 9;
			_yPosition = global.gameResolutionHeight / 1.25;
			break;
		case(spr_healthOpponentUI):
			_xPosition = global.gameResolutionWidth / 3;
			_yPosition = global.gameResolutionHeight / 22;
			break;
	}
	
	var _textColour = c_black;
	var _xPositionText = _xPosition + ((global.gameResolutionWidth / 1920) * 30);
	var _xPositionLevel = _xPosition + (114 * _scale); // Using Magic number for ease of working (Update in future)
	var _xPositionHP = _xPositionLevel - (10 * _scale);
	var _yPositionText = _yPosition + ((global.gameResolutionWidth / 1920) * 50);
	var _textScale = (global.gameResolutionWidth / 1920) * 2;
	
	if (_hpPercentageImage < 0)
	{
		_hpPercentageImage = 101;
	}
	
	draw_sprite_ext(_sprite, _hpPercentageImage, 
		_xPosition, _yPosition, 
		_scale, _scale, 
		0, c_white, 1);
	funct_textUI(_xPositionText, _yPositionText,
		_name, _textScale,
		_textColour, 1, fa_left);
	funct_textUI(_xPositionLevel, _yPositionText,
		_lv, _textScale, _textColour,
		1, fa_center);
	if (_sprite == spr_healthPlayerUI)
	{
		var _scaleHP = (global.gameResolutionWidth / 1920);
		var _yPositionHP = _yPositionText + ((global.gameResolutionWidth / 1920) * 40);
		_currentHealth = floor(_currentHealth); // Implemented to have whole number on Health Bar
		var _stringHP = string(_currentHealth) + "/" + string(_maxHP);
		
		funct_textUI(_xPositionHP, _yPositionHP,
			_stringHP, _scaleHP,
			_textColour, 1,
			fa_center);
	}
}

function funct_colourTypeUI(_moveType, _colourArray)
{
	for (var i = 0; i <= enumType.dark; i++;)
	{
		if (_colourArray[enumTypeColRows.stringType][i] == _moveType)
		{
			var _colour = _colourArray[enumTypeColRows.colour][i];
			return _colour;
		}
	}
}

function funct_textBoxUI(_string) // Try and implement in later build
{
	//
	
}