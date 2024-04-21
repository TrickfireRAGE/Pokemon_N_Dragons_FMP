/// @description Main Variables Established here

#region Enumeration Declaration

enum gameState
{
	studioVideoState = 0,
	menuState = 1,
	inGameState = 2,
	battleState = 3,
}

// Put other Enumerations here

#endregion


#region Core Varibles

global.currentGameState = gameState.studioVideoState;

#endregion

#region Video Opening

if (global.currentGameState == gameState.studioVideoState)
{
	video = video_open("vid_studioIntro.mp4");
	video_enable_loop(false);
	// When Sound System is set up - video_set_volume(global.soundVolume);
}

#endregion