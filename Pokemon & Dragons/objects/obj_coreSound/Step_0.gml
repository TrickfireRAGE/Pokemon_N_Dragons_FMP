/// @description 


#region Main Menu Sound Effects
switch (global.menuState)
{
	case(enumTitleScreenState.pressStart):
		if (global.gamePadStart) 
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		break;
	case(enumTitleScreenState.mainMenu):
		if ((global.gamePadConfirm) and (global.titleScreenOptions != enumMainMenuChoice.continueSave))
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		else if ((global.gamePadConfirm) and (global.titleScreenOptions == enumMainMenuChoice.continueSave))
		{
			audio_play_sound(snd_penScribble, 0, false);
		}
		else if (global.gamePadBack)
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		break;
	case(enumTitleScreenState.newGame):
		if ((global.gamePadConfirm) and (global.newGameOptions != enumNewGameChoice.story))
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		else if ((global.gamePadConfirm) and (global.newGameOptions == enumNewGameChoice.story))
		{
			audio_play_sound(snd_penScribble, 0, false);
		}
		else if (global.gamePadBack)
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		break;
	case(enumTitleScreenState.settingsMenu):
		if ((global.gamePadConfirm))
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		else if (global.gamePadBack)
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		break;
}
#endregion

#region Battle Sound Effects

if (room == rm_battleRoom)
{
	switch (global.battleState)
	{
		case(enumBattleState.introSequence):
			var _opponentPokemonCryTimer = 300; // To get around the random cries
			var _playerPokemonCryTimer = 418;
			if (soundCountBattle == 2)
			{
				opponentPokemonCrySound = obj_opponentPokemon.pokemonParty[0][enumPokemonArray.sound];
				playerPokemonCrySound = obj_playerPokemon.pokemonParty[0][enumPokemonArray.sound];
			}
			else if (soundCountBattle == _opponentPokemonCryTimer)
			{
				audio_play_sound(asset_get_index(opponentPokemonCrySound), 0, 0);
			}
			else if (soundCountBattle == _playerPokemonCryTimer)
			{
				audio_play_sound(asset_get_index(playerPokemonCrySound), 0, 0);
			}
			soundCountBattle++;
			break;
		case(enumBattleState.player):
			if (global.gamePadConfirm || global.gamePadBack)
			{
				audio_play_sound(snd_battleUISound, 0, false);
			}
			else if (global.gamePadUp || global.gamePadDown)
			{
				audio_play_sound(snd_battleUIUpDown, 0, false);
			}
			else if ((global.gamePadX) && (global.playerBattleState == enumPlayerTurnState.attackMenu))
			{
				audio_play_sound(snd_battleUIInfo, 0, false);
			}
			break;
	}
}
else if (room == (rm_victory or rm_loss))
{
	soundCountBattle = 0;
}

#endregion



#region Music

