/// @description 

switch (room)
{
	case(rm_titleMenu):
		var _gameLogoX = global.gameResolutionWidth / 1.3; // Local Variable for Game Logo X
		var _gameLogoY = global.gameResolutionHeight / 2.5; // Local Variable for Game Logo Y
		var _gameLogoScale = global.gameResolutionWidth / 1920; // Scales the image depending on what resolution the game is running at.
		var _gameTextX = global.gameResolutionWidth / 1.6;
		var _gameTextY = global.gameResolutionHeight / 1.5;
		var _menuTextScale = (global.gameResolutionWidth / 1920) * 3;
		
		draw_set_font(fnt_kyoMadoka); // Sets the Font for the Game
		
		switch(global.menuState)
		{
			case(enumTitleScreenState.pressStart):
				if (titleScreenAlphaLogo <= 1)
				{
					draw_sprite_ext(spr_gameLogo, 0, _gameLogoX, _gameLogoY, _gameLogoScale, _gameLogoScale, 0, c_white, titleScreenAlphaLogo);
					titleScreenAlphaLogo += 0.01;
				}
				else
				{
			
					draw_sprite_ext(spr_gameLogo, 0, _gameLogoX, _gameLogoY, _gameLogoScale, _gameLogoScale, 0, c_white, titleScreenAlphaLogo);
					if (titleScreenAlphaText <= 1)
					{
						draw_text_transformed_colour(_gameTextX, _gameTextY, "Press Start", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, titleScreenAlphaText);
						titleScreenAlphaText += 0.01;
					}
					else
					{
						draw_text_transformed_colour(_gameTextX, _gameTextY, "Press Start", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, titleScreenAlphaText);
					}
				}
				break;
			case(enumTitleScreenState.mainMenu):
				var _mainMenuX = global.gameResolutionWidth / 20;
				var _mainMenuNewGameY = global.gameResolutionHeight / 5;
				var _mainMenuContinueY = global.gameResolutionHeight / 3.3;
				var _mainMenuSettingsY = global.gameResolutionHeight / 2.4;
				var _mainMenuExitY = global.gameResolutionHeight / 1.9;
				var _choiceMainMenuX = global.gameResolutionWidth / 30;
				
				draw_sprite_ext(spr_gameLogo, 0, _gameLogoX, _gameLogoY, _gameLogoScale, _gameLogoScale, 0, c_white, titleScreenAlphaLogo);
				if (titleScreenAlphaText > 0)
				{
					draw_text_transformed_colour(_gameTextX, _gameTextY, "Press Start", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, titleScreenAlphaText);
					titleScreenAlphaText -= 0.01;
				}
				else
				{
					draw_text_transformed_colour(_mainMenuX, _mainMenuNewGameY, "New Game", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
					draw_text_transformed_colour(_mainMenuX, _mainMenuContinueY, "Continue", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
					draw_text_transformed_colour(_mainMenuX, _mainMenuSettingsY, "Settings", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
					draw_text_transformed_colour(_mainMenuX, _mainMenuExitY, "Exit", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
					
					switch (global.titleScreenOptions)
					{
						case(enumMainMenuChoice.newGame):
							draw_sprite_ext(spr_choiceArrow, 0, _choiceMainMenuX, _mainMenuNewGameY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
							break;
						case(enumMainMenuChoice.continueSave):
							draw_sprite_ext(spr_choiceArrow, 0, _choiceMainMenuX, _mainMenuContinueY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
							break;
						case(enumMainMenuChoice.settings):
							draw_sprite_ext(spr_choiceArrow, 0, _choiceMainMenuX, _mainMenuSettingsY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
							break;
						case(enumMainMenuChoice.exitSave):
							draw_sprite_ext(spr_choiceArrow, 0, _choiceMainMenuX, _mainMenuExitY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
							break;
					}
				}
				break;
			case(enumTitleScreenState.settingsMenu):
				var _settingsMenuX = global.gameResolutionWidth / 20;
				var _settingsOneY = global.gameResolutionHeight / 5;
				var _settingsTwoY = global.gameResolutionHeight / 3.3;
				var _settingsThreeY = global.gameResolutionHeight / 2.5;
				var _settingsFourY = global.gameResolutionHeight / 2;
				var _settingsFiveY = global.gameResolutionHeight / 1.65;
				var _settingsSixY = global.gameResolutionHeight / 1.4;
				var _settingsSevenY = global.gameResolutionHeight / 1.2;
				var _choiceSettingsX = global.gameResolutionWidth / 30;
				switch (global.settingsMenuState)
				{
					case(enumSettingsScreenState.settingsBase):
						draw_text_transformed_colour(_settingsMenuX, _settingsOneY, "Resolution", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(_settingsMenuX, _settingsTwoY, "FullScreen", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(_settingsMenuX, _settingsThreeY, "Sound", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(_settingsMenuX, _settingsFourY, "Controls", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
						draw_text_transformed_colour(_settingsMenuX, _settingsFiveY, "Return To Main Menu", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
						switch (global.settingsScreenOptions)
						{
							case(enumSettingsChoice.resolution):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsOneY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumSettingsChoice.fullScreen):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsTwoY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumSettingsChoice.sound):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsThreeY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumSettingsChoice.controls):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsFourY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumSettingsChoice.returnMainMenu):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsFiveY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
						}
						break;
					case(enumSettingsScreenState.resolution):
						var _displayResolution = display_get_height();
						// Resolution Check
						// 480P
						if (_displayResolution >= 480)
						{
							switch (global.gameResolutionHeight)
								{
									case(480):
										draw_text_transformed_colour(_settingsMenuX, _settingsOneY, "640 X 480P", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
										break;
									default:
										draw_text_transformed_colour(_settingsMenuX, _settingsOneY, "640 X 480P", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
										break;
								}
						}
						else if (_displayResolution < 480)
						{
							draw_text_transformed_colour(_settingsMenuX, _settingsOneY, "640 X 480P", _menuTextScale, _menuTextScale, 0, c_grey, c_grey, c_grey, c_grey, 0.8);
						}
						// 540P
						if (_displayResolution >= 540)
						{
							switch (global.gameResolutionHeight)
								{
									case(540):
										draw_text_transformed_colour(_settingsMenuX, _settingsTwoY, "960 X 540P", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
										break;
									default:
										draw_text_transformed_colour(_settingsMenuX, _settingsTwoY, "960 X 540P", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
										break;
								}
						}
						else if (_displayResolution < 540)
						{
							draw_text_transformed_colour(_settingsMenuX, _settingsTwoY, "960 X 540P", _menuTextScale, _menuTextScale, 0, c_grey, c_grey, c_grey, c_grey, 0.8);
						}
						// 720P
						if (_displayResolution >= 720)
						{
							switch (global.gameResolutionHeight)
								{
									case(720):
										draw_text_transformed_colour(_settingsMenuX, _settingsThreeY, "1280 X 720P", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
										break;
									default:
										draw_text_transformed_colour(_settingsMenuX, _settingsThreeY, "1280 X 720P", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
										break;
								}
						}
						else if (_displayResolution < 720)
						{
							draw_text_transformed_colour(_settingsMenuX, _settingsThreeY, "1280 X 720P", _menuTextScale, _menuTextScale, 0, c_grey, c_grey, c_grey, c_grey, 0.8);
						}
						// 1080P
						if (_displayResolution >= 1080)
						{
							switch (global.gameResolutionHeight)
								{
									case(1080):
										draw_text_transformed_colour(_settingsMenuX, _settingsFourY, "1920 X 1080P", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
										break;
									default:
										draw_text_transformed_colour(_settingsMenuX, _settingsFourY, "1920 X 1080P", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
										break;
								}
						}
						else if (_displayResolution < 1080)
						{
							draw_text_transformed_colour(_settingsMenuX, _settingsFourY, "1920 X 1080P", _menuTextScale, _menuTextScale, 0, c_grey, c_grey, c_grey, c_grey, 0.8);
						}
						// 1440P
						if (_displayResolution >= 1440)
						{
							switch (global.gameResolutionHeight)
								{
									case(1440):
										draw_text_transformed_colour(_settingsMenuX, _settingsFiveY, "2560 X 1440P", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
										break;
									default:
										draw_text_transformed_colour(_settingsMenuX, _settingsFiveY, "2560 X 1440P", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
										break;
								}
						}
						else if (_displayResolution < 1440)
						{
							draw_text_transformed_colour(_settingsMenuX, _settingsFiveY, "2560 X 1440P", _menuTextScale, _menuTextScale, 0, c_grey, c_grey, c_grey, c_grey, 0.8);
						}
						// 2160P
						if (_displayResolution >= 2160)
						{
							switch (global.gameResolutionHeight)
								{
									case(2160):
										draw_text_transformed_colour(_settingsMenuX, _settingsSixY, "3840 X 2160P", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
										break;
									default:
										draw_text_transformed_colour(_settingsMenuX, _settingsSixY, "3840 X 2160P", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
										break;
								}
						}
						else if (_displayResolution < 2160)
						{
							draw_text_transformed_colour(_settingsMenuX, _settingsSixY, "3840 X 2160P", _menuTextScale, _menuTextScale, 0, c_grey, c_grey, c_grey, c_grey, 0.8);
						}
						draw_text_transformed_colour(_settingsMenuX, _settingsSevenY, "Return", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
						switch (global.settingsScreenOptions)
						{
							case(enumResolutionChoice.resolution480P):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsOneY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumResolutionChoice.resolution540P):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsTwoY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumResolutionChoice.resolution720P):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsThreeY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumResolutionChoice.resolution1080P):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsFourY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumResolutionChoice.resolution1440P):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsFiveY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumResolutionChoice.resolution2160P):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsSixY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumResolutionChoice.returnSettings):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsSevenY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
						}
						break;
					case(enumSettingsScreenState.fullScreen):
						switch (window_get_fullscreen())
						{
							case(false):
								draw_text_transformed_colour(_settingsMenuX, _settingsOneY, "Windowed", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
								draw_text_transformed_colour(_settingsMenuX, _settingsTwoY, "Fullscreen", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
								break;
							case(true):
								draw_text_transformed_colour(_settingsMenuX, _settingsOneY, "Windowed", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
								draw_text_transformed_colour(_settingsMenuX, _settingsTwoY, "Fullscreen", _menuTextScale, _menuTextScale, 0, c_green, c_green, c_green, c_green, 1);
								break;
						}
						draw_text_transformed_colour(_settingsMenuX, _settingsSevenY, "Return", _menuTextScale, _menuTextScale, 0, c_white, c_white, c_white, c_white, 1);
						switch (global.settingsScreenOptions)
						{
							case(enumFullScreenChoice.windowed):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsOneY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumFullScreenChoice.fullScreen):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsTwoY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
							case(enumFullScreenChoice.returnSettings):
								draw_sprite_ext(spr_choiceArrow, 0, _choiceSettingsX, _settingsSevenY, _gameLogoScale, _gameLogoScale, 0, c_white, 1);
								break;
						}
						break;
					case(enumSettingsScreenState.sound):
						// Type Sound Options here
						break;
					case(enumSettingsScreenState.controls):
						// Type Controls here
						break;
				}
		}
		// put other stuff here
		break;
}


