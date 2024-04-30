/// @description 

switch (room)
{
	case(rm_titleMenu):
		// Title Logo
		var _gameLogoX = global.gameResolutionWidth / 1.3; // Local Variable for Game Logo X
		var _gameLogoY = global.gameResolutionHeight / 2.5; // Local Variable for Game Logo Y
		var _gameLogoScale = global.gameResolutionWidth / 1920; // Scales the image depending on what resolution the game is running at.
		// Title Press Start Text
		var _startTextX = global.gameResolutionWidth / 1.6;
		var _startTextY = global.gameResolutionHeight / 1.5;
		var _startTextString = "Press Start";
		// Core Local Text Variables
		var _menuTextScale = (global.gameResolutionWidth / 1920) * 3;
		var _textColour = c_white;
		var _selectedColour = c_green;
		var _textAlpha = 1;
		draw_set_valign(fa_middle);
		draw_set_font(fnt_kyoMadoka); // Sets the Font for the Game
		
		// UI Layout Array
		var _menuX = global.gameResolutionWidth / 20; // X Position for Base UI
		var _menuY = [];
		_menuY[0] = global.gameResolutionHeight / 5;
		_menuY[1] = global.gameResolutionHeight / 3.3;
		_menuY[2] = global.gameResolutionHeight / 2.5;
		_menuY[3] = global.gameResolutionHeight / 2;
		_menuY[4] = global.gameResolutionHeight / 1.65;
		_menuY[5] = global.gameResolutionHeight / 1.4;
		_menuY[6] = global.gameResolutionHeight / 1.2;
		
		// UI Selection Variables
		var _selectionX = global.gameResolutionWidth / 35;
		var _selectionSprite = spr_choiceArrow;
		var _selectionSubImage = 0;
		var _selectionAlpha = 1;
		var _selectionColour = c_white;
		
		// Version Number Variables
		var _versionNumberY = global.gameResolutionHeight / 1.05;
		var _versionNumberX = global.gameResolutionWidth / 1.4;
		var _versionScale = (_menuTextScale / 2);
		var _versionNumberString = "Pre-Alpha - V0.0.0.5";
		
		funct_textUI(_versionNumberX, _versionNumberY,
			_versionNumberString, _versionScale,
			_textColour, titleScreenAlphaLogo);
		
		// UI Code
		
		switch(global.menuState)
		{
			case(enumTitleScreenState.pressStart):
				if (titleScreenAlphaLogo <= 1)
				{
					draw_sprite_ext(spr_gameLogo, 0,
						_gameLogoX, _gameLogoY,
						_gameLogoScale, _gameLogoScale,
						0, c_white,
						titleScreenAlphaLogo);
					titleScreenAlphaLogo += 0.01;
				}
				else
				{
			
					draw_sprite_ext(spr_gameLogo, 0,
						_gameLogoX, _gameLogoY,
						_gameLogoScale, _gameLogoScale,
						0, c_white,
						titleScreenAlphaLogo);
					
					if (titleScreenAlphaText <= 1)
					{
						funct_textUI(_startTextX, _startTextY,
							_startTextString, _menuTextScale,
							_textColour, titleScreenAlphaText);
						titleScreenAlphaText += 0.01;
					}
					else
					{
						funct_textUI(_startTextX, _startTextY,
							_startTextString, _menuTextScale,
							_textColour, titleScreenAlphaText);
					}
				}
				break;
				
			case(enumTitleScreenState.mainMenu):
				// Array String
				var _mainMenuArrayLength = 3;
				var _titleScreenString = [];
				_titleScreenString[0] = "New Game";
				_titleScreenString[1] = "Continue";
				_titleScreenString[2] = "Settings";
				_titleScreenString[3] = "Exit Game";
				// UI
				draw_sprite_ext(spr_gameLogo, 0,
					_gameLogoX, _gameLogoY,
					_gameLogoScale, _gameLogoScale,
					0, c_white,
					titleScreenAlphaLogo);
					
				if (titleScreenAlphaText > 0)
				{
					funct_textUI(_startTextX, _startTextY,
						_startTextString, _menuTextScale,
						_textColour, titleScreenAlphaText);
					titleScreenAlphaText -= 0.01;
				}
				else
				{
					for (var i = 0; i <= _mainMenuArrayLength; i++;)
					{
						funct_textUI(_menuX, _menuY[i],
							_titleScreenString[i], _menuTextScale,
							_textColour, _textAlpha);
					}
					funct_selectionUI(_selectionX, _menuY,
						global.titleScreenOptions, _selectionSprite,
						_selectionSubImage, _mainMenuArrayLength,
						_gameLogoScale, _selectionAlpha,
						_selectionColour);
				}
				break;
			case(enumTitleScreenState.settingsMenu):
				switch (global.settingsMenuState)
				{
					case(enumSettingsScreenState.settingsBase):
						// Text Array
						var _settingsArrayLength = 5;
						var _settingsString = [];
						_settingsString[0] = "Resolution";
						_settingsString[1] = "FullScreen";
						_settingsString[2] = "Sound";
						_settingsString[3] = "Controls";
						_settingsString[4] = "Credits";
						_settingsString[5] = "Return to Main Menu";
						// UI
						for(var i = 0; i <= _settingsArrayLength; i++;)
						{
							funct_textUI(_menuX, _menuY[i],
								_settingsString[i], _menuTextScale,
								_textColour, _textAlpha);
						}
						funct_selectionUI(_selectionX, _menuY,
							global.settingsScreenOptions, _selectionSprite,
							_selectionSubImage, _settingsArrayLength,
							_gameLogoScale, _selectionAlpha,
							_selectionColour);
						
						break;
					case(enumSettingsScreenState.resolution):
						// Text Variables
						var _displayResolution = display_get_height();
						var _textAlpha = 1;
						var _notAvailableAlpha = 0.8;
						var _notAvailableColour = c_grey;
						var _returnString = "Return To Settings";
						var _resolutionArrayLength = 5;
						var _resolutionSelectionLength = 6;
						// Strings for Resolution
						var _stringResolution = [];
						_stringResolution[0] = "640 X 480P";
						_stringResolution[1] = "960 X 540P";
						_stringResolution[2] = "1280 X 720P";
						_stringResolution[3] = "1920 X 1080P";
						_stringResolution[4] = "2560 X 1440P";
						_stringResolution[5] = "3840 X 2160P";
						//
						var _resolutionArray = [];
						_resolutionArray[0] = 480;
						_resolutionArray[1] = 540;
						_resolutionArray[2] = 720;
						_resolutionArray[3] = 1080;
						_resolutionArray[4] = 1440;
						_resolutionArray[5] = 2160;
						
						for (var i = 0; i <= _resolutionArrayLength; i++;)
						{
							if (_displayResolution >= _resolutionArray[i])
							{
								switch (global.gameResolutionHeight)
								{
									case(_resolutionArray[i]):
										funct_textUI(_menuX, _menuY[i],
											_stringResolution[i], _menuTextScale,
											_selectedColour, _textAlpha);
										break;
									default:
										funct_textUI(_menuX, _menuY[i],
											_stringResolution[i], _menuTextScale,
											_textColour, _textAlpha);
										break;
								}
							}
							else if (_displayResolution < _resolutionArray[i])
							{
								funct_textUI(_menuX, _menuY[i],
									_stringResolution[i], _menuTextScale,
									_notAvailableColour, _notAvailableAlpha);
							}
						}
						funct_textUI(_menuX, _menuY[6],
						_returnString, _menuTextScale,
						_textColour, _textAlpha);
						
						funct_selectionUI(_selectionX, _menuY,
							global.settingsScreenOptions, _selectionSprite,
							_selectionSubImage, _resolutionSelectionLength,
							_gameLogoScale, _selectionAlpha,
							_selectionColour);
						
						break;
					case(enumSettingsScreenState.fullScreen):
						// Local Variables
						var _fullScreenArrayLength = 2;
						var _fullScreenString = [];
						_fullScreenString[0] = "Windowed";
						_fullScreenString[1] = "FullScreen";
						_fullScreenString[2] = "Return to Settings";						
						
						switch (window_get_fullscreen())
						{
							case(false):
								funct_textUI(_menuX, _menuY[0],
									_fullScreenString[0], _menuTextScale,
									_selectedColour, _textAlpha);
								funct_textUI(_menuX, _menuY[1],
									_fullScreenString[1], _menuTextScale,
									_textColour, _textAlpha);
								break;
							case(true):
								funct_textUI(_menuX, _menuY[0],
									_fullScreenString[0], _menuTextScale,
									_textColour, _textAlpha);
								funct_textUI(_menuX, _menuY[1],
									_fullScreenString[1], _menuTextScale,
									_selectedColour, _textAlpha);
								break;
						}
						funct_textUI(_menuX, _menuY[2],
							_fullScreenString[2], _menuTextScale,
							_textColour, _textAlpha);
							
						funct_selectionUI(_selectionX, _menuY,
							global.settingsScreenOptions, _selectionSprite,
							_selectionSubImage, _fullScreenArrayLength,
							_gameLogoScale, _selectionAlpha,
							_selectionColour);
						break;
						
					case(enumSettingsScreenState.sound):
						var _xSound = (global.gameResolutionWidth / 2);
						var _ySound = (global.gameResolutionHeight / 2);
						funct_soundBarUI(global.soundVolume, _xSound,
							_ySound, _menuTextScale,
							_textColour);
						break;
						
					case(enumSettingsScreenState.controls):
						var _xTemp = global.gameResolutionWidth / 2;
						var _yTemp = global.gameResolutionHeight / 2;
						draw_set_halign(fa_center);
						funct_textUI(_xTemp, _yTemp,
							"Unavailable in Preview", _menuTextScale,
							_textColour, _textAlpha);
						draw_set_halign(fa_left);
						// Type Controls Visuals / Temporary Visual here
						break;
					case(enumSettingsScreenState.credits):
						var _xTemp = global.gameResolutionWidth / 2;
						var _yTemp = global.gameResolutionHeight / 2;
						draw_set_halign(fa_center);
						funct_textUI(_xTemp, _yTemp,
							"Not Implemented in This Version", _menuTextScale,
							_textColour, _textAlpha);
						draw_set_halign(fa_left);
						// Type full credits later
						break;
				}
		}
		// put other stuff here
		break;
}


