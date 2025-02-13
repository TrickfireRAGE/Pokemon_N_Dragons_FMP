/// @description Battle Tracker Creation

// fully clean up and fix

enum enumTrackerArray
{
	ID = 0,
	name = 1,
	dexStat = 2,
	dexModifier = 3,
	initiative = 4,
	initiativeDice = 5
}

currentTurn = 0;

firstTurn = "NOT_SET";

pokemonPlayer = [];

for (var i = 0; i < global.maxPokemon; i++;) 
{
	pokemonPlayer[i][enumTrackerArray.ID] = global.playerPokemonID[i];
	if (pokemonPlayer[i][enumTrackerArray.ID] != "NOT_SET")
	{
		pokemonPlayer[i][enumTrackerArray.name] = obj_playerPokemon.pokemonParty[i][enumPokemonArray.name];
		pokemonPlayer[i][enumTrackerArray.dexStat] = obj_playerPokemon.pokemonParty[i][enumPokemonArray.dex];
	}
	else
	{
		pokemonPlayer[i][enumTrackerArray.name] = "NOT_SET";
		pokemonPlayer[i][enumTrackerArray.dexStat] = "NOT_SET";
	}
}

pokemonOpponent = [];
for (var i = 0; i < global.maxPokemon; i++;)
{
	pokemonOpponent[i][enumTrackerArray.ID] = global.opponentPokemonID[i];
	if (pokemonOpponent[i][enumTrackerArray.ID] != "NOT_SET")
	{
		pokemonOpponent[i][enumTrackerArray.name] = obj_opponentPokemon.pokemonParty[i][enumPokemonArray.name];
		pokemonOpponent[i][enumTrackerArray.dexStat] = obj_opponentPokemon.pokemonParty[i][enumPokemonArray.dex];
	}
	else
	{
		pokemonOpponent[i][enumTrackerArray.name] = "NOT_SET";
		pokemonOpponent[i][enumTrackerArray.dexStat] = "NOT_SET";
	}
}

pokemonInitiativeData = ds_list_create();
// Opponent Pokemon Party Initiative (Goes first to give the player advantage) 
// Consider having initiative rolls just for first 2 Pokemon on field and when switching, a new roll is done.
for (var i = 0; i < global.maxPokemon; i++;) 
{
	if (pokemonOpponent[i][enumTrackerArray.dexStat] != "NOT_SET")
	{
		pokemonOpponent[i][enumTrackerArray.dexModifier] = funct_modifierCheck(pokemonOpponent[i][enumTrackerArray.dexStat]); // Using new Function
		pokemonOpponent[i][enumTrackerArray.initiative] = funct_initiativeRoll(pokemonOpponent[i][enumTrackerArray.dexModifier]);
		pokemonOpponent[i][enumTrackerArray.initiativeDice] = pokemonOpponent[i][enumTrackerArray.initiative] - pokemonOpponent[i][enumTrackerArray.dexModifier]; // NEEDED FOR DICE ROLL
		ds_list_add(pokemonInitiativeData, pokemonOpponent[i][enumTrackerArray.initiative]);
	}
	else
	{
		pokemonOpponent[i][enumTrackerArray.dexModifier] = "NOT_SET";
	}
}

for (var i = 0; i < global.maxPokemon; i++;) // Player Pokemon Party Initiative
{
	if (pokemonPlayer[i][enumTrackerArray.dexStat] != "NOT_SET")
	{
		pokemonPlayer[i][enumTrackerArray.dexModifier] = funct_modifierCheck(pokemonPlayer[i][enumTrackerArray.dexStat]); // Using new Function
		pokemonPlayer[i][enumTrackerArray.initiative] = funct_initiativeRoll(pokemonPlayer[i][enumTrackerArray.dexModifier]); 
		pokemonPlayer[i][enumTrackerArray.initiativeDice] = pokemonPlayer[i][enumTrackerArray.initiative] - pokemonPlayer[i][enumTrackerArray.dexModifier]
		for (var f = 0; f < ds_list_size(pokemonInitiativeData); f++)
		{
			if (ds_list_find_value(pokemonInitiativeData, f) == pokemonPlayer[i][enumTrackerArray.initiative])
			{
				pokemonPlayer[i][enumTrackerArray.initiative] += 1;
			}
		}
		ds_list_add(pokemonInitiativeData, pokemonPlayer[i][enumTrackerArray.initiative]);
	}
	else
	{
		pokemonPlayer[i][enumTrackerArray.dexModifier] = "NOT_SET";
	}
}


ds_list_sort(pokemonInitiativeData, false);
