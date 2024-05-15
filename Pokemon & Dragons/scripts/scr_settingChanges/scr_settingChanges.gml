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

function funct_soundChanges(_volume)
{
	var _volumeBattleMusic = _volume * 0.4;
	var _volumeMenuMusic = _volume * 0.3;
	var _volumePokemonCries = _volume * 0.7;
	var _volumeSoundEffects = _volume * 0.8;
	var _time = 0;

	audio_group_set_gain(sg_battleMusicGroup, _volumeBattleMusic, _time);
	audio_group_set_gain(sg_menuMusicGroup, _volumeMenuMusic, _time);
	audio_group_set_gain(sg_pokemonCriesGroup, _volumePokemonCries, _time);
	audio_group_set_gain(sg_soundEffectsGroup, _volumeSoundEffects, _time);
}