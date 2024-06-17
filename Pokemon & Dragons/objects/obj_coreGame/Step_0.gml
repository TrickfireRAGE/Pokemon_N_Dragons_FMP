/// @description Runs the core states

#region Control Variables

// Keyboard Variables

global.gamePadConfirm = keyboard_check_pressed(ord("Z")); // A / Cross
global.gamePadBack = keyboard_check_pressed(ord("X")); // B / Circle
global.gamePadX = keyboard_check_pressed(ord("A")); // X / Square
global.gamePadY = keyboard_check_pressed(ord("S")); // Y / Triangle

global.gamePadSelect = keyboard_check_pressed(vk_space); // Select / TouchPad (PS4/5)
global.gamePadStart = keyboard_check_pressed(vk_enter); // Start / Options
global.gamePadUp = keyboard_check_pressed(vk_up); // Up
global.gamePadDown = keyboard_check_pressed(vk_down); // Down
global.gamePadLeft = keyboard_check_pressed(vk_left); // Left
global.gamePadRight = keyboard_check_pressed(vk_right); // Right

// Controller Variables

if (global.controllerNumber != "NOT_SET")
{
	global.gamePadConfirm += gamepad_button_check_pressed(global.controllerNumber, gp_face1); // A / Cross
	global.gamePadBack += gamepad_button_check_pressed(global.controllerNumber, gp_face2); // B / Circle
	global.gamePadX += gamepad_button_check_pressed(global.controllerNumber, gp_face3); // X / Square
	global.gamePadY += gamepad_button_check_pressed(global.controllerNumber, gp_face4); // Y / Triangle

	global.gamePadSelect += gamepad_button_check_pressed(global.controllerNumber, gp_select); // Select / TouchPad (PS4/5)
	global.gamePadStart += gamepad_button_check_pressed(global.controllerNumber, gp_start); // Start / Options
	global.gamePadUp += gamepad_button_check_pressed(global.controllerNumber, gp_padu); // Up
	global.gamePadDown += gamepad_button_check_pressed(global.controllerNumber, gp_padd); // Down
	global.gamePadLeft += gamepad_button_check_pressed(global.controllerNumber, gp_padl); // Left
	global.gamePadRight += gamepad_button_check_pressed(global.controllerNumber, gp_padr); // Right
}

#endregion

