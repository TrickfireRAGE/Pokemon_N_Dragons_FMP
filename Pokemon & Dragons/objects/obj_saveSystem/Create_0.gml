/// @description 

#region Initial Save File Read

ini_open("coreSaveFile.ini");
if (ini_read_real("settings", "resolutionWidth", 0) == false)
{
	var _displayWidth = (display_get_width() / 2);
	var _displayHeight = (display_get_height() / 2);
	ini_write_real("settings", "resolutionWidth", _displayWidth);
	ini_write_real("settings", "resolutionHeight", _displayHeight);
	global.videoResolutionWidth = _displayWidth;
	global.videoResolutionHeight = _displayHeight;
}
else
{
	global.videoResolutionWidth = ini_read_real("settings", "resolutionWidth", 854);
	global.videoResolutionHeight = ini_read_real("settings", "resolutionHeight", 480);
}

// Consider using Json files for route tracking + save in future, instead of Ini.
// Ini for settings on PC, transition to Json if an issue.
#endregion
