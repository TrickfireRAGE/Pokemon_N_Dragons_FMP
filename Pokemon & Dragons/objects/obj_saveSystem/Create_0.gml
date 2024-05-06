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

// INI for just settings, JSON for everything else unless it is a console port, have a seperate JSON for that.
#endregion

#region JSON V2

global.pokeDex = undefined;
global.pokeMoves = undefined;
if (file_exists(working_directory + "json_pokeDex.json")) // Checks if the file exits
{
	var json = ""; // To store the data from the Json
	var file = file_text_open_read(working_directory + "json_pokeDex.json"); // An easy local variable to reference
	while (file_text_eof(file) == false) // Will read every line until there is no lines left
	{
		json += file_text_readln(file); // Adds the line to the Json variable
	}
	file_text_close(file); // Need to be closed afterwards to prevent a data leak
	global.pokeDex = json_parse(json); // Parses the data to make it useable for the game
	
	
}
if (file_exists(working_directory + "json_pokeMoves.json"))
{
	var json = ""; // To store the data from the Json
	var file = file_text_open_read(working_directory + "json_pokeMoves.json"); // An easy local variable to reference
	while (file_text_eof(file) == false) // Will read every line until there is no lines left
	{
		json += file_text_readln(file); // Adds the line to the Json variable
	}
	file_text_close(file); // Need to be closed afterwards to prevent a data leak
	global.pokeMoves = json_parse(json); // Parses the data to make it useable for the game
}


show_message(global.pokeDex[25][$ "Pokemon Name"]); // This is how to access the data inside the Json with Struts.
battleStats = []; 
battleStats[enumBattleStats.str] = global.pokeDex[25][$ "Base Str"];
battleStats[enumBattleStats.dex] = global.pokeDex[25][$ "Base Dex"];
battleStats[enumBattleStats.con] = global.pokeDex[25][$ "Base Con"];
battleStats[enumBattleStats.int] = global.pokeDex[25][$ "Base Int"];
battleStats[enumBattleStats.wis] = global.pokeDex[25][$ "Base Wis"];

for (var i = enumBattleStats.str; i <= enumBattleStats.wis; i++;)
{
	show_message(battleStats[i]);
}


#endregion

