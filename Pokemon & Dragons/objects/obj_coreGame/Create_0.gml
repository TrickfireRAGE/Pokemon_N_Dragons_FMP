/// @description Main Variables Established here

#region Enumeration Declaration

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

// Put other Enumerations here

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

#endregion

#region Game States

global.menuState = "NOT_SET"; // Handles the State for Menus
global.settingsMenuState = "NOT_SET"; // Handles the State for Settings Menu

#endregion

