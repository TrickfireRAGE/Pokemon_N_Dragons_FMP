/// @description 

#region VERSION NUMBER

versionNumber = "V0.0.1.5 (Pre-Showcase)"; // Version 0.0.2.0 will be the Showcase Build Version Known As - V0.0.2.0 (Showcase)

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
titleScreenAlphaLucario = 0;

#endregion

#region Alarm Enumeration

enum enumCoreUIAlarms
{
	backgroundEffect = 0 // put more here when added
}

#endregion

#region Visual Pokemon Variables and Enumerations

enum enumPokemonPosition // Expand or scrap if going animated or increasing different views
{
	front = 0,
	back = 1
}

enum enumTypeColRows
{
	stringType = 0,
	colour = 1
}

#endregion

#region Battle UI Variables

hpDecrease = 0;
backTextBoxID = "NOT_SET";

#endregion

#region Type Colours

typeColoursArray = [];
// String
typeColoursArray[enumTypeColRows.stringType][enumType.normal] = "Normal";
typeColoursArray[enumTypeColRows.stringType][enumType.fighting] = "Fighting";
typeColoursArray[enumTypeColRows.stringType][enumType.flying] = "Flying";
typeColoursArray[enumTypeColRows.stringType][enumType.poison] = "Poison";
typeColoursArray[enumTypeColRows.stringType][enumType.ground] = "Ground";
typeColoursArray[enumTypeColRows.stringType][enumType.rock] = "Rock";
typeColoursArray[enumTypeColRows.stringType][enumType.bug] = "Bug";
typeColoursArray[enumTypeColRows.stringType][enumType.ghost] = "Ghost";
typeColoursArray[enumTypeColRows.stringType][enumType.steel] = "Steel";
typeColoursArray[enumTypeColRows.stringType][enumType.fire] = "Fire";
typeColoursArray[enumTypeColRows.stringType][enumType.water] = "Water";
typeColoursArray[enumTypeColRows.stringType][enumType.grass] = "Grass";
typeColoursArray[enumTypeColRows.stringType][enumType.electric] = "Electric";
typeColoursArray[enumTypeColRows.stringType][enumType.psychic] = "Psychic";
typeColoursArray[enumTypeColRows.stringType][enumType.ice] = "Ice";
typeColoursArray[enumTypeColRows.stringType][enumType.dragon] = "Dragon";
typeColoursArray[enumTypeColRows.stringType][enumType.dark] = "Dark";
// Colours (Make proper colours later!)
typeColoursArray[enumTypeColRows.colour][enumType.normal] = c_ltgrey;
typeColoursArray[enumTypeColRows.colour][enumType.fighting] = c_white + c_orange;
typeColoursArray[enumTypeColRows.colour][enumType.flying] = c_white + c_blue;
typeColoursArray[enumTypeColRows.colour][enumType.poison] = c_fuchsia;
typeColoursArray[enumTypeColRows.colour][enumType.ground] = c_white + c_maroon;
typeColoursArray[enumTypeColRows.colour][enumType.rock] = c_maroon;
typeColoursArray[enumTypeColRows.colour][enumType.bug] = c_green;
typeColoursArray[enumTypeColRows.colour][enumType.ghost] = c_purple;
typeColoursArray[enumTypeColRows.colour][enumType.steel] = c_grey;
typeColoursArray[enumTypeColRows.colour][enumType.fire] = c_orange;
typeColoursArray[enumTypeColRows.colour][enumType.water] = c_blue;
typeColoursArray[enumTypeColRows.colour][enumType.grass] = c_lime;
typeColoursArray[enumTypeColRows.colour][enumType.electric] = c_yellow;
typeColoursArray[enumTypeColRows.colour][enumType.psychic] = c_fuchsia;
typeColoursArray[enumTypeColRows.colour][enumType.ice] = c_navy;
typeColoursArray[enumTypeColRows.colour][enumType.dragon] = c_purple;
typeColoursArray[enumTypeColRows.colour][enumType.dark] = c_maroon + c_grey;

#endregion

#region Credits System

scrollHeight = "NOT_SET";
global.creditsCheck = false;
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
creditsText[9] = "Background Level 1 - Ethan Bond";
creditsText[10] = "Background End Game - Ethan Bond";
creditsText[11] = "Background TitleScreen - Ethan Bond";
creditsText[12] = "Controls Settings - Ethan Bond";
creditsText[13] = "UI Circle Small - Ethan Bond";
creditsText[14] = "Riolu Sprites - Ethan Bond";
creditsText[15] = "Lucario Sprites - Ethan Bond";
creditsText[16] = "Mega Lucario Sprites - Ethan Bond";
creditsText[17] = "Pikachu Sprites - Ethan Bond";
creditsText[18] = "Darkrai Sprite - Ethan Bond";
creditsText[19] = "Battle UI - Ethan Bond";
creditsText[20] = "Attack Moves - Ethan Bond";
creditsText[21] = "Game Logo - Jonathon Lloyd-Jones";
creditsText[22] = "Intro Video - Jonathon Lloyd-Jones";
creditsText[23] = "UI Circle Big - Jonathon Lloyd-Jones";
creditsText[24] = " ";
creditsText[25] = "***Voice Acting Performances***";
creditsText[26] = "==Main Cast==";
creditsText[27] = "None in Preview";
creditsText[28] = " ";
creditsText[29] = "***External Assets***";
creditsText[30] = "==Pokemon Legends Arceus Soundtrack==";
creditsText[31] = "Junichi Masuda";
creditsText[32] = "Go Ichinose";
creditsText[33] = "Hitomi Sato";
creditsText[34] = "Hiromitsu Maeba";
creditsText[35] = "Morikazu Aoki";
creditsText[36] = "==Pokemon Black/White Soundtrack==";
creditsText[37] = "Junichi Masuda";
creditsText[38] = "Hitomi Sato";
creditsText[39] = "Shota Kageyama";
creditsText[40] = "Morikazu Aoki";
creditsText[41] = "Minako Adachi";
creditsText[42] = "Go Ichinose";
creditsText[43] = "==Pokemon Sound Effects==";
creditsText[44] = "GameFreak";
creditsText[45] = "==Extra Sound Effects==";
creditsText[46] = "ZapSplat.com";
creditsText[47] = "==KyoMadoka Font==";
creditsText[48] = "Maruoka Hakusyu Inpo Co.";
creditsText[49] = " ";
creditsText[50] = "***Trademarks***"
creditsText[51] = "==Trickfire Studios==";
creditsText[52] = "Jonathon Lloyd-Jones";
creditsText[53] = "==Bond Studios==";
creditsText[54] = "Ethan Bond";
creditsText[55] = "==Pokemon==";
creditsText[56] = "Nintendo";
creditsText[57] = "GameFreak";
creditsText[58] = "Creatures";
creditsText[59] = "==Dungeons & Dragons==";
creditsText[60] = "Wizards of the Coast";
creditsText[61] = "==GameMaker Studio LTS 2022=="
creditsText[62] = "YoYo Games"
creditsArraySize = array_length(creditsText); // Think of a better way to implement this system

#endregion
