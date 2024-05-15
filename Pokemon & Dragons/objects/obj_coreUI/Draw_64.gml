/// @description 

switch (room)
{
	case(rm_titleMenu):
		#region Title Screen UI Variables
		// Title Logo
		var _gameLogoX = global.gameResolutionWidth / 1.35; // Local Variable for Game Logo X
		var _gameLogoY = global.gameResolutionHeight / 2.7; // Local Variable for Game Logo Y
		var _gameLogoScale = (global.gameResolutionWidth / 1920) * 0.8; // Scales the image depending on what resolution the game is running at.
		// Title Press Start Text
		var _startTextX = global.gameResolutionWidth / 1.65;
		var _startTextY = global.gameResolutionHeight / 1.5;
		var _startTextString = "Press Start";
		// Core Local Text Variables
		var _menuTextScale = (global.gameResolutionWidth / 1920) * 3;
		var _textColour = c_black;
		var _selectedColour = c_green;
		var _textAlpha = 1;
		var _notAvailableAlpha = 0.8;
		var _notAvailableColour = c_grey;
		var _quoteScaling = (global.gameResolutionWidth / 1920) * 1.3;
		draw_set_valign(fa_middle);
		draw_set_font(fnt_kyoMadoka); // Sets the Font for the Game
		
		// UI Layout Array
		var _menuX = global.gameResolutionWidth / 12; // X Position for Base UI
		var _menuY = [];
		_menuY[0] = global.gameResolutionHeight / 5;
		_menuY[1] = global.gameResolutionHeight / 3.3;
		_menuY[2] = global.gameResolutionHeight / 2.5;
		_menuY[3] = global.gameResolutionHeight / 2;
		_menuY[4] = global.gameResolutionHeight / 1.65;
		_menuY[5] = global.gameResolutionHeight / 1.4;
		_menuY[6] = global.gameResolutionHeight / 1.2;
		var _menuXQuote = global.gameResolutionWidth / 9;
		var _menuYQuote = global.gameResolutionHeight / 1.2;
		
		// UI Selection Variables
		var _selectionXMenu = global.gameResolutionWidth / 5.2;
		var _selectionXSettings = global.gameResolutionWidth / 4.5;
		var _selectionSprite = spr_choiceCircleSmall;
		var _selectionSubImage = 0;
		var _selectionAlpha = 0.7;
		var _selectionScaleXMenu = (global.gameResolutionWidth / 1920) * 7;
		var _selectionScaleXSettings = (global.gameResolutionWidth / 1920) * 10;
		var _selectionScaleY = (global.gameResolutionWidth / 1920) * 8;
		var _selectionColour = c_white;
		
		// Version Number Variables
		var _versionNumberY = global.gameResolutionHeight / 1.06;
		var _versionNumberX = global.gameResolutionWidth / 1.5;
		var _versionScale = (_menuTextScale / 2);
		var _versionNumberString = versionNumber;
		funct_textUI(_versionNumberX, _versionNumberY,
			_versionNumberString, _versionScale,
			_textColour, titleScreenAlphaLogo);
			
		#endregion
		switch(global.menuState)
		{
			case(enumTitleScreenState.pressStart):
				#region Start Screen UI
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
				#endregion
				break;
			case(enumTitleScreenState.mainMenu):
				#region Main Menu UI
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
						if (i == 1)
						{
							funct_textUI(_menuX, _menuY[i],
								_titleScreenString[i], _menuTextScale,
								_notAvailableColour, _notAvailableAlpha);
						}
						else
						{
							funct_textUI(_menuX, _menuY[i],
								_titleScreenString[i], _menuTextScale,
								_textColour, _textAlpha);
						}
					}
					funct_selectionUI(_selectionXMenu, _menuY,
						global.titleScreenOptions, _selectionSprite,
						_selectionSubImage, _mainMenuArrayLength,
						_selectionScaleXMenu, _selectionScaleY,
						_selectionAlpha, _selectionColour);
				}
				#endregion
				break;
			case(enumTitleScreenState.newGame):
				#region New Game UI
				// Array String
				switch (global.newGameMenuState)
				{
					case(enumNewGameState.newGame):
						#region New Game Main UI
						var _newGameArrayLength = 3;
						var _newGameStringChoices = [];
						_newGameStringChoices[0] = "Story";
						_newGameStringChoices[1] = "LV1 Battle";
						_newGameStringChoices[2] = "LV20 Battle";
						_newGameStringChoices[3] = "Return";
						var _newGameQuotes = [];
						_newGameQuotes[0] = "Embark on an Adventure \n with your Pokemon Friends!";
						_newGameQuotes[1] = "Battle your Rival \n using the Starter Pokemon!";
						_newGameQuotes[2] = "Feel a glimpse of the future \n with this battle!";
						_newGameQuotes[3] = "Go back to the Main Menu.";
						// UI Code
						for (var i = 0; i <= _newGameArrayLength; i++;)
						{
							if (i == 0)
							{
								funct_textUI(_menuX, _menuY[i],
									_newGameStringChoices[i], _menuTextScale,
									_notAvailableColour, _notAvailableAlpha);
							}
							else
							{
								funct_textUI(_menuX, _menuY[i],
									_newGameStringChoices[i], _menuTextScale,
									_textColour, _textAlpha);
							}
						}
						for (var i = 0; i <= _newGameArrayLength; i++)
						{
							if (i == global.newGameOptions)
							{
								funct_textUI(_menuXQuote, _menuYQuote,
									_newGameQuotes[i], _quoteScaling,
									_textColour, _textAlpha);
							}
						}	
						funct_selectionUI(_selectionXMenu, _menuY,
							global.newGameOptions, _selectionSprite,
							_selectionSubImage, _newGameArrayLength,
							_selectionScaleXMenu, _selectionScaleY,
							_selectionAlpha, _selectionColour);
						#endregion
						break;
					case(enumNewGameState.level1Choice):
						#region Level 1 Choice UI
						var _xPokemonPika = global.gameResolutionWidth / 5.5;
						var _xPokemonRiolu = global.gameResolutionWidth / 1.5;
						var _yPokemon = global.gameResolutionHeight / 1.4;
						
						funct_textUI(_xPokemonPika, _yPokemon,
							"Pikachu", _menuTextScale,
							_textColour, _textAlpha);
						funct_textUI(_xPokemonRiolu, _yPokemon,
							"Riolu", _menuTextScale,
							_textColour, _textAlpha);
						#endregion
						break;
					case(enumNewGameState.endGameChoice):
						#region End Game Choice UI
						var _xPokemonPika = global.gameResolutionWidth / 5.5;
						var _xPokemonLucario = global.gameResolutionWidth / 1.6;
						var _yPokemon = global.gameResolutionHeight / 1.4;
						
						funct_textUI(_xPokemonPika, _yPokemon,
							"Pikachu", _menuTextScale,
							_textColour, _textAlpha);
						funct_textUI(_xPokemonLucario, _yPokemon,
							"Lucario", _menuTextScale,
							_textColour, _textAlpha);
						#endregion
						break;
				
				}
				#endregion
				break;
			case(enumTitleScreenState.settingsMenu):
				#region Settings Menu UI
				switch (global.settingsMenuState)
				{
					case(enumSettingsScreenState.settingsBase):
						#region Main Settings UI
						// Text Array
						var _settingsArrayLength = 5;
						var _settingsString = [];
						_settingsString[0] = "Resolution";
						_settingsString[1] = "FullScreen";
						_settingsString[2] = "Sound";
						_settingsString[3] = "Controls";
						_settingsString[4] = "Credits";
						_settingsString[5] = "Return";
						// UI
						for(var i = 0; i <= _settingsArrayLength; i++;)
						{
							funct_textUI(_menuX, _menuY[i],
								_settingsString[i], _menuTextScale,
								_textColour, _textAlpha);
						}
						funct_selectionUI(_selectionXSettings, _menuY,
							global.settingsScreenOptions, _selectionSprite,
							_selectionSubImage, _settingsArrayLength,
							_selectionScaleXSettings, _selectionScaleY,
							_selectionAlpha, _selectionColour);
						#endregion
						break;
					case(enumSettingsScreenState.resolution):
						#region Resolution Settings UI
						// Text Variables
						var _displayResolution = display_get_height();
						var _returnString = "Return";
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
						
						funct_selectionUI(_selectionXSettings, _menuY,
							global.settingsScreenOptions, _selectionSprite,
							_selectionSubImage, _resolutionSelectionLength,
							_selectionScaleXSettings, _selectionScaleY,
							_selectionAlpha, _selectionColour);
						#endregion
						break;
					case(enumSettingsScreenState.fullScreen):
						#region FullScreen Settings UI
						// Local Variables
						var _fullScreenArrayLength = 2;
						var _fullScreenString = [];
						_fullScreenString[0] = "Windowed";
						_fullScreenString[1] = "FullScreen";
						_fullScreenString[2] = "Return";						
						
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
							
						funct_selectionUI(_selectionXSettings, _menuY,
							global.settingsScreenOptions, _selectionSprite,
							_selectionSubImage, _fullScreenArrayLength,
							_selectionScaleXSettings, _selectionScaleY,
							_selectionAlpha, _selectionColour);
						#endregion
						break;
					case(enumSettingsScreenState.sound):
						#region Sound Settings UI
						var _xSound = (global.gameResolutionWidth / 2);
						var _ySound = (global.gameResolutionHeight / 2);
						funct_soundBarUI(global.soundVolume, _xSound,
							_ySound, _menuTextScale,
							_textColour);
						#endregion
						break;
					case(enumSettingsScreenState.controls):
						#region Controls Settings UI
						var _xTemp = global.gameResolutionWidth / 2;
						var _yTemp = global.gameResolutionHeight / 2;
						draw_set_halign(fa_center); // PUT CONTROLLER TEXT HERE
						// funct_textUI(_xTemp, _yTemp,
							// "Unavailable in Preview", _menuTextScale, 
							// _textColour, _textAlpha);
						draw_set_halign(fa_left);
						// Type Controls Visuals / Temporary Visual here
						#endregion
						break;
					case(enumSettingsScreenState.credits):
						#region Credits Settings UI
						if (global.creditsCheck == false)
						{
							global.creditsCheck = true;
							if ((scrollHeight == "NOT_SET") or (scrollHeight != global.gameResolutionHeight))
							{
								scrollHeight = global.gameResolutionHeight + (global.gameResolutionHeight / 4);
							}
						}
						
						var _creditsTextScale = _menuTextScale / 3.5;
						var _creditsDistance = (20 * _menuTextScale);
						var _logoScale = _gameLogoScale / 1.5;
						scrollWidth = (global.gameResolutionWidth / 4);
						draw_set_halign(fa_center);
						for (var i = 0; i < creditsArraySize; i++;)
						{
							if (i == 0)
							{
								draw_sprite_ext(spr_gameLogo, 0,
									scrollWidth, scrollHeight,
									_logoScale, _logoScale,
									0, c_white,
									1)
							}
							else
							{
								funct_textUI(scrollWidth, (scrollHeight + (_creditsDistance * i)),
									creditsText[i], _creditsTextScale,
									_textColour, _textAlpha);
							}
						}
						scrollHeight -= (0.20 * _menuTextScale);
						draw_set_halign(fa_left);
						#endregion
						break;
				}
				#endregion
				break;
		}
		break;
	case(rm_battleRoom):
		switch (global.battleState)
		{
			case(enumBattleState.initiative):
				#region Initiative Visual Code
				var _xPositionPlayer = global.gameResolutionWidth / 4;
				var _xPositionOpponent = _xPositionPlayer * 3;
				var _xPositionModifier = global.gameResolutionWidth / 2;
				var _yPosition = global.gameResolutionHeight / 10;
				var _scale = (global.gameResolutionWidth / 1920) * 3
				var _colour = c_black;
				
				if (global.initiativeID == "NOT_SET")
				{
					exit;
				}
				else if (global.initiativeID.loopCounter <= global.initiativeID._timeLength)
				{
					funct_textUI(_xPositionPlayer, _yPosition,
						"Player Initiative", _scale,
						_colour, 1, fa_middle);
					funct_textUI(_xPositionOpponent, _yPosition,
						"Opponent Initiative", _scale,
						_colour, 1, fa_middle);
				}
				else if (global.initiativeID.loopCounter == global.initiativeID._timeLength + 1)
				{
					funct_textUI(_xPositionModifier, _yPosition,
						"Additional Modifier", _scale,
						_colour, 1, fa_middle);
				}
				else if (global.initiativeID.loopCounter == global.initiativeID._timeLength + 2)
				{
					initiativeAlpha = 1;
					switch (obj_coreTracker.firstTurn)
					{
						case (global.playerPokemonID[0]):
							funct_textUI(_xPositionModifier, _yPosition,
								"Player Goes First!", _scale,
								_colour, initiativeAlpha, fa_middle);
							break;
						case (global.opponentPokemonID[0]):
							funct_textUI(_xPositionModifier, _yPosition,
								"Opponent Goes First!", _scale,
								_colour, initiativeAlpha, fa_middle);
							break;
					}
				}
				else if (global.initiativeID.loopCounter == global.initiativeID._timeLength + 3)
				{
					switch (obj_coreTracker.firstTurn)
					{
						case (global.playerPokemonID[0]):
							funct_textUI(_xPositionModifier, _yPosition,
								"Player Goes First!", _scale,
								_colour, initiativeAlpha, fa_middle);
							break;
						case (global.opponentPokemonID[0]):
							funct_textUI(_xPositionModifier, _yPosition,
								"Opponent Goes First!", _scale,
								_colour, initiativeAlpha, fa_middle);
							break;
					}
				}
				else if (global.initiativeID.loopCounter == global.initiativeID._timeLength + 4)
				{
					switch (obj_coreTracker.firstTurn)
					{
						case (global.playerPokemonID[0]):
							funct_textUI(_xPositionModifier, _yPosition,
								"Player Goes First!", _scale,
								_colour, initiativeAlpha, fa_middle);
							break;
						case (global.opponentPokemonID[0]):
							funct_textUI(_xPositionModifier, _yPosition,
								"Opponent Goes First!", _scale,
								_colour, initiativeAlpha, fa_middle);
							break;
					}
					initiativeAlpha -= 0.01;
				}	
				#endregion
				break;
			case(enumBattleState.introSequence):
				//type here
				break;
			case(enumBattleState.player):
				var _xPosition = [];
				var _distanceX = 80 * (global.gameResolutionWidth / 1920);
				_xPosition[0] = global.gameResolutionWidth / 1.2;
				_xPosition[1] = _xPosition[0] - _distanceX;
				_xPosition[2] = _xPosition[1] - _distanceX;
				_xPosition[3] = _xPosition[2] - _distanceX;
				
				var _xPositionPP = [];
				_xPositionPP[0] = global.gameResolutionWidth / 1.5;
				_xPositionPP[1] = _xPositionPP[0] - _distanceX;
				_xPositionPP[2] = _xPositionPP[1] - _distanceX;
				_xPositionPP[3] = _xPositionPP[2] - _distanceX;
				
				var _xPositionAction = [];
				_xPositionAction[0] = global.gameResolutionWidth / 1.035;
				_xPositionAction[1] = _xPositionAction[0] - _distanceX;
				_xPositionAction[2] = _xPositionAction[1] - _distanceX;
				_xPositionAction[3] = _xPositionAction[2] - _distanceX;
				
				var _yPosition = [];
				var _distanceY = 100 * (global.gameResolutionWidth / 1920);
				_yPosition[0] = global.gameResolutionHeight / 1.6;
				_yPosition[1] = _yPosition[0] + _distanceY;
				_yPosition[2] = _yPosition[1] + _distanceY;
				_yPosition[3] = _yPosition[2] + _distanceY;
				
				var _xScale = (global.gameResolutionWidth / 1920) * 6;
				var _yScale = (global.gameResolutionHeight / 1080) * 7;
				
				var _textScale = (global.gameResolutionWidth / 1920) * 2;
				var _textColour = c_black;
				var _textString = [];
				_textString[0] = "FIGHT";
				_textString[1] = "POKEMON";
				_textString[2] = "BAG";
				_textString[3] = "END TURN";
				
				var _xHealthUIPlayer = global.gameResolutionWidth / 9;
				var _xHealthUIOpponent = global.gameResolutionWidth / 3;
				var _yHealthUIPlayer = global.gameResolutionHeight / 1.25;
				var _yHealthUIOpponent = global.gameResolutionHeight / 22;
				
				switch (global.playerBattleState)
				{
					case(enumPlayerTurnState.baseMenu):
						#region Base Menu
						for (var i = 0; i <= 3; i++;)
						{
							if (global.playerChoiceBattle == i)
							{
								draw_sprite_ext(spr_battleUISelection, 0,
									_xPosition[i], _yPosition[i],
									_xScale, _yScale,
									0, c_white,
									1);
							}
							else
							{
								draw_sprite_ext(spr_battleUI, 0,
									_xPosition[i], _yPosition[i],
									_xScale, _yScale,
									0, c_white,
									1);
							}
						}
						for (var i = 0; i <= 3; i++;)
						{
							funct_textUI(_xPosition[i], _yPosition[i],
								_textString[i], _textScale,
								_textColour, 1,
								fa_middle);
						}
						// Update to allow for dynamic changing of stats depending on which pokemon is in play
						funct_battleHealthUI(spr_healthPlayerUI, obj_playerPokemon.pokemonParty[0][enumPokemonArray.currentHP],
								obj_playerPokemon.pokemonParty[0][enumPokemonArray.maxHP],
								_xHealthUIPlayer, _yHealthUIPlayer, global.pokemonLevelSet,
								obj_playerPokemon.pokemonParty[0][enumPokemonArray.name]);
						funct_battleHealthUI(spr_healthOpponentUI, obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP],
								obj_opponentPokemon.pokemonParty[0][enumPokemonArray.maxHP],
								_xHealthUIOpponent, _yHealthUIOpponent, global.pokemonLevelSet,
								obj_opponentPokemon.pokemonParty[0][enumPokemonArray.name]);
						#endregion
						break;
					case(enumPlayerTurnState.attackMenu):
						#region Attack Menu
						var _currentPPString = []; // Temp Solution
						_currentPPString[0] = string(obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1PP]);
						_currentPPString[1] = string(obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2PP]);
						_currentPPString[2] = string(obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3PP]);
						_currentPPString[3] = string(obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4PP]);
						var _textPPScale = (global.gameResolutionWidth / 1920) * 1.5;
						var _scaleActionBonus = (global.gameResolutionHeight / 1080) * 1.5;
						var _textStringAttack = [];
						var _textMoveType = [];
						var _textMoveTime = [];
						var _maxPP = [];
						var _pokemonMoves = obj_playerPokemon.pokemonPartyMoves;
						var _pokeMovesLength = array_length(global.pokeMoves) - 1;
						for (var f = enumPokemonPartyMoves.move1ID; f <= enumPokemonPartyMoves.move4ID; f += 2;) // Potentally scrap this and use a move loader to remove the need for this.
						{
							for (var i = 0; i <= _pokeMovesLength; i++;)
							{
								if (global.pokeMoves[i][$ "Move ID"] == _pokemonMoves[0][f]) // REMOVE MAGIC NUMBER "0" TO HAVE SYSTEM THAT CHECKS WHICH POKEMON IT IS
								{
									_textStringAttack[i] = global.pokeMoves[i][$ "Move Name"];
									_textMoveType[i] = global.pokeMoves[i][$ "Type"];
									_textMoveTime[i] = global.pokeMoves[i][$ "Time"];
									_maxPP[i] = global.pokeMoves[i][$ "PP"];
									i = _pokeMovesLength + 1;
								}
							}
						}
						for (var i = 0; i < array_length(_maxPP); i++;) // Fixed zero number appearing by deleting it within the array with this check.
						{ // This is a temp solution, when implementing move attacks, consider replacing all of this with functions.
							if (_maxPP[i] == 0)
							{
								array_delete(_textStringAttack, i, 1);
								array_delete(_textMoveType, i, 1);
								array_delete(_textMoveTime, i, 1);
								array_delete(_maxPP, i, 1);
							}
						}
						for (var i = 0; i <= 3; i++;)
						{
							var _moveColour = funct_colourTypeUI(_textMoveType[i], typeColoursArray);
							if (global.playerChoiceAttack == i)
							{
								draw_sprite_ext(spr_battleUISelection, 0,
									_xPosition[i], _yPosition[i],
									_xScale, _yScale,
									0, _moveColour,
									1);
							}
							else
							{
								draw_sprite_ext(spr_battleUI, 0,
									_xPosition[i], _yPosition[i],
									_xScale, _yScale,
									0, _moveColour,
									1);
							}
							draw_sprite_ext(spr_battleUIPP, 0, // PP Code (Temp)
								_xPositionPP[i], _yPosition[i],
								_xScale, _yScale,
								0, c_white,
								1);
						}
						for (var i = 0; i <= 3; i++;) // CHANGE ALL FOR MAGIC NUMBERS (3's) TO A VARIABLE INCASE MOVES GET INCREASED
						{
							funct_textUI(_xPosition[i], _yPosition[i], // Move UI Text
								_textStringAttack[i], _textScale,
								_textColour, 1,
								fa_middle);
							funct_textUI(_xPositionPP[i], _yPosition[i], // Temp PP Code
								_currentPPString[i] + "/" + _maxPP[i],
								_textPPScale, _textColour, 
								1, fa_middle);
						}
						for (var i = 0; i <= 3; i++;)
						{
							if (_textMoveTime[i] == "Action")
							{
								draw_sprite_ext(spr_actionSymbol, 0, // Action/Bonus UI Code (Temp)
								_xPositionAction[i], _yPosition[i],
								_scaleActionBonus, _scaleActionBonus,
								0, c_white,
								1);
							}
							else if (_textMoveTime[i] == "Bonus")
							{
								draw_sprite_ext(spr_bonusSymbol, 0, // Action/Bonus UI Code (Temp)
								_xPositionAction[i], _yPosition[i],
								_scaleActionBonus, _scaleActionBonus,
								0, c_white,
								1);
							}
						}
						
						funct_battleHealthUI(spr_healthPlayerUI, obj_playerPokemon.pokemonParty[0][enumPokemonArray.currentHP],
								obj_playerPokemon.pokemonParty[0][enumPokemonArray.maxHP],
								_xHealthUIPlayer, _yHealthUIPlayer, global.pokemonLevelSet,
								obj_playerPokemon.pokemonParty[0][enumPokemonArray.name]);
						funct_battleHealthUI(spr_healthOpponentUI, obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP],
								obj_opponentPokemon.pokemonParty[0][enumPokemonArray.maxHP],
								_xHealthUIOpponent, _yHealthUIOpponent, global.pokemonLevelSet,
								obj_opponentPokemon.pokemonParty[0][enumPokemonArray.name]);
						#endregion
						break;
					case(enumPlayerTurnState.bagMenu):
						// put bag code here
						break;
					case(enumPlayerTurnState.pokemonMenu):
						// Not available in the Prototype (Or if time permits, have a basic one just showing Pikachu/Riolu/Lucario)
						break;
				}
				break;
			case(enumBattleState.intermission):
				//type here
				break;
			case(enumBattleState.opponent):
				draw_text(room_width / 2, room_height / 2, "OPPONENT");
				break;
		}
		break;
}


