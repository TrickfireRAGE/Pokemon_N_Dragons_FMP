/// @description 

enum enumPokemonArray
{
	ID = 0,
	name = 1, 
	sound = 2,
	str = 3,
	dex = 4,
	con = 5,
	int = 6,
	wis = 7
}

pokemonParty = []; // Used to store all the stats of the Pokemon's Party

if (object_index == obj_playerPokemon)
{
	for (var i = 0; i < global.maxPokemon; i++;)
	{
		pokemonParty[i][enumPokemonArray.ID] = global.playerPokemonID[i];
	}
}
else
{
	for (var i = 0; i < global.maxPokemon; i++;)
	{
		pokemonParty[i][enumPokemonArray.ID] = global.opponentPokemonID[i];
	}
}

for (var i = 0; i < global.maxPokemon; i++)
{
	if (pokemonParty[i][enumPokemonArray.ID] != "NOT_SET")
	{
		pokemonParty[i][enumPokemonArray.name] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Pokemon Name"];
		pokemonParty[i][enumPokemonArray.sound] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Sound Cry"];
	}
}

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
_arrayStringStats[enumPokemonArray.str] = "Str";
_arrayStringStats[enumPokemonArray.dex] = "Dex";
_arrayStringStats[enumPokemonArray.con] = "Con";
_arrayStringStats[enumPokemonArray.int] = "Int";
_arrayStringStats[enumPokemonArray.wis] = "Wis";

for (var i = 0; i < global.maxPokemon; i++;)
{
	if (pokemonParty[i][enumPokemonArray.ID] != "NOT_SET")
	{
		switch (global.pokemonLevelSet)
		{
			case(1): // Level 1 to 3 (Base Stats)
			case(2):
			case(3):
			for (var f = enumPokemonArray.str; f <= enumPokemonArray.wis; f++;)
			{
				pokemonParty[i][f] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Base " + _arrayStringStats[f]];
			}
			break;
			case(4): // Level 4 to 7 (LV 4 Stats)
			case(5):
			case(6):
			case(7):
			for (var f = enumPokemonArray.str; f <= enumPokemonArray.wis; f++;)
			{
				pokemonParty[i][f] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "LV4 " + _arrayStringStats[f]];
			}
			break;
			case(8): // Level 8 to 11 (LV 8 Stats)
			case(9):
			case(10):
			case(11):
			for (var f = enumPokemonArray.str; f <= enumPokemonArray.wis; f++;)
			{
				pokemonParty[i][f] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "LV8 " + _arrayStringStats[f]];
			}
			break;
			case(12): // Level 12 to 15 (LV 12 Stats)
			case(13):
			case(14):
			case(15):
			for (var f = enumPokemonArray.str; f <= enumPokemonArray.wis; f++;)
			{
				pokemonParty[i][f] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "LV12 " + _arrayStringStats[f]];
			}
			break;
			case(16): // Level 16 to 18 (LV 16 Stats)
			case(17):
			case(18):
			for (var f = enumPokemonArray.str; f <= enumPokemonArray.wis; f++;)
			{
				pokemonParty[i][f] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "LV16 " + _arrayStringStats[f]];
			}
			break;
			case(19): // Level 19 to 20 (LV 19 Stats)
			case(20):
			for (var f = enumPokemonArray.str; f <= enumPokemonArray.wis; f++;)
			{
				pokemonParty[i][f] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "LV19 " + _arrayStringStats[f]];
			}
			break;
		}
	}
	else
	{
		for (var f = enumPokemonArray.name; f <= enumPokemonArray.wis; f++;)
		{
			pokemonParty[i][f] = "NOT_SET";
		}
	}
}


snd_opponentPokemon = asset_get_index(pokemonParty[0][enumPokemonArray.sound]);

sprite_index = asset_get_index(global.pokeDex[pokemonParty[0][enumPokemonArray.ID]][$ "Sprite Name"]);
