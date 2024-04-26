/// @description Runs the core states

switch (room)
{
	case(rm_introVideo):
		if (video_get_status() == video_status_closed)
		{
			room_goto(rm_titleMenu);
		}
		break;
	case(rm_titleMenu):
		// Type here
		break;
}
