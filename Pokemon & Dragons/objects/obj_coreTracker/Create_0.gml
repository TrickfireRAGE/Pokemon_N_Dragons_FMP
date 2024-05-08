/// @description Battle Tracker Creation

// fully clean up and fix

enum enumTrackerArray
{
	ID = 0,
	name = 1,
	dexStat = 2,
	dexModifier = 3,
	initiative = 4
}

currentTurn = 0;


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

for (var i = 0; i < global.maxPokemon; i++;) // Player Pokemon Party Initiative
{
	if (pokemonPlayer[i][enumTrackerArray.dexStat] != "NOT_SET")
	{
		
		switch(pokemonPlayer[i][enumTrackerArray.dexStat])
		{
			case(10):
			case(11):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 0;
				break;
			case(12):
			case(13):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 1;
				break
			case(14):
			case(15):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 2;
				break;
			case(16):
			case(17):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 3;
				break;
			case(18):
			case(19):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 4;
				break;
			case(20):
			case(21):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 5;
				break;
			case(22):
			case(23):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 6;
				break;
			case(24):
			case(25):
				pokemonPlayer[i][enumTrackerArray.dexModifier] = 7;
				break;
		}
		pokemonPlayer[i][enumTrackerArray.initiative] = funct_initiativeRoll(pokemonPlayer[i][enumTrackerArray.dexModifier]);
		//ds_list_add(pokemonInitiativeData, pokemonPlayer[i][enumTrackerArray.name]);
		ds_list_add(pokemonInitiativeData, pokemonPlayer[i][enumTrackerArray.initiative]);
	}
	else
	{
		pokemonPlayer[i][enumTrackerArray.dexModifier] = "NOT_SET";
	}
}

for (var i = 0; i < global.maxPokemon; i++;) // Opponent Pokemon Party Initiative
{
	if (pokemonOpponent[i][enumTrackerArray.dexStat] != "NOT_SET")
	{
		
		switch(pokemonOpponent[i][enumTrackerArray.dexStat])
		{
			case(10):
			case(11):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 0;
				break;
			case(12):
			case(13):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 1;
				break
			case(14):
			case(15):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 2;
				break;
			case(16):
			case(17):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 3;
				break;
			case(18):
			case(19):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 4;
				break;
			case(20):
			case(21):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 5;
				break;
			case(22):
			case(23):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 6;
				break;
			case(24):
			case(25):
				pokemonOpponent[i][enumTrackerArray.dexModifier] = 7;
				break;
		}
		pokemonOpponent[i][enumTrackerArray.initiative] = funct_initiativeRoll(pokemonOpponent[i][enumTrackerArray.dexModifier]);
		//ds_list_add(pokemonInitiativeData, pokemonOpponent[i][enumTrackerArray.name]);
		ds_list_add(pokemonInitiativeData, pokemonOpponent[i][enumTrackerArray.initiative]);
	}
	else
	{
		pokemonOpponent[i][enumTrackerArray.dexModifier] = "NOT_SET";
	}
}

ds_list_sort(pokemonInitiativeData, false);

show_message(pokemonPlayer[0][enumTrackerArray.initiative]);
show_message(pokemonOpponent[0][enumTrackerArray.initiative]);
