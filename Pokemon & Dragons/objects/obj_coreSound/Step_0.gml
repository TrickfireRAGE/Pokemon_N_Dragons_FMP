/// @description 

switch (room)
{
	case(rm_titleMenu):
		if (audio_is_playing(bm_titleScreen))
		{
			exit;
		}
		else
		{
			audio_play_sound(bm_titleScreen, 0, true);
		}
		
		
		break;
}


