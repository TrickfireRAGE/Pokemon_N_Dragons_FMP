/// @description Runs the core states

#region Controller Variables

global.gamePadConfirm = gamepad_button_check_pressed(global.controllerNumber, gp_face1); // A
global.gamePadBack = gamepad_button_check_pressed(global.controllerNumber, gp_face2); // B

global.gamePadStart = gamepad_button_check_pressed(global.controllerNumber, gp_start); // Start
global.gamePadUp = gamepad_button_check_pressed(global.controllerNumber, gp_padu); // Up
global.gamePadDown = gamepad_button_check_pressed(global.controllerNumber, gp_padd); // Down
global.gamePadLeft = gamepad_button_check_pressed(global.controllerNumber, gp_padl); // Left
global.gamePadRight = gamepad_button_check_pressed(global.controllerNumber, gp_padr); // Right

#endregion

switch (room)
{
	case(rm_introVideo):
		if (video_get_status() == video_status_closed)
		{
			room_goto(rm_titleMenu);
			global.menuState = enumTitleScreenState.pressStart;
		}
		break;
	case(rm_titleMenu):	
		switch (global.menuState)
		{
			case(enumTitleScreenState.pressStart):
				var _titleScreen = (speed * 2); // 2 Second Timer
				if (timerTitleScreenCheck != _titleScreen)
				{
					timerTitleScreenCheck++;
				}
				else
				{
					if (global.gamePadStart)
					{
						alarm_set(0, 1); // Uses Alarm to delay the code by 1 frame to allow sound effect to work.
					}	
				}
				break;
			case(enumTitleScreenState.mainMenu):
				#region Main Menu Logic
				var _choiceChange = 1;
				if (global.gamePadDown)
				{
					global.titleScreenOptions += _choiceChange;
					if (global.titleScreenOptions > enumMainMenuChoice.exitSave)
					{
						global.titleScreenOptions = enumMainMenuChoice.newGame;
					}
				}
				else if (global.gamePadUp)
				{
					global.titleScreenOptions -= _choiceChange;
					if (global.titleScreenOptions < enumMainMenuChoice.newGame)
					{
						global.titleScreenOptions = enumMainMenuChoice.exitSave;
					}
				}
				if (global.gamePadConfirm)
				{
					switch (global.titleScreenOptions)
					{
						case(enumMainMenuChoice.newGame):
							global.titleScreenOptions = enumMainMenuChoice.newGame;
							alarm_set(enumCoreGameAlarms.stateSwitch, 1);
							break;
						case(enumMainMenuChoice.continueSave):
							global.titleScreenOptions = enumMainMenuChoice.newGame;
							// Put Alarm here after save system is implemented
							break;
						case(enumMainMenuChoice.settings):
							global.titleScreenOptions = enumMainMenuChoice.newGame;
							global.settingsMenuState = enumSettingsScreenState.settingsBase;
							global.menuState = enumTitleScreenState.settingsMenu;
							break;
						case(enumMainMenuChoice.exitSave):
							game_end();
							break;
					}
				}
				if (global.gamePadBack)
				{
					global.titleScreenOptions = enumMainMenuChoice.newGame;
					global.menuState = enumTitleScreenState.pressStart;
				}
				#endregion
				break;
			case(enumTitleScreenState.newGame):
				#region New Game Logic
				var _choiceChange = 1;
				if (global.gamePadDown)
				{
					global.newGameOptions += _choiceChange;
					if (global.newGameOptions > enumNewGameChoice.returnToMainMenu)
					{
						global.newGameOptions = enumNewGameChoice.story;
					}
				}
				else if (global.gamePadUp)
				{
					global.newGameOptions -= _choiceChange;
					if (global.newGameOptions < enumNewGameChoice.story)
					{
						global.newGameOptions = enumNewGameChoice.returnToMainMenu;
					}
				}
				if (global.gamePadConfirm)
				{
					switch (global.newGameOptions)
					{
						case(enumNewGameChoice.story):
							// Nothing due to Prototype
							break;
						case(enumNewGameChoice.level1):
							global.menuState = enumTitleScreenState.outOfMenu;
							global.gameState = enumGameState.level1Battle;
							room = rm_battleRoom;
							break;
						case(enumNewGameChoice.endGame):
							global.menuState = enumTitleScreenState.outOfMenu;
							global.gameState = enumGameState.endGameBattle;
							room = rm_battleRoom;
							break;
						case(enumNewGameChoice.returnToMainMenu):
							global.menuState = enumTitleScreenState.mainMenu;
							break;
					}
				}
				if (global.gamePadBack)
				{
					global.titleScreenOptions = enumMainMenuChoice.newGame;
					global.menuState = enumTitleScreenState.mainMenu;
				}
				#endregion
				break;
			case(enumTitleScreenState.settingsMenu):
				#region Settings Logic
				var _choiceChange = 1;
				if (global.gamePadDown)
				{
					switch(global.settingsMenuState)
					{
						case(enumSettingsScreenState.settingsBase):
							global.settingsScreenOptions += _choiceChange;
							if (global.settingsScreenOptions > enumSettingsChoice.returnMainMenu)
							{
								global.settingsScreenOptions = enumSettingsChoice.resolution;
							}
							break;
						case(enumSettingsScreenState.resolution):
							global.settingsScreenOptions += _choiceChange;
							if (global.settingsScreenOptions > enumResolutionChoice.returnSettings)
							{
								global.settingsScreenOptions = enumResolutionChoice.resolution480P;
							}
							break;
						case(enumSettingsScreenState.fullScreen):
							global.settingsScreenOptions += _choiceChange;
							if (global.settingsScreenOptions > enumFullScreenChoice.returnSettings)
							{
								global.settingsScreenOptions = enumFullScreenChoice.windowed;
							}
							break;
						case(enumSettingsScreenState.sound):
							// Nothing Needed at the Moment
							break;
						case(enumSettingsScreenState.controls):
							// Nothing Needed at the Moment
							break;
					}
				}
				else if (global.gamePadUp)
				{
					switch(global.settingsMenuState)
					{
						case(enumSettingsScreenState.settingsBase):
							global.settingsScreenOptions -= _choiceChange;
							if (global.settingsScreenOptions < enumSettingsChoice.resolution)
							{
								global.settingsScreenOptions = enumSettingsChoice.returnMainMenu;
							}
							break;
						case(enumSettingsScreenState.resolution):
							global.settingsScreenOptions -= _choiceChange;
							if (global.settingsScreenOptions < enumResolutionChoice.resolution480P)
							{
								global.settingsScreenOptions = enumResolutionChoice.returnSettings;
							}
							break;
						case(enumSettingsScreenState.fullScreen):
							global.settingsScreenOptions -= _choiceChange;
							if (global.settingsScreenOptions < enumFullScreenChoice.windowed)
							{
								global.settingsScreenOptions = enumFullScreenChoice.returnSettings;
							}
							break;
						case(enumSettingsScreenState.sound):
							// Nothing Needed here at the moment
							break;
						case(enumSettingsScreenState.controls):
							// Nothing needed here at the moment
							break;
					}
				}
				if (global.gamePadConfirm)
				{
					switch (global.settingsMenuState)
					{
						case(enumSettingsScreenState.settingsBase):
							switch (global.settingsScreenOptions)
							{
								case(enumSettingsChoice.resolution):
									global.settingsMenuState = enumSettingsScreenState.resolution;
									break;
								case(enumSettingsChoice.fullScreen):
									global.settingsMenuState = enumSettingsScreenState.fullScreen;
									break;
								case(enumSettingsChoice.sound):
									global.settingsMenuState = enumSettingsScreenState.sound;
									break;
								case(enumSettingsChoice.controls):
									global.settingsMenuState = enumSettingsScreenState.controls;
									break;
								case(enumSettingsChoice.credits):
									global.settingsMenuState = enumSettingsScreenState.credits;
									break;
								case(enumSettingsChoice.returnMainMenu):
									global.settingsScreenOptions = enumSettingsChoice.resolution;
									global.menuState = enumTitleScreenState.mainMenu;
									break;
							}
							break;
						case(enumSettingsScreenState.resolution):
							var _displayHeight = display_get_height();
							switch (global.settingsScreenOptions)
							{
								case(enumResolutionChoice.resolution480P):
									if (_displayHeight >= 480)
									{
										funct_resolutionChanges(480);
									}
									break;
								case(enumResolutionChoice.resolution540P):
									if (_displayHeight >= 540)
									{
										funct_resolutionChanges(540);
									}
									break;
								case(enumResolutionChoice.resolution720P):
									if (_displayHeight >= 720)
									{
										funct_resolutionChanges(720);
									}
									break;
								case(enumResolutionChoice.resolution1080P):
									if (_displayHeight >= 1080)
									{
										funct_resolutionChanges(1080);
									}
									break;
								case(enumResolutionChoice.resolution1440P):
									if (_displayHeight >= 1440)
									{
										funct_resolutionChanges(1440);
									}
									break;
								case(enumResolutionChoice.resolution2160P):
									if (_displayHeight >= 2160)
									{
										funct_resolutionChanges(2160);
									}
									break;
								case(enumResolutionChoice.returnSettings):
									global.settingsScreenOptions = enumSettingsChoice.resolution;
									global.settingsMenuState = enumSettingsScreenState.settingsBase;
									break;
							}
							break;
						case(enumSettingsScreenState.fullScreen):
							switch (global.settingsScreenOptions)
							{
								case(enumFullScreenChoice.windowed):
									funct_fullScreenChanges(false);
									break;
								case(enumFullScreenChoice.fullScreen):
									funct_fullScreenChanges(true);
									break;
								case(enumFullScreenChoice.returnSettings):
									global.settingsScreenOptions = enumSettingsChoice.fullScreen;
									global.settingsMenuState = enumSettingsScreenState.settingsBase;
									break;
							}
							break;
						case(enumSettingsScreenState.sound):
							global.settingsScreenOptions = enumSettingsChoice.sound;
							global.settingsMenuState = enumSettingsScreenState.settingsBase;
							break;
						case(enumSettingsScreenState.controls):
							global.settingsScreenOptions = enumSettingsChoice.controls;
							global.settingsMenuState = enumSettingsScreenState.settingsBase;
							break;
					}
				}
				if (global.gamePadBack)
				{
					if (global.settingsMenuState == enumSettingsScreenState.settingsBase)
					{
						global.menuState = enumTitleScreenState.mainMenu;
					}
					else if (global.settingsMenuState == enumSettingsScreenState.credits)
					{
						global.creditsCheck = false;
						global.settingsMenuState = enumSettingsScreenState.settingsBase;
					}
					else if (global.settingsMenuState != enumSettingsScreenState.settingsBase)
					{
						global.settingsMenuState = enumSettingsScreenState.settingsBase;
					}
				}
				if (global.gamePadLeft)
				{
					if (global.settingsMenuState == enumSettingsScreenState.sound) // Consider moving this to Sound System next Version
					{
						global.soundVolume -= 0.10;
						if (global.soundVolume < -0.01)
						{
							global.soundVolume = 0;
						}
						audio_master_gain(global.soundVolume);
						ini_open("coreSaveFile.ini");
						ini_write_real("settings", "sound", global.soundVolume);
						ini_close();
					}
				}
				if (global.gamePadRight)
				{
					if (global.settingsMenuState == enumSettingsScreenState.sound)
					{
						global.soundVolume += 0.10;
						if (global.soundVolume > 1)
						{
							global.soundVolume = 1;
						}
						audio_master_gain(global.soundVolume);
						ini_open("coreSaveFile.ini");
						ini_write_real("settings", "sound", global.soundVolume);
						ini_close();
					}
				}
				#endregion
				break;
		}
		break;
}

