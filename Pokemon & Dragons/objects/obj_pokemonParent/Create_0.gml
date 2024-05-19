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
	currentHP = 9,
	AC = 10,
	type = 11,
	savingThrow1 = 12,
	savingThrow2 = 13
}

enum enumPokemonPartyMoves
{
	pokemonID = 0,
	move1ID = 1,
	move1PP = 2,
	move1Point = 3,
	move1AoN = 4,
	move1Sprite = 5, 
	move1Sound = 6,
	move2ID = 7,
	move2PP = 8,
	move2Point = 9,
	move2AoN = 10,
	move2Sprite = 11, 
	move2Sound = 12,
	move3ID = 13,
	move3PP = 14,
	move3Point = 15,
	move3AoN = 16,
	move3Sprite = 17,
	move3Sound = 18,
	move4ID = 19,
	move4PP = 20,
	move4Point = 21,
	move4AoN = 22,
	move4Sprite = 23,
	move4Sound = 24
}


pokemonParty = []; // Used to store all the stats of the Pokemon's Party
pokemonPartyMoves = []; // Used to store all battle moves for the game, PP, Action/Bonus, Attack/Non-Attack (NEED TO IMPLEMENT THIS CORRECTLY)

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
	if (pokemonParty[i][enumPokemonArray.ID] != "NOT_SET") // Sets all the base stuff
	{
		pokemonParty[i][enumPokemonArray.name] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Pokemon Name"];
		pokemonParty[i][enumPokemonArray.sound] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Sound Cry"];
		pokemonParty[i][enumPokemonArray.type] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Type"]; // Expand to 2 in future builds.
		pokemonParty[i][enumPokemonArray.savingThrow1] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Saving Throw 1"];
		pokemonParty[i][enumPokemonArray.savingThrow2] = global.pokeDex[pokemonParty[i][enumPokemonArray.ID]][$ "Saving Throw 2"];
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
_arrayStringStats[enumPokemonArray.str] = "Str"; // Sets string so it doesn't need to be repeated in stat loader below.
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

for (var i = 0; i < global.maxPokemon; i++;) // HP Code (Prototype design) + AC
{
	if (pokemonParty[i][enumPokemonArray.ID] != "NOT_SET")
	{
		// HP
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
		// Prototype only code! (Remove in future when a better implementation is done.
		if (pokemonParty[i][enumPokemonArray.ID] == 491) // Darkrai Health Increase, done as a temp measure to make him stronger.
		{
			pokemonParty[i][enumPokemonArray.maxHP] = 500;
			pokemonParty[i][enumPokemonArray.currentHP] = 500;
		}
		if (global.pokemonLevelSet == 1) // For level one for now due to very low health and needing of changing the current system
		{
			pokemonParty[i][enumPokemonArray.maxHP] = 20;
			pokemonParty[i][enumPokemonArray.currentHP] = 20;
		}
		
		// AC
		var _acBase = 10;
		var _acModifier = funct_modifierCheck(pokemonParty[i][enumPokemonArray.dex]);
		var _acFull = _acBase + _acModifier;
		pokemonParty[i][enumPokemonArray.AC] = _acFull;
		if (pokemonParty[i][enumPokemonArray.ID] == 491) // Darkrai AC Increase, done as a temp measure to make him stronger.
		{
			pokemonParty[i][enumPokemonArray.AC] = 17;
		}
	}
	else
	{
		pokemonParty[i][enumPokemonArray.maxHP] = "NOT_SET";
		pokemonParty[i][enumPokemonArray.currentHP] = "NOT_SET";
		pokemonParty[i][enumPokemonArray.AC] = "NOT_SET";
	}
}

for (var i = 0; i < global.maxPokemon; i++;) // Half broken move loader (Due to the Zero issue that arises when trying to access data later on.) (NEEDS CLEAN UP!!!!!!!)
{		// Works with new update to have the time/action point implemented when loading it into the game, magic numbers are still being used. Remove in future builds.
	if (pokemonParty[i][enumPokemonArray.ID] != "NOT_SET")
	{
		var _counter = 0;
		pokemonPartyMoves[i][enumPokemonPartyMoves.pokemonID] = pokemonParty[i][enumPokemonArray.ID]; 
		
		for (var f = enumPokemonPartyMoves.move1ID; f <= enumPokemonPartyMoves.move4ID; f += 6;)
		{
			var _struct = "NOT_SET";
			if (global.pokemonLevelSet == 1)
			{
				_struct = global.pokeDex[pokemonPartyMoves[i][enumPokemonPartyMoves.pokemonID]][$ "LV1 Battle Moves"]; // TEMP SOLUTION FOR PROTOTYPE (Due to no Save System)
			}
			else if (global.pokemonLevelSet == 20)
			{
				_struct = global.pokeDex[pokemonPartyMoves[i][enumPokemonPartyMoves.pokemonID]][$ "LV20 Battle Moves"]; // TEMP SOLUTION FOR PROTOTYPE (Due to no Save System)
			}
			pokemonPartyMoves[i][f] = _struct[_counter]; // Temp Solution
			var _arraySize = array_length(global.pokeMoves) - 1;
			for (var v = 0; v <= _arraySize; v++)
			{
				if (global.pokeMoves[v][$ "Move ID"] == pokemonPartyMoves[i][f])
				{
					pokemonPartyMoves[i][f + 1] = global.pokeMoves[v][$ "PP"];
					pokemonPartyMoves[i][f + 2] = global.pokeMoves[v][$ "Time"];
					pokemonPartyMoves[i][f + 3] = global.pokeMoves[v][$ "Attack Type"];
					pokemonPartyMoves[i][f + 4] = global.pokeMoves[v][$ "Move Sprite"];
					pokemonPartyMoves[i][f + 5] = global.pokeMoves[v][$ "Move Sound Effect"];
					v = _arraySize + 1;
				}
			}
			_counter++;
		}
	}
	else
	{
		// Put old Not Set Code here later if needed
	}
}

sprite_index = asset_get_index(global.pokeDex[pokemonParty[0][enumPokemonArray.ID]][$ "Sprite Name"]);
image_alpha = 0; // Put at zero due to the sequence