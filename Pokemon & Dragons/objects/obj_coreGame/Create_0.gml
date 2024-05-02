/// @description Main Variables Established here

#region Enumeration Declaration

enum enumCoreGameAlarms // For all the alarms in obj_coreGame
{
	stateSwitch = 0
}

enum enumMusicState // For Music in Battles
{
	startOfBattle = 0,
	aboutToLoop = 1,
	looping = 2
}

enum enumTitleScreenState // States within Title Screens
{
	pressStart = 0,
	mainMenu = 1,
	settingsMenu = 2,
	newGame = 3,
	outOfMenu = 4
}

enum enumSettingsScreenState // States within Settings
{
	settingsBase = 0,
	resolution = 1,
	fullScreen = 2,
	sound = 3,
	controls = 4,
	credits = 5
}

enum enumGameState // States for Gameplay
{
	story = 0,
	level1Battle = 1,
	endGameBattle = 2
}

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
	credits = 4,
	returnMainMenu = 5
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

enum enumNewGameChoice
{
	story = 0,
	level1 = 1,
	endGame = 2,
	returnToMainMenu = 3
}



#endregion

#region Gamepad Initalisation

for (var i = 0; i < gamepad_get_device_count(); i++) // Got from FioreFire
{
	if gamepad_is_connected(i)
	{
		global.controllerNumber = i;
	}
}
#endregion

#region Title Screen Logic

timerTitleScreenCheck = 0;
global.titleScreenOptions = 0; // Global due to coreUI accessing it.
global.settingsScreenOptions = 0; // ^
global.newGameOptions = 0; // ^

#endregion

#region Game States

global.menuState = "NOT_SET"; // Handles the State for Menus
global.settingsMenuState = "NOT_SET"; // Handles the State for Settings Menu
global.gameState = "NOT_SET"; // Handles States for Gameplay

#endregion


