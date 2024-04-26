/// @description 


#region Display Variable Declaration

// Change this to a hybrid system that uses DPI in future
surface_resize(application_surface, global.videoResolutionWidth, global.videoResolutionHeight);
window_set_size(global.videoResolutionWidth, global.videoResolutionHeight); // Put into seperate script element in next version

#endregion

#region Introductory Video

if (room == rm_introVideo)
{
	video_open("vid_studioIntro.mp4");
	video_enable_loop(false);
	// When Sound System is set up - video_set_volume(global.soundVolume);
}

#endregion

#region Title Screen Base Created Variables

titleScreenAlphaLogo = 0;
titleScreenAlphaText = 0;

#endregion