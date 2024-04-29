// For all the setting functions

function funct_resolutionChanges(_height)
{
	ini_open("coreSaveFile.ini");
	global.gameResolutionHeight = _height;
	global.gameResolutionWidth = ((_height / 9) * 16);
	ini_write_real("settings", "resolutionHeight", global.gameResolutionHeight);
	ini_write_real("settings", "resolutionWidth", global.gameResolutionWidth);
	window_set_size(global.gameResolutionWidth, global.gameResolutionHeight); 
	surface_resize(application_surface, global.gameResolutionWidth, global.gameResolutionHeight);
	ini_close();
}

function funct_fullScreenChanges(_fullScreen)
{
	ini_open("coreSaveFile.ini");
	ini_write_real("settings", "fullScreen", _fullScreen);
	window_set_fullscreen(_fullScreen);
	ini_close();
}