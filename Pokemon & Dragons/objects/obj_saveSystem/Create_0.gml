/// @description 

#region Initial Save File Read

ini_open("coreSaveFile.ini");
if (ini_read_real("settings", "resolutionWidth", 0) == 0)
{
	var _displayHeight = (display_get_height() / 2);
	var _displayWidth = ((_displayHeight / 9) * 16);
	ini_write_real("settings", "resolutionWidth", _displayWidth);
	ini_write_real("settings", "resolutionHeight", _displayHeight);
	ini_write_real("settings", "fullScreen", false);
	global.gameResolutionWidth = _displayWidth;
	global.gameResolutionHeight = _displayHeight;
}
else
{
	global.gameResolutionWidth = ini_read_real("settings", "resolutionWidth", 854);
	global.gameResolutionHeight = ini_read_real("settings", "resolutionHeight", 480);
	if (ini_read_real("settings", "fullScreen", false) == true)
	{
		window_set_fullscreen(true);
	}
	else
	{
		window_set_fullscreen(false);
	}
}

ini_close();

// Consider using Json files for route tracking + save in future, instead of Ini.
// Ini for settings on PC, transition to Json if an issue.
#endregion