switch (room)
{
	case(rm_introVideo):
		#region Studio Intro Transfer
		if (video_get_status() == video_status_closed)
		{
			room_goto(rm_titleMenu);
			global.menuState = enumTitleScreenState.pressStart;
		}
		#endregion
		break;
	case(rm_titleMenu):	
		#region Title Screen
		switch (global.menuState)
		{
			case(enumTitleScreenState.pressStart):
				#region Start Menu
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
				#endregion
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
							// global.titleScreenOptions = enumMainMenuChoice.continueGame;
							// Put Alarm here after save system is implemented
							break;
						case(enumMainMenuChoice.settings):
							global.settingsMenuState = enumSettingsScreenState.settingsBase;
							global.menuState = enumTitleScreenState.settingsMenu;
							break;
						case(enumMainMenuChoice.tutorial):
							global.tutorialDialogue = 0;
							global.menuState = enumTitleScreenState.tutorial;
							// type here if other code is needed
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
				switch (global.newGameMenuState)
				{
					case(enumNewGameState.newGame):
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
									global.newGameMenuState = enumNewGameState.level1Choice;
									break;
								case(enumNewGameChoice.endGame):
									global.newGameMenuState = enumNewGameState.endGameChoice;
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
						break;
						case(enumNewGameState.level1Choice):
							if (global.gamePadConfirm)
							{
								switch (global.newGamePokemonChoice)
								{
									case(enumPokemonChoiceLevel1.pikachu):
										global.playerPokemonID[0] = 25; // Update both to be arrays in future versions
										global.opponentPokemonID[0] = 447;
										global.menuState = enumTitleScreenState.outOfMenu;
										global.gameState = enumGameState.level1Battle;
										room = rm_battleRoom;
										break;
									case(enumPokemonChoiceLevel1.riolu):
										global.playerPokemonID[0] = 447; // Update both to be arrays in future versions
										global.opponentPokemonID[0] = 25;
										global.menuState = enumTitleScreenState.outOfMenu;
										global.gameState = enumGameState.level1Battle;
										room = rm_battleRoom;
										break;
								}
							}
							if (global.gamePadBack)
							{
								global.newGameMenuState = enumNewGameState.newGame;
							}
							if (global.gamePadLeft)
							{
								global.newGamePokemonChoice -= 1;
								if (global.newGamePokemonChoice < enumPokemonChoiceLevel1.pikachu)
								{
									global.newGamePokemonChoice = enumPokemonChoiceLevel1.pikachu;
								}
							}
							if (global.gamePadRight)
							{
								global.newGamePokemonChoice += 1;
								if (global.newGamePokemonChoice > enumPokemonChoiceLevel1.riolu)
								{
									global.newGamePokemonChoice = enumPokemonChoiceLevel1.riolu;
								}
							}
							break;
						case(enumNewGameState.endGameChoice):
							if (global.gamePadConfirm)
							{
								switch (global.newGamePokemonChoice)
								{
									case(enumPokemonChoiceEndGame.pikachu):
										global.playerPokemonID[0] = 25; // Update both to be arrays in future versions
										global.opponentPokemonID[0] = 491;
										global.menuState = enumTitleScreenState.outOfMenu;
										global.gameState = enumGameState.endGameBattle;
										room = rm_battleRoom;
										break;
									case(enumPokemonChoiceEndGame.lucario):
										global.playerPokemonID[0] = 448; // Update both to be arrays in future versions
										global.opponentPokemonID[0] = 491;
										global.menuState = enumTitleScreenState.outOfMenu;
										global.gameState = enumGameState.endGameBattle;
										room = rm_battleRoom;
										break;
								}
							}
							if (global.gamePadBack)
							{
								global.newGameMenuState = enumNewGameState.newGame;
							}
							if (global.gamePadLeft)
							{
								global.newGamePokemonChoice -= 1;
								if (global.newGamePokemonChoice < enumPokemonChoiceEndGame.pikachu)
								{
									global.newGamePokemonChoice = enumPokemonChoiceEndGame.pikachu;
								}
							}
							if (global.gamePadRight)
							{
								global.newGamePokemonChoice += 1;
								if (global.newGamePokemonChoice > enumPokemonChoiceEndGame.lucario)
								{
									global.newGamePokemonChoice = enumPokemonChoiceEndGame.lucario;
								}
							}
							break;
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
					else if (global.settingsMenuState == enumSettingsScreenState.resolution)
					{
						global.settingsScreenOptions = enumSettingsChoice.resolution;
						global.settingsMenuState = enumSettingsScreenState.settingsBase;
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
						funct_soundChanges(global.soundVolume);
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
						funct_soundChanges(global.soundVolume);
						ini_open("coreSaveFile.ini");
						ini_write_real("settings", "sound", global.soundVolume);
						ini_close();
					}
				}
				#endregion
				break;
			case(enumTitleScreenState.tutorial):
				#region Tutorial Logic
				// type here logic
				if (global.gamePadConfirm)
				{
					// Put adding code here
				}
				else if (global.gamePadBack)
				{
					global.titleScreenOptions = enumMainMenuChoice.newGame;
					global.menuState = enumTitleScreenState.mainMenu;
				}
				else if (global.gamePadDown)
				{
					global.tutorialDialogue += _choiceChange;
					if (global.tutorialDialogue > enumTutorialChoice.dnd)
					{
						global.tutorialDialogue = enumTutorialChoice.battleGameplay;
					}
				}
				else if (global.gamePadUp)
				{
					global.tutorialDialogue -= _choiceChange;
					if (global.tutorialDialogue > enumTutorialChoice.battleGameplay)
					{
						global.tutorialDialogue = enumTutorialChoice.dnd;
					}
				}
				
				#endregion
				break;
		}
		#endregion
		break;
	case(rm_battleRoom):
		#region Battle Section
		var _choiceChange = 1;
		// Temp Solution for End of Battle (Prototype Only)
		if (obj_playerPokemon.pokemonParty[0][enumPokemonArray.currentHP] <= 0)
		{
			room = rm_loss;
			// Change room to an loss room
		}
		else if (obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP] <= 0)
		{
			room = rm_victory;
			// Change room to Victory Room
		}
		
		switch (global.battleState) // Consider putting this into a basic battle system where it doesn't need to be typed out multiple times.
		{
			case(enumBattleState.introSequence):
				#region Intro Sequence
				if (alarm_get(enumCoreGameAlarms.stateSwitch) > 0)
				{
					//Code here
				}
				else
				{
					alarm_set(enumCoreGameAlarms.stateSwitch, 1);
				}
				#endregion
				break;
			case(enumBattleState.initiative):
				#region Initiative
				if (!instance_exists(global.initiativeID))
				{
					var _xPositionSequence = 128; // For Sequence
					var _yPositionSequence = 72; // For Seqeunce
		
					global.sequenceID = layer_sequence_create("sequenceLayer", _xPositionSequence, _yPositionSequence, seq_startBattleSequence);
					global.battleState = enumBattleState.introSequence;
				}
				#endregion
				break;
			case(enumBattleState.playerAttack):
				if (attackNonCheck == "Attack")
				{
					#region Player Attack Code
					if (global.moveReturnArray[enumAttackFunction.baseDice] == "ALWAYS_HITS")
					{
						var _arrayLengthCheck = array_length(global.moveReturnArray);
						var _amountOfRolls = _arrayLengthCheck - enumAttackFunction.attackDiceRollFirst;
						var _emptyModifier = 0;
						
						var _xDicePosition = room_width / 4.6;
						
						var _xDiceDistance = 48;
						
						var _yDicePosition = room_height / 3;
						var _yDicePositionAlt = _yDicePosition * 2;
						
						if (global.attackIDDamage == "NOT_SET")
						{
							switch (_amountOfRolls)
							{
								case(8):
									funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 7], // Sort this out soon.
										_xDicePosition, _yDicePosition, _emptyModifier,
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
								case(7):
									funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 6],
										_xDicePosition + _xDiceDistance, _yDicePosition, _emptyModifier,
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
								case(6):
									funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 5],
										_xDicePosition + (_xDiceDistance * 2), _yDicePosition, _emptyModifier,
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
								case(5):
									funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 4],
										_xDicePosition + (_xDiceDistance * 3), _yDicePosition, _emptyModifier,
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
								case(4):
									funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 3],
										_xDicePosition, _yDicePositionAlt, _emptyModifier,
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
								case(3):
									funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 2],
										_xDicePosition + _xDiceDistance, _yDicePositionAlt, _emptyModifier,
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
								case(2):
									funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 1],
										_xDicePosition + (_xDiceDistance * 2), _yDicePositionAlt, _emptyModifier,
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
								case(1):
									global.attackIDDamage = funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst],
										_xDicePosition + (_xDiceDistance * 3), _yDicePositionAlt,
										global.moveReturnArray[enumAttackFunction.diceModifier],
										global.moveReturnArray[enumAttackFunction.attackDiceSize]);
									break;
							}
						}
						else if (!instance_exists(global.attackIDDamage))
						{
							if (global.moveIDSequence == "NOT_SET")
							{
								var _xPositionSequence = 128; // For Sequence
								var _yPositionSequence = 72; // For Seqeunce
								
								global.moveIDSequence = layer_sequence_create("sequenceLayer", _xPositionSequence, _yPositionSequence, seq_playerAttack);
							}
							else if (alarm_get(enumCoreGameAlarms.damageDealt) > 0)
							{
								//Code here
							}
							else
							{
								alarm_set(enumCoreGameAlarms.damageDealt, 1);
							}
						}
					}
					else if (!instance_exists(global.attackIDRoll))
					{
						switch (global.moveReturnArray[enumAttackFunction.result])
						{
							case(global.failureVariable):
								layer_sprite_destroy(obj_coreUI.backTextBoxID); // Pasted here to get it work
								obj_coreUI.backTextBoxID = "NOT_SET";
								global.battleState = enumBattleState.player;
								break;
							case("NO_EFFECT"):
								layer_sprite_destroy(obj_coreUI.backTextBoxID); // Put some code here to show the attack failing
								obj_coreUI.backTextBoxID = "NOT_SET";
								global.battleState = enumBattleState.player;
								break;
							default:
								var _arrayLengthCheck = array_length(global.moveReturnArray);
								var _amountOfRolls = _arrayLengthCheck - enumAttackFunction.attackDiceRollFirst;
								var _emptyModifier = 0;
								
								var _xDicePosition = room_width / 4.6;
								
								var _xDiceDistance = 48;
								
								var _yDicePosition = room_height / 3;
								var _yDicePositionAlt = _yDicePosition * 2;
								
								if (global.attackIDDamage == "NOT_SET")
								{
									switch (_amountOfRolls)
									{
										case(8):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 7], // Sort this out soon.
												_xDicePosition, _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(7):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 6],
												_xDicePosition + _xDiceDistance, _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(6):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 5],
												_xDicePosition + (_xDiceDistance * 2), _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(5):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 4],
												_xDicePosition + (_xDiceDistance * 3), _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(4):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 3],
												_xDicePosition, _yDicePositionAlt, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(3):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 2],
												_xDicePosition + _xDiceDistance, _yDicePositionAlt, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(2):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 1],
												_xDicePosition + (_xDiceDistance * 2), _yDicePositionAlt, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(1):
											global.attackIDDamage = funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst],
												_xDicePosition + (_xDiceDistance * 3), _yDicePositionAlt,
												global.moveReturnArray[enumAttackFunction.diceModifier],
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
											break;
									}
								}
								else if (!instance_exists(global.attackIDDamage))
								{
									if (global.moveIDSequence == "NOT_SET")
									{
										var _xPositionSequence = 128; // For Sequence
										var _yPositionSequence = 72; // For Seqeunce
					
										global.moveIDSequence = layer_sequence_create("sequenceLayer", _xPositionSequence, _yPositionSequence, seq_playerAttack);
									}
									else if (alarm_get(enumCoreGameAlarms.damageDealt) > 0)
									{
										//Code here
									}
									else
									{
										alarm_set(enumCoreGameAlarms.damageDealt, 1);
									}
								}
								break;
						}
					}
					#endregion
				}
				else if (attackNonCheck == "Non-Attack")
				{
					#region Non-Attack Player Code
					if (global.moveIDSequence == "NOT_SET")
					{
						var _xPositionSequence = 128; // For Sequence
						var _yPositionSequence = 72; // For Seqeunce
					
						global.moveIDSequence = layer_sequence_create("sequenceLayer", _xPositionSequence, _yPositionSequence, seq_playerAttack);
					}
					
					if (alarm_get(enumCoreGameAlarms.stateSwitch) > 0)
					{
						//Code here
					}
					else
					{
						alarm_set(enumCoreGameAlarms.stateSwitch, 1);
					}
					#endregion
				}
				break;
			case(enumBattleState.playerDamage):
				#region Player Damaging Opponent Code
				if (global.hpDamageReduction == obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP]) // Get rid of Magic numbers later
				{
					global.moveIDSequence = "NOT_SET"; // Removed Timer due to time
					global.attackIDDamage = "NOT_SET";
					global.attackIDRoll = "NOT_SET";
					global.hpDamageReduction = "NOT_SET";
					attackNonCheck = "NOT_SET"; // Here for Opponent Reasons
					global.battleState = enumBattleState.player;
				}
				#endregion
				break;
			case(enumBattleState.opponent): // Copy and Pasted + Modified (This is unoptimised, clean this up in post playtest build!)	
				// Put the code that handles the dice rolls and the other attack stuff before the damage stage happens
				switch (global.opponentStageBattle)
				{
					case(enumOpponentStages.loading):
						#region Loading Opponent Code
					
						var _actionBonus = "NOT_SET";
						var _whichAttackEnumID = "NOT_SET";
						var _whichAttackEnumPP = "NOT_SET";
						attackNonCheck = "NOT_SET";
						
						global.opponentMoveChoice = irandom_range(0, 999);
						
						while (attackNonCheck == "NOT_SET")
						{
							if (global.opponentMoveChoice <= 249) // Remembered Advice from Finn (Project 1)
							{
								_whichAttackEnumPP = enumPokemonPartyMoves.move1PP;
								if (_whichAttackEnumPP != 0)
								{
									attackNonCheck = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1AoN];
									_whichAttackEnumID = enumPokemonPartyMoves.move1ID;
								}
							}
							else if (global.opponentMoveChoice <= 499)
							{
								_whichAttackEnumPP = enumPokemonPartyMoves.move2PP;
								if (_whichAttackEnumPP != 0)
								{
									attackNonCheck = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2AoN];
									_whichAttackEnumID = enumPokemonPartyMoves.move2ID;
								}
							}
							else if (global.opponentMoveChoice <= 749)
							{
								_whichAttackEnumPP = enumPokemonPartyMoves.move3PP;
								if (_whichAttackEnumPP != 0)
								{
									attackNonCheck = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3AoN];
									_whichAttackEnumID = enumPokemonPartyMoves.move3ID;
								}
							}
							else
							{
								_whichAttackEnumPP = enumPokemonPartyMoves.move4PP;
								if (_whichAttackEnumPP != 0)
								{
									attackNonCheck = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4AoN];
									_whichAttackEnumID = enumPokemonPartyMoves.move4ID;
								}
							}
						}
					
						if (attackNonCheck == "Attack")
						{
							global.moveReturnArray = funct_attack(global.pokeMoves, // Seems to work on a basic level for now. (Does do a basic change of HP, No PP/Bonus/Action removal)
								obj_opponentPokemon.pokemonPartyMoves[0][_whichAttackEnumID], 
								global.pokemonLevelSet, 
								obj_playerPokemon.pokemonParty[0][enumPokemonArray.AC],
								obj_playerPokemon.pokemonParty[0][enumPokemonArray.type],
								obj_opponentPokemon.pokemonParty[0][enumPokemonArray.type],
								obj_opponentPokemon.pokemonParty, // Implement this here once the update to the parent pokemon is done.
								0,
								global.opponentSideEffectArray,
								global.playerSideEffectArray); // Magic number for ease of building
								
							obj_opponentPokemon.pokemonPartyMoves[0][_whichAttackEnumPP] -= 1;
							if (global.moveReturnArray[enumAttackFunction.result] == global.failureVariable)			// Using Magic Number to ensure working due to only one pokemon.
							{
								global.attackIDRoll = funct_diceVisual(global.moveReturnArray[enumAttackFunction.baseDice], 
									room_width / 2, room_height / 2,
									global.moveReturnArray[enumAttackFunction.diceModifier], 
									global.moveReturnArray[enumAttackFunction.diceOrSave]);
									
								global.opponentStageBattle = enumOpponentStages.action;
									// expand the fail code
							}
							else if (global.moveReturnArray[enumAttackFunction.baseDice] == "ALWAYS_HITS")
							{
								// Put the code for the rest without needing to show the D20 dice
								global.opponentStageBattle = enumOpponentStages.action;
							}
							else
							{
								global.attackIDRoll = funct_diceVisual(global.moveReturnArray[enumAttackFunction.baseDice], 
									room_width / 2, room_height / 2,
									global.moveReturnArray[enumAttackFunction.diceModifier], 
									global.moveReturnArray[enumAttackFunction.diceOrSave]);
								global.opponentStageBattle = enumOpponentStages.action;
							}
						}
						else if (attackNonCheck == "Non-Attack") // Copied from Player
						{
							
							global.nonAttackReturnArray = funct_nonAttack(global.pokeMoves, 
								obj_opponentPokemon.pokemonPartyMoves[0][_whichAttackEnumID],
								global.pokemonLevelSet, obj_playerPokemon.pokemonParty, 
								obj_opponentPokemon.pokemonParty, 0, false);
								
							obj_opponentPokemon.pokemonPartyMoves[0][_whichAttackEnumPP] -= 1;
							if (global.nonAttackReturnArray[enumNonAttackFunction.sideAffected] == false) // Changed
							{
								global.opponentStageBattle = enumOpponentStages.endTurn; // To allow the turn to move forward.
							}
							else
							{
								switch (global.nonAttackReturnArray[enumNonAttackFunction.sideWho])
								{
									case ("Self"):
										global.opponentSideEffectArray[enumNonAttackFunction.sideAffected] = global.nonAttackReturnArray[enumNonAttackFunction.sideAffected];
										global.opponentSideEffectArray[enumNonAttackFunction.sideModifier] = global.nonAttackReturnArray[enumNonAttackFunction.sideModifier];
										global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] = global.nonAttackReturnArray[enumNonAttackFunction.sideDuration];
										global.opponentStageBattle = enumOpponentStages.action;
										break;
									case ("Opponent"):
										global.playerSideEffectArray[enumNonAttackFunction.sideAffected] = global.nonAttackReturnArray[enumNonAttackFunction.sideAffected];
										global.playerSideEffectArray[enumNonAttackFunction.sideModifier] = global.nonAttackReturnArray[enumNonAttackFunction.sideModifier];
										global.playerSideEffectArray[enumNonAttackFunction.sideDuration] = global.nonAttackReturnArray[enumNonAttackFunction.sideDuration];
										global.opponentStageBattle = enumOpponentStages.action;
										break;
								}
							}
							
						}
						#endregion
						break;
					case (enumOpponentStages.action):
						#region Opponent Attack
						if (attackNonCheck == "Attack")
						{
							if (global.moveReturnArray[enumAttackFunction.baseDice] == "ALWAYS_HITS")
							{
								var _arrayLengthCheck = array_length(global.moveReturnArray);
								var _amountOfRolls = _arrayLengthCheck - enumAttackFunction.attackDiceRollFirst;
								var _emptyModifier = 0;
								
								var _xDicePosition = room_width / 4.6;
								
								var _xDiceDistance = 48;
								
								var _yDicePosition = room_height / 3;
								var _yDicePositionAlt = _yDicePosition * 2;
								
								if (global.attackIDDamage == "NOT_SET")
								{
									switch (_amountOfRolls)
									{
										case(8):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 7], // Sort this out soon.
												_xDicePosition, _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(7):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 6],
												_xDicePosition + _xDiceDistance, _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(6):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 5],
												_xDicePosition + (_xDiceDistance * 2), _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(5):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 4],
												_xDicePosition + (_xDiceDistance * 3), _yDicePosition, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(4):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 3],
												_xDicePosition, _yDicePositionAlt, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(3):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 2],
												_xDicePosition + _xDiceDistance, _yDicePositionAlt, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(2):
											funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 1],
												_xDicePosition + (_xDiceDistance * 2), _yDicePositionAlt, _emptyModifier,
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
										case(1):
											global.attackIDDamage = funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst],
												_xDicePosition + (_xDiceDistance * 3), _yDicePositionAlt,
												global.moveReturnArray[enumAttackFunction.diceModifier],
												global.moveReturnArray[enumAttackFunction.attackDiceSize]);
											break;
									}
								}
								else if (!instance_exists(global.attackIDDamage))
								{
									if (global.moveIDSequence == "NOT_SET")
									{
										var _xPositionSequence = 128; // For Sequence
										var _yPositionSequence = 72; // For Seqeunce
										
										global.moveIDSequence = layer_sequence_create("sequenceLayer", _xPositionSequence, _yPositionSequence, seq_opponentAttack);
									}
									else if (alarm_get(enumCoreGameAlarms.damageDealt) > 0)
									{
										//Code here
									}
									else
									{
										alarm_set(enumCoreGameAlarms.damageDealt, 1);
									}
								}
							}
							else if (!instance_exists(global.attackIDRoll))
							{
								#region D20 Attack Code
								switch (global.moveReturnArray[enumAttackFunction.result])
								{
									case(global.failureVariable):
										// Put failing code here
										layer_sprite_destroy(obj_coreUI.backTextBoxID); // Pasted here to get it work
										obj_coreUI.backTextBoxID = "NOT_SET";
										global.opponentStageBattle = enumOpponentStages.endTurn; // THIS + battleState = Opponent is NEEDED to progress turn
										break;
									case("NO_EFFECT"):
										layer_sprite_destroy(obj_coreUI.backTextBoxID); // Pasted here to get it work
										obj_coreUI.backTextBoxID = "NOT_SET";
										global.opponentStageBattle = enumOpponentStages.endTurn; // THIS + battleState = Opponent is NEEDED to progress turn
										break;
									default:
										var _arrayLengthCheck = array_length(global.moveReturnArray);
										var _amountOfRolls = _arrayLengthCheck - enumAttackFunction.attackDiceRollFirst;
										var _emptyModifier = 0;
										
										var _xDicePosition = room_width / 4.6;
										
										var _xDiceDistance = 48;
										
										var _yDicePosition = room_height / 3;
										var _yDicePositionAlt = _yDicePosition * 2;
										
										if (global.attackIDDamage == "NOT_SET")
										{
											switch (_amountOfRolls)
											{
												case(8):
													funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 7], // Sort this out soon.
														_xDicePosition, _yDicePosition, _emptyModifier,
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
												case(7):
													funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 6],
														_xDicePosition + _xDiceDistance, _yDicePosition, _emptyModifier,
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
												case(6):
													funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 5],
														_xDicePosition + (_xDiceDistance * 2), _yDicePosition, _emptyModifier,
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
												case(5):
													funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 4],
														_xDicePosition + (_xDiceDistance * 3), _yDicePosition, _emptyModifier,
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
												case(4):
													funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 3],
														_xDicePosition, _yDicePositionAlt, _emptyModifier,
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
												case(3):
													funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 2],
														_xDicePosition + _xDiceDistance, _yDicePositionAlt, _emptyModifier,
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
												case(2):
													funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst + 1],
														_xDicePosition + (_xDiceDistance * 2), _yDicePositionAlt, _emptyModifier,
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
												case(1):
													global.attackIDDamage = funct_diceVisual(global.moveReturnArray[enumAttackFunction.attackDiceRollFirst],
														_xDicePosition + (_xDiceDistance * 3), _yDicePositionAlt,
														global.moveReturnArray[enumAttackFunction.diceModifier],
														global.moveReturnArray[enumAttackFunction.attackDiceSize]);
													break;
											}
										}
										else if (!instance_exists(global.attackIDDamage))
										{
											if (global.moveIDSequence == "NOT_SET")
											{
												var _xPositionSequence = 128; // For Sequence
												var _yPositionSequence = 72; // For Seqeunce
								
												global.moveIDSequence = layer_sequence_create("sequenceLayer", _xPositionSequence, _yPositionSequence, seq_opponentAttack);
											}
											else if (alarm_get(enumCoreGameAlarms.damageDealt) > 0)
											{
												//Code here
											}
											else
											{
												alarm_set(enumCoreGameAlarms.damageDealt, 1);
											}
										}
								}
								#endregion
							}
						} #endregion
						else if (attackNonCheck == "Non-Attack")
						{
							#region Non-Attack Player Code
							if (global.moveIDSequence == "NOT_SET")
							{
								var _xPositionSequence = 128; // For Sequence
								var _yPositionSequence = 72; // For Seqeunce
								
								global.moveIDSequence = layer_sequence_create("sequenceLayer", _xPositionSequence, _yPositionSequence, seq_opponentAttack);
								
							}
							
							if (alarm_get(enumCoreGameAlarms.stateSwitch) > 0)
							{
								//Code here
							}
							else
							{
								alarm_set(enumCoreGameAlarms.stateSwitch, 1);
							}
							#endregion
						}
						break;
				}
				break;
			case(enumBattleState.opponentDamage):
				#region Opponent Damaging Player
				if (global.hpDamageReduction == obj_playerPokemon.pokemonParty[0][enumPokemonArray.currentHP]) // Get rid of Magic numbers later 
				{		//	(RECODE THIS LATER AS IT LIMITS THE OPPONENTS CAPABILITY)
					global.moveIDSequence = "NOT_SET"; // Removed Timer due to time
					global.attackIDDamage = "NOT_SET";
					global.attackIDRoll = "NOT_SET";
					global.hpDamageReduction = "NOT_SET";
					attackNonCheck = "NOT_SET"; // Added for Reset for opponent
					global.opponentStageBattle = enumOpponentStages.endTurn; // THIS + battleState = Opponent is NEEDED to progress turn
					global.battleState = enumBattleState.opponent; 
				}
				#endregion
				break;
			case(enumBattleState.player):
				#region Player Code
				if (global.gamePadConfirm)
				{
					switch (global.playerBattleState)
					{
						case(enumPlayerTurnState.baseMenu):
							switch (global.playerChoiceBattle)
							{
								case(enumBattleChoices.attack):
									global.playerBattleState = enumPlayerTurnState.attackMenu;
									global.playerChoiceAttack = enumPlayerAttack.attack1;
									break;
								case(enumBattleChoices.bag):
									//type here
									break;
								case(enumBattleChoices.pokemon):
									//type here
									break;
								case(enumBattleChoices.endTurn):
									global.playerBattleState = enumPlayerTurnState.endTurnSelection;
									break;
							}
							break;
						case(enumPlayerTurnState.attackMenu):
							switch (global.playerChoiceAttack)
							{
								case(enumPlayerAttack.attack1):
									var _actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1Point];
									var _actionBonusResult = funct_actionBonusPoint(_actionBonus, global.playerActionPoint, global.playerBonusPoint);
									if ((obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1PP] != 0) and _actionBonusResult == true)
									{
										alarm_set(enumCoreGameAlarms.moveAlarm, 1);
									}
									break;
								case(enumPlayerAttack.attack2):
									var _actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2Point];
									var _actionBonusResult = funct_actionBonusPoint(_actionBonus, global.playerActionPoint, global.playerBonusPoint);
									if ((obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2PP] != 0) and _actionBonusResult == true)
									{
										alarm_set(enumCoreGameAlarms.moveAlarm, 1);
									}
									break;
								case(enumPlayerAttack.attack3):
									var _actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3Point];
									var _actionBonusResult = funct_actionBonusPoint(_actionBonus, global.playerActionPoint, global.playerBonusPoint);
									if ((obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3PP] != 0) and _actionBonusResult == true)
									{
										alarm_set(enumCoreGameAlarms.moveAlarm, 1);
									}
									break;
								case(enumPlayerAttack.attack4):
									var _actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4Point];
									var _actionBonusResult = funct_actionBonusPoint(_actionBonus, global.playerActionPoint, global.playerBonusPoint);
									if ((obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4PP] != 0) and _actionBonusResult == true)
									{
										alarm_set(enumCoreGameAlarms.moveAlarm, 1);
									}
									break;
							}
							break;
						case(enumPlayerTurnState.bagMenu):
							// Put Bag stuff here
							break;
						case(enumPlayerTurnState.pokemonMenu):
							// Put pokemon Selection here
							break;
						case(enumPlayerTurnState.endTurnSelection):
							// Put end turn code here.
							break;
					}
				}
				else if (global.gamePadBack)
				{
					switch (global.playerBattleState)
					{
						case(enumPlayerTurnState.baseMenu):
							// Nothing here yet
							break;
						case(enumPlayerTurnState.attackMenu):
							global.playerChoiceAttack = enumPlayerAttack.attack1;
							global.playerBattleState = enumPlayerTurnState.baseMenu;
							break;
						case(enumPlayerTurnState.bagMenu):
							// Put Bag stuff here
							global.playerBattleState = enumPlayerTurnState.baseMenu;
							break;
						case(enumPlayerTurnState.pokemonMenu):
							// Put pokemon Selection here
							global.playerBattleState = enumPlayerTurnState.baseMenu;
							break;
						case(enumPlayerTurnState.endTurnSelection):
							// Put end turn code here.
							break;
					}
				}
				else if (global.gamePadUp)
				{
					switch (global.playerBattleState)
					{
						case(enumPlayerTurnState.baseMenu):
							global.playerChoiceBattle -= _choiceChange;
							if (global.playerChoiceBattle < enumBattleChoices.attack)
							{
								global.playerChoiceBattle = enumBattleChoices.attack;
							}
							break;
						case(enumPlayerTurnState.attackMenu):
							global.playerChoiceAttack -= _choiceChange;
							if (global.playerChoiceAttack < enumPlayerAttack.attack1)
							{
								global.playerChoiceAttack = enumPlayerAttack.attack1;
							}
							break;
						case(enumPlayerTurnState.bagMenu):
							// Put Bag stuff here
							break;
						case(enumPlayerTurnState.pokemonMenu):
							// Put pokemon Selection here
							break;
						case(enumPlayerTurnState.endTurnSelection):
							// Put end turn code here.
							break;
					}
				}
				else if (global.gamePadDown)
				{
					switch (global.playerBattleState)
					{
						case(enumPlayerTurnState.baseMenu):
							global.playerChoiceBattle += _choiceChange;
							if (global.playerChoiceBattle > enumBattleChoices.endTurn)
							{
								global.playerChoiceBattle = enumBattleChoices.endTurn;
							}
							break;
						case(enumPlayerTurnState.attackMenu):
							global.playerChoiceAttack += _choiceChange;
							if (global.playerChoiceAttack > enumPlayerAttack.attack4)
							{
								global.playerChoiceAttack = enumPlayerAttack.attack4;
							}
							break;
						case(enumPlayerTurnState.bagMenu):
							// Put Bag stuff here
							break;
						case(enumPlayerTurnState.pokemonMenu):
							// Put pokemon Selection here
							break;
						case(enumPlayerTurnState.endTurnSelection):
							// Put end turn code here.
							break;
					}
				}
				else if (global.gamePadLeft)
				{
					// Put Code here
				}
				else if (global.gamePadRight)
				{
					// Put Code here
				}
				else if (global.gamePadX) // Extra Information
				{
					switch (global.playerBattleState)
					{
						case(enumPlayerTurnState.attackMenu):
							switch (global.playerChoiceAttackExplain)
							{
								case(true):
									global.playerChoiceAttackExplain = false;
									break;
								case(false):
									global.playerChoiceAttackExplain = true;
									break;
							}
							break;
						// Put rest of the menus here to get more information in future builds
					}
				}
				#endregion
				break;
			case(enumBattleState.intermission):
				//type here
				break;
			}
		#endregion
		break;
	case (rm_victory): // Temp Code for Victory Stuff
		if (global.gamePadConfirm)
		{
			global.menuState = enumTitleScreenState.pressStart;
			draw_set_halign(fa_left);
			room = rm_titleMenu;
		}
		break;
	case (rm_loss):
		if (global.gamePadConfirm)
		{
			global.menuState = enumTitleScreenState.pressStart;
			draw_set_halign(fa_left);
			room = rm_titleMenu;
		}
		break;
}

