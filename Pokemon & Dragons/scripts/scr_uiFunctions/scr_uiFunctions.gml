// This Script is for all the functions used for the UI for easier coding


function funct_textUI(_xPosition, _yPosition, _string, _scale, _colour, _alpha)
{
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

function funct_soundBarUI(_sound, _xPosition, _yPosition, _scale, _colour)
{
	_sound *= 100;
	var _soundText = string_format(_sound, 3, 0);
	var _scaleTextNumber = _scale * 3;
	var _scaleTextTitle = _scale * 2;
	draw_set_halign(fa_center);
	
	var _yPositionA = _yPosition / 3;

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
			_scale, _scale,
			0, _colour,
			1);
	
	draw_sprite_ext(spr_choiceArrow, 0,
			_xPositionB, _yPosition,
			_scale, _scale,
			180, _colour,
			1);
	
	draw_set_halign(fa_left);
}