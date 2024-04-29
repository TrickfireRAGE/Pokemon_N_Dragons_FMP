/// @description 

#region Display Variable Declaration

// Change this to a hybrid system that uses DPI in future
surface_resize(application_surface, global.gameResolutionWidth, global.gameResolutionHeight);
window_set_size(global.gameResolutionWidth, global.gameResolutionHeight); // Put into seperate script element in next version

#endregion

#region Introductory Video

if (room == rm_introVideo)
{
	video_open("vid_introStudios.mov");
	video_enable_loop(false);
	// When Sound System is set up - video_set_volume(global.soundVolume);
}

#endregion

#region Title Screen Base Created Variables

titleScreenAlphaLogo = 0;
titleScreenAlphaText = 0;

#endregion

#region Title Screen Enumerations

enum enumMainMenuChoice 
{
	newGame = 0,
	continueSave = 1,
	settings = 2,
	exitSave = 3
}

enum enumSettingsChoice
{
	resolution = 0,
	fullScreen = 1,
	sound = 2,
	controls = 3,
	returnMainMenu = 4
}

enum enumResolutionChoice
{
	resolution480P = 0,
	resolution540P = 1,
	resolution720P = 2,
	resolution1080P = 3,
	resolution1440P = 4,
	resolution2160P = 5,
	returnSettings = 6
}

enum enumFullScreenChoice
{
	windowed = 0,
	fullScreen = 1,
	returnSettings = 2
}

#endregion