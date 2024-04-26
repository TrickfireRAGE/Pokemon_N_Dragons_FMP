/// @description Main Variables Established here

#region Enumeration Declaration

enum gameState // Scrap for now
{
	studioVideoState = 0,
	menuState = 1,
	inGameState = 2,
	battleState = 3,
}

// Put other Enumerations here

#endregion


#region Core Varibles

// Type here

#endregion

#region Save Loading

#endregion

#region Display Variables

// Change this to a hybrid system that uses DPI in future
global.videoResolutionHeight = 720;
global.videoResolutionWidth = 1280; // Change to "NOT_SET" once Save system is up
surface_resize(application_surface, global.videoResolutionWidth, global.videoResolutionHeight);
window_set_size(global.videoResolutionWidth, global.videoResolutionHeight); // Put into seperate script element in next version

#endregion

#region Video Opening

if (room == rm_introVideo)
{
	video_open("vid_studioIntro.mp4");
	video_enable_loop(false);
	// When Sound System is set up - video_set_volume(global.soundVolume);
}

#endregion