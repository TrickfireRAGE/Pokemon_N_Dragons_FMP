/// @description 

#region VERSION NUMBER

versionNumber = "Pre-Alpha - V0.0.0.11";

#endregion

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
	video_set_volume(global.soundVolume);
}

#endregion

#region Title Screen Base Created Variables

titleScreenAlphaLogo = 0;
titleScreenAlphaText = 0;

#endregion

#region Alarm Enumeration

enum enumCoreUIAlarms
{
	sequences = 0 // put more here when added
}


#endregion

#region Visual Pokemon Variables and Enumerations

enum enumPokemonPosition // Expand or scrap if going animated or increasing different views
{
	front = 0,
	back = 1
}


#endregion

#region Credits System

scrollHeight = "NOT_SET";
global.creditsCheck = false;
creditsArraySize = 45; // Think of a better way to implement this system
creditsText = []
creditsText[0] = " ";
creditsText[1] = " ";
creditsText[2] = "***Development Team***";
creditsText[3] = "==Project Leader/Lead Programmer==";
creditsText[4] = "Jonathon Lloyd-Jones (Trickfire Studios)";
creditsText[5] = "==Lead Designer/Art Creation==";
creditsText[6] = "Ethan Bond (Bond Studios)";
creditsText[7] = " ";
creditsText[8] = "***Asset Creation***";
creditsText[9] = "Game Logo - Jonathon Lloyd-Jones";
creditsText[10] = "Intro Video - Jonathon Lloyd-Jones";
creditsText[11] = "// Put Ethan's Stuff here";
creditsText[12] = " ";
creditsText[13] = "***Voice Acting Performances***";
creditsText[14] = "==Main Cast==";
creditsText[15] = "//Put Voice Acting Performances here";
creditsText[16] = " ";
creditsText[17] = "***External Assets***";
creditsText[18] = "==Pokemon Legends Arceus Soundtrack==";
creditsText[19] = "Junichi Masuda";
creditsText[20] = "Go Ichinose";
creditsText[21] = "Hitomi Sato";
creditsText[22] = "Hiromitsu Maeba";
creditsText[23] = "Morikazu Aoki";
creditsText[24] = "==Pokemon Black/White Soundtrack==";
creditsText[25] = "Junichi Masuda";
creditsText[26] = "Hitomi Sato";
creditsText[27] = "Shota Kageyama";
creditsText[28] = "Morikazu Aoki";
creditsText[29] = "Minako Adachi";
creditsText[30] = "Go Ichinose";
creditsText[31] = "==Pokemon Sound Effects==";
creditsText[32] = "GameFreak";
creditsText[33] = "==Extra Sound Effects==";
creditsText[34] = "ZapSplat.com";
creditsText[35] = " ";
creditsText[36] = "***Trademarks***"
creditsText[37] = "==Trickfire Studios==";
creditsText[38] = "Jonathon Lloyd-Jones";
creditsText[39] = "==Bond Studios==";
creditsText[40] = "Ethan Bond";
creditsText[41] = "==Pokemon==";
creditsText[42] = "Nintendo";
creditsText[43] = "GameFreak";
creditsText[44] = "Creatures";
creditsText[45] = "==Dungeons & Dragons==";
creditsText[46] = "Wizards of the Coast";
creditsText[47] = "==GameMaker Studio LTS 2022=="
creditsText[48] = "YoYo Games"

#endregion
