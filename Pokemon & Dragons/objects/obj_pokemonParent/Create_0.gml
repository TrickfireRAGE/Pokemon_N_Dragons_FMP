/// @description 

if (object_index == obj_playerPokemon)
{
	firstPokemonID = global.playerPokemonID;
}
else
{
	firstPokemonID = global.opponentPokemonID;
}

secondPokemonID = "NOT_SET"; // Implement this POST Prototype
thirdPokemonID = "NOT_SET";

// Temp code here for the purpose of the prototype
switch (global.gameState)
{
	case(enumGameState.story):
		// type here
		break;
	case(enumGameState.level1Battle):
		global.pokemonLevelSet = 1;
		break;
	case(enumGameState.endGameBattle):
		global.pokemonLevelSet = 20;
		break;
}

var _arrayStringStats = [];
_arrayStringStats[enumBattleStats.str] = "Str";
_arrayStringStats[enumBattleStats.dex] = "Dex";
_arrayStringStats[enumBattleStats.con] = "Con";
_arrayStringStats[enumBattleStats.int] = "Int";
_arrayStringStats[enumBattleStats.wis] = "Wis";

firstPokemonStats = [];

if (global.pokemonLevelSet <= 3)
{
	for (var i = 0; i <= enumBattleStats.wis; i++;)
	{
		firstPokemonStats[i] = global.pokeDex[firstPokemonID][$ "Base " + _arrayStringStats[i]];
	}
}
else if (global.pokemonLevelSet <= 7)
{
	for (var i = 0; i <= enumBattleStats.wis; i++;)
	{
		firstPokemonStats[i] = global.pokeDex[firstPokemonID][$ "LV4 " + _arrayStringStats[i]];
	}
}
else if (global.pokemonLevelSet <= 12)
{
	for (var i = 0; i <= enumBattleStats.wis; i++;)
	{
		firstPokemonStats[i] = global.pokeDex[firstPokemonID][$ "LV8 " + _arrayStringStats[i]];
	}
}
else if (global.pokemonLevelSet <= 15)
{
	for (var i = 0; i <= enumBattleStats.wis; i++;)
	{
		firstPokemonStats[i] = global.pokeDex[firstPokemonID][$ "LV12 " + _arrayStringStats[i]];
	}
}
else if (global.pokemonLevelSet <= 18)
{
	for (var i = 0; i <= enumBattleStats.wis; i++;)
	{
		firstPokemonStats[i] = global.pokeDex[firstPokemonID][$ "LV16 " + _arrayStringStats[i]];
	}
}
else
{
	for (var i = 0; i <= enumBattleStats.wis; i++;)
	{
		firstPokemonStats[i] = global.pokeDex[firstPokemonID][$ "LV19 " + _arrayStringStats[i]];
	}
}

sprite_index = asset_get_index(global.pokeDex[firstPokemonID][$ "Sprite Name"]);