switch (room)
{
	case(rm_titleMenu):
		#region Main Menu
		if (global.menuState == enumTitleScreenState.pressStart)
		{
			if (audio_is_playing(bgm_titleScreen))
			{
				break;
			}
			else
			{
				audio_stop_all();
				audio_play_sound(bgm_titleScreen, 0, true);
			}
		}
		switch(global.menuState)
		{
			case(enumTitleScreenState.mainMenu):
				if (audio_is_playing(bgm_titleScreen))
				{
					break;
				}
				else
				{
					audio_play_sound(bgm_titleScreen, 0, true);
				}
				break;
			case(enumTitleScreenState.settingsMenu):
				if (global.settingsMenuState != enumSettingsScreenState.credits)
				{
					if (audio_is_playing(bgm_titleScreen))
					{
						break;
					}
					else
					{
						if (audio_is_playing(bgm_unwaveringEmotions))
						{
							audio_stop_sound(bgm_unwaveringEmotions);
						}
						audio_play_sound(bgm_titleScreen, 0, true);
					}
					break;
				}
				else if (global.settingsMenuState == enumSettingsScreenState.credits)
				{
					audio_stop_sound(bgm_titleScreen);
					if (audio_is_playing(bgm_unwaveringEmotions))
					{
						break;
					}
					else
					{
						audio_play_sound(bgm_unwaveringEmotions, 0, true);
					}
				}
				break;
		}
		#endregion
		break;
	case(rm_battleRoom):
		#region Battle Room
		var _health = (obj_playerPokemon.pokemonParty[0][enumPokemonArray.currentHP] / obj_playerPokemon.pokemonParty[0][enumPokemonArray.maxHP]) * 100; // Temp Solution for Low Health Music
		
		switch (global.gameState)
		{
			case(enumGameState.story):
				//Nothing
				break;
			case(enumGameState.level1Battle):
				#region Level 1 Battle Music
				if (battleMusicState == enumMusicState.startOfBattle)
				{
					audio_stop_all();
					audio_play_sound(bgm_rivalBattle1Start, 0, false);
					battleMusicState = enumMusicState.aboutToLoop;
				}
				else if (_health <= 25 && battleMusicState == enumMusicState.lowAbout && !audio_is_playing(bgm_lowHealthBattleStart))
				{
					audio_play_sound(bgm_lowHealthBattleLoop, 0, true);
					battleMusicState = enumMusicState.lowLooping;
				}
				else if (_health <= 25 && !(audio_is_playing(bgm_lowHealthBattleStart) or audio_is_playing(bgm_lowHealthBattleLoop))) // Not perfect Low Health System but will do for Playtest
				{
					audio_stop_all();
					audio_play_sound(bgm_lowHealthBattleStart, 0, 0);
					battleMusicState = enumMusicState.lowAbout;
				}
				else if (_health > 25 && audio_is_playing(bgm_lowHealthBattleLoop))
				{
					battleMusicState = enumMusicState.aboutToLoop;
					audio_stop_sound(bgm_lowHealthBattleLoop);
				}
				else if (battleMusicState == enumMusicState.aboutToLoop and !audio_is_playing(bgm_rivalBattle1Start))
				{
					audio_play_sound(bgm_rivalBattle1Loop, 0, true);
					battleMusicState = enumMusicState.looping;
				} 
				
				#endregion
				break;
			case(enumGameState.endGameBattle):
				#region End Game Music
				if (battleMusicState == enumMusicState.startOfBattle)
				{
					audio_stop_all();
					audio_play_sound(bgm_endGameBattleStart, 0, false);
					battleMusicState = enumMusicState.aboutToLoop;
				}
				else if (_health <= 25 && battleMusicState == enumMusicState.lowAbout && !audio_is_playing(bgm_lowHealthBattleStart))
				{
					audio_play_sound(bgm_lowHealthBattleLoop, 0, true);
					battleMusicState = enumMusicState.lowLooping;
				}
				else if (_health <= 25 && !(audio_is_playing(bgm_lowHealthBattleStart) or audio_is_playing(bgm_lowHealthBattleLoop))) // Not perfect Low Health System but will do for Playtest
				{
					audio_stop_all();
					audio_play_sound(bgm_lowHealthBattleStart, 0, 0);
					battleMusicState = enumMusicState.lowAbout;
				}
				else if (_health > 25 && audio_is_playing(bgm_lowHealthBattleLoop))
				{
					battleMusicState = enumMusicState.aboutToLoop;
					audio_stop_sound(bgm_lowHealthBattleLoop);
				}
				else if (battleMusicState == enumMusicState.aboutToLoop and !audio_is_playing(bgm_endGameBattleStart))
				{
					audio_play_sound(bgm_endGameBattleLoop, 0, true);
					battleMusicState = enumMusicState.looping;
				} 
				#endregion
		}
		#endregion
		break;
	case(rm_loss): // No Music yet
		//
		break;
	case(rm_victory):
		//
		break;
		
		
}

#endregion

				


