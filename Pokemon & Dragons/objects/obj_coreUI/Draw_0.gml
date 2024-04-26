/// @description 

switch (room)
{
	case(rm_introVideo):
		var _videoData = video_draw(); // Code refereneced from Shaun Spalding
		var _videoStatus = _videoData[0];
		if (_videoStatus == 0)
		{
			draw_surface(_videoData[1], 0, 0);
		}
		break;
	case(rm_titleMenu):
		// Put something here
		break;
}


