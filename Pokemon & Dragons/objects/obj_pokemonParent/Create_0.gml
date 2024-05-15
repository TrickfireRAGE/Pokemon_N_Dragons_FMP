/// @description THIS NEEDS TO BE CLEANED UP!

enum enumPokemonArray
{
	ID = 0,
	name = 1, 
	sound = 2,
	str = 3,
	dex = 4,
	con = 5,
	int = 6,
	wis = 7,
	maxHP = 8,
	currentHP = 9
}

enum enumPokemonPartyMoves
{
	pokemonID = 0,
	move1ID = 1,
	move1PP = 2,
	move2ID = 3,
	move2PP = 4,
	move3ID = 5,
	move3PP = 6,
	move4ID = 7,
	move4PP = 8
}

pokemonParty = []; // Used to store all the stats of the Pokemon's Party
pokemonPartyMoves1 = []; // Alternative system in mind to replace partymoves to get as much info in without constantly checking JSON file.
pokemonPartyMoves2 = [];
pokemonPartyMoves3 = [];
pokemonPartyMoves4 = [];
pokemonPartyMoves = []; // Used to store all battle moves for the game + PP (NEED TO IMPLEMENT THIS CORRECTLY)

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

for (var i = 0; i < global.maxPokemon; i++;)
{
	if (pokemonParty[i][enumPokemonArray.ID] != "NOT_SET")
	{
		var _hitDice = 8;
		var _conModifier = funct_modifierCheck(pokemonParty[i][enumPokemonArray.con]);
		var _baseHP = _conModifier + _hitDice;
		var _hitDiceAddition = 0;
		for (var i = global.pokemonLevelSet - 1; i > 0; i--)
		{
			_hitDiceAddition += (funct_diceRoll(_hitDice) + _conModifier);
		}
		pokemonParty[i][enumPokemonArray.maxHP] = _baseHP + _hitDiceAddition;
		pokemonParty[i][enumPokemonArray.currentHP] = pokemonParty[i][enumPokemonArray.maxHP]; // Only necessary for the Prototype
	}
	else
	{
		pokemonParty[i][enumPokemonArray.maxHP] = "NOT_SET";
		pokemonParty[i][enumPokemonArray.currentHP] = "NOT_SET";
	}
}

for (var i = 0; i < global.maxPokemon; i++;) // Works somewhat, adapt once save file is in + update this to work with End Game, have all info imported if possible
{
	if (pokemonParty[i][enumPokemonArray.ID] != "NOT_SET")
	{
		var _counter = 0;
		pokemonPartyMoves[i][enumPokemonPartyMoves.pokemonID] = pokemonParty[i][enumPokemonArray.ID];
		for (var f = enumPokemonPartyMoves.move1ID; f <= enumPokemonPartyMoves.move4ID; f += 2;)
		{
			var _struct = global.pokeDex[pokemonPartyMoves[i][enumPokemonPartyMoves.pokemonID]][$ "LV1 Battle Moves"];
			show_message(_struct[_counter]);
			pokemonPartyMoves[i][f] = _struct[_counter]; //
			var _arraySize = array_length(global.pokeMoves) - 1;
			for (var v = 0; v <= _arraySize; v++)
			{
				if (global.pokeMoves[v][$ "Move ID"] == pokemonPartyMoves[i][f])
				{
					pokemonPartyMoves[i][f + 1] = global.pokeMoves[v][$ "PP"];
					v = _arraySize + 1;
				}
			}
			_counter++;
		}
	}
	else
	{
		for (var f = enumPokemonPartyMoves.move1ID; f <= enumPokemonPartyMoves.move4ID; f += 2;)
		{
			pokemonPartyMoves[i][f] = "NOT_SET";
			pokemonPartyMoves[i][f + 1] = "NOT_SET";
		}
	}
}

sprite_index = asset_get_index(global.pokeDex[pokemonParty[0][enumPokemonArray.ID]][$ "Sprite Name"]);
image_alpha = 0; // Put at zero due to the sequence