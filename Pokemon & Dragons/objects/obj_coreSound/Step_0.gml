/// @description 

#region Sound Effects

#region Main Menu
switch (global.menuState)
{
	case(enumTitleScreenState.pressStart):
		if (global.gamePadStart) // Doesn't work due to changing state before this code excutes. BUG
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

#region Battle

// Put Battle Effects here

#endregion

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
				else if (battleMusicState == enumMusicState.aboutToLoop and !audio_is_playing(bgm_endGameBattleStart))
				{
					audio_play_sound(bgm_endGameBattleLoop, 0, true);
					battleMusicState = enumMusicState.looping;
				} 
				#endregion
		}
		#endregion
		break;
		
		
}

#endregion

				


