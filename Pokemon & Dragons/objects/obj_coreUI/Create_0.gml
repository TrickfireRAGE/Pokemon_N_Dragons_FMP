/// @description 

#region VERSION NUMBER

versionNumber = "Pre-Alpha - V0.0.0.16";

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

enum enumTypeColour // No Fairy Types in This version
{
	normal = 0,
	fighting = 1,
	flying = 2,
	poison = 3,
	ground = 4, 
	rock = 5,
	bug = 6, 
	ghost = 7,
	steel = 8, 
	fire = 9, 
	water = 10, 
	grass = 11, 
	electric = 12,
	psychic = 13,
	ice = 14, 
	dragon = 15, 
	dark = 16
}
	

#endregion

#region Type Colours

typeColoursArray = [];
// String
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.normal] = "Normal";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.fighting] = "Fighting";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.flying] = "Flying";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.poison] = "Poison";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.ground] = "Ground";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.rock] = "Rock";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.bug] = "Bug";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.ghost] = "Ghost";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.steel] = "Steel";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.fire] = "Fire";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.water] = "Water";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.grass] = "Grass";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.electric] = "Electric";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.psychic] = "Psychic";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.ice] = "Ice";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.dragon] = "Dragon";
typeColoursArray[enumTypeColRows.stringType][enumTypeColour.dark] = "Dark";
// Colours (Make proper colours later!)
typeColoursArray[enumTypeColRows.colour][enumTypeColour.normal] = c_ltgrey;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.fighting] = c_white + c_orange;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.flying] = c_white + c_blue;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.poison] = c_purple;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.ground] = c_white + c_maroon;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.rock] = c_maroon;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.bug] = c_green;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.ghost] = c_purple;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.steel] = c_grey;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.fire] = c_orange;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.water] = c_blue;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.grass] = c_lime;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.electric] = c_yellow;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.psychic] = c_red + c_white;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.ice] = c_navy;
typeColoursArray[enumTypeColRows.colour][enumTypeColour.dark] = c_maroon + c_grey;

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
// creditsText[] = "Background Level 1 - Ethan Bond";
// creditsText[] = "Background End Game - Ethan Bond";
// creditsText[] = "Background TitleScreen - Ethan Bond";
// creditsText[] = "Controls Settings - Ethan Bond";
// creditsText[] = "UI Circle Small - Ethan Bond";
// creditsText[] = "Riolu Sprites - Ethan Bond";
// creditsText[] = "Lucario Sprites - Ethan Bond";
// creditsText[] = "Mega Lucario Sprites - Ethan Bond";
// creditsText[] = "Pikachu Sprites - Ethan Bond";
// creditsText[] = "Darkrai Sprite - Ethan Bond";
creditsText[9] = "Game Logo - Jonathon Lloyd-Jones";
creditsText[10] = "Intro Video - Jonathon Lloyd-Jones";
creditsText[11] = "UI Circle Big - Jonathon Lloyd-Jones";
creditsText[12] = " ";
creditsText[13] = "***Voice Acting Performances***";
creditsText[14] = "==Main Cast==";
creditsText[15] = "None in Preview";
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
// creditsText[] = "==KyoMadoka Font==";
// creditsText[] = "PUT USER HERE";
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
