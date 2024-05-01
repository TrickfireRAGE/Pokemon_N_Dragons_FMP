/// @description 


switch (global.menuState)
{
	case(enumTitleScreenState.pressStart):
		if (global.gamePadStart) // Doesn't work due to changing state before this code excutes. BUG
		{
			//audio_play_sound(snd_selectionPaper, 0, false);
		}
		break;
	case(enumTitleScreenState.mainMenu):
		if ((global.gamePadConfirm) and (global.titleScreenOptions != enumMainMenuChoice.continueSave))
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		else if ((global.gamePadConfirm) and (global.titleScreenOptions == enumMainMenuChoice.continueSave))
		{
			// Put Audio here for rejection (Prototype) or for continuation (Full Project)
		}
		else if (global.gamePadBack)
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		break;
	case(enumTitleScreenState.newGame):
		// Put Audio Here
		break;
	case(enumTitleScreenState.settingsMenu):
		if ((global.gamePadConfirm) and (global.settingsMenuState != enumSettingsScreenState.credits))
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		else if (global.gamePadBack)
		{
			audio_play_sound(snd_selectionPaper, 0, false);
		}
		break;
}

switch (room) // Temporary System due to multiple external switches not working
{
	case(rm_titleMenu):
		if (global.menuState == enumTitleScreenState.pressStart)
		{
			if (audio_is_playing(bm_titleScreen))
			{
				break;
			}
			else
			{
				audio_play_sound(bm_titleScreen, 0, true);
			}
		}
		switch(global.menuState)
		{
			case(enumTitleScreenState.mainMenu):
				if (audio_is_playing(bm_titleScreen))
				{
					break;
				}
				else
				{
					audio_play_sound(bm_titleScreen, 0, true);
				}
				break;
			case(enumTitleScreenState.settingsMenu):
				if (global.settingsMenuState != enumSettingsScreenState.credits)
				{
					if (audio_is_playing(bm_titleScreen))
					{
						break;
					}
					else
					{
						if (audio_is_playing(bm_unwaveringEmotions))
						{
							audio_stop_sound(bm_unwaveringEmotions);
						}
						audio_play_sound(bm_titleScreen, 0, true);
					}
					break;
				}
				else if (global.settingsMenuState == enumSettingsScreenState.credits)
				{
					audio_stop_sound(bm_titleScreen);
					if (audio_is_playing(bm_unwaveringEmotions))
					{
						break;
					}
					else
					{
						audio_play_sound(bm_unwaveringEmotions, 0, true);
					}
				}
				break;
		}
		break;
}



				


