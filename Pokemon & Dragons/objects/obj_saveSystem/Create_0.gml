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
	ini_write_real("settings", "sound", 0.5);
	global.gameResolutionWidth = _displayWidth;
	global.gameResolutionHeight = _displayHeight;
	global.soundVolume = 0.5;
	audio_master_gain(global.soundVolume);
}
else
{
	global.gameResolutionWidth = ini_read_real("settings", "resolutionWidth", 854);
	global.gameResolutionHeight = ini_read_real("settings", "resolutionHeight", 480);
	global.soundVolume = ini_read_real("settings", "sound", 0.5);
	audio_master_gain(global.soundVolume);
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



#region Temporary Json Initialisation for Pokemon in Prototype

/*var _pokemonStarterPikachu =
{
	version : "0.1",
	pokemonCoreStats :
	{
		str : 10,
		dex : 14,
		con : 13,
		int : 12,
		wis : 15,
		type : "Electric"
	},
	pokemonLevelUpStats :
	{
		lv4StatWis : 1,
		lv4StatDex : 1,
		lv5AC : 1,
		lv7AC : 1,
		lv8StatWis : 1,
		lv8StatDex : 1,
		lv11AC : 1,
		lv12StatWis : 1,
		lv12StatDex : 1,
		lv15AC : 1,
		lv16StatWis : 1,
		lv16StatDex : 1,
		lv19StatWis : 1,
		lv19StatDex : 1
	},
	pokemonSavingThrows :
	{
		savingThrow1 : "dex",
		savingThrow2 : "wis"
	},
	pokemonBaseMoves :
	{
		move1 : "Tail Whip",
		move2 : "Thunder Shock"
	}
	// Put Level Up Moves here
}
	
var _jsonString = json_stringify(_pokemonStarterPikachu);
var _jsonBuffer = buffer_create(string_byte_length(_jsonString) + 1, buffer_fixed, 1); 
buffer_write(_jsonBuffer, buffer_string, _jsonString);
buffer_save(_jsonBuffer, "Pikachu.Pokemon");
buffer_delete(_jsonBuffer);*/
// Shaun Spalding ^

//show_debug_message("Data Saved - " + _jsonString);


#endregion

#region Decode Test
/*

var _jsonFile = file_text_open_read(working_directory + "PikachuV2.json"); // This works on loading the json file
var _jsonData = "";
while (!file_text_eof(_jsonFile))
{
	_jsonData += file_text_read_string(_jsonFile);
	file_text_readln(_jsonFile);
}
var _jsonParse = json_decode(_jsonData);

show_debug_message(_jsonParse);

// Try and Finish this after break/lunch

var _pikachuCoreStats = ds_map_find_value(_jsonParse, "pokemonCoreStats");
var _statsSize = ds_map_size(_pikachuCoreStats);
var _versionTest = ds_map_read("version");

show_debug_message(_pikachuCoreStats);
show_debug_message(_statsSize);
show_debug_message(_versionTest);
*/
#endregion

#region Shaun Way

global.pokemonPlayer = [];
enum enumTest
{
	//
}

if (file_exists("PikachuV2.json"))
{
	var _buffer = buffer_load("PikachuV2.json");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _loadData = json_parse(_string);
	
	show_debug_message(_loadData);
	
	while (array_length(_loadData) >= 0)
	{
		var _loadStats = array_pop(_loadData);
		global.pokemonPlayer[array_length(_loadData)] = _loadStats;
	}
}

//show_debug_message(global.pokemonPlayer[0]);

#endregion