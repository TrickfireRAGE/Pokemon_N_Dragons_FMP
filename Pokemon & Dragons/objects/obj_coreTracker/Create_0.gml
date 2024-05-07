/// @description Battle Tracker Creation

// 
currentTurn = 0;

var _battleLevel = global.pokemonLevelSet;

var _pokemonPlayer = global.playerPokemonID[0];
var _pokemonPlayerName = global.pokeDex[_pokemonPlayer][$ "Pokemon Name"];

var _pokemonOpponent = global.opponentPokemonID;
var _pokemonOpponentName = global.pokeDex[_pokemonOpponent][$ "Pokemon Name"];

playerPokemonDex = obj_playerPokemon.firstPokemonStats[enumBattleStats.dex];
opponentPokemonDex = obj_opponentPokemon.firstPokemonStats[enumBattleStats.dex];

playerModifierDex = "NOT_SET";
opponentModifierDex = "NOT_SET";

pokemonInitiativeData = ds_list_create();

if (playerPokemonDex == 10 or 11) // BROKEN
{
	playerModifierDex = 0;
}
else if (playerPokemonDex == 12 or 13)
{
	playerModifierDex = 1;
}
else if (playerPokemonDex == 14 or 15)
{
	playerModifierDex = 2;
}
else if (playerPokemonDex == 16 or 17)
{
	playerModifierDex = 3;
}
else if (playerPokemonDex == 18 or 19)
{
	playerModifierDex = 4;
}
else if (playerPokemonDex == 20 or 21)
{
	playerModifierDex = 5;
}
else if (playerPokemonDex == 22 or 23)
{
	playerModifierDex = 6;
}
else if (playerPokemonDex == 24 or 25)
{
	playerModifierDex = 7;
}

playerPokemonInitiative = funct_initiativeRoll(playerModifierDex);
ds_list_add(pokemonInitiativeData, _pokemonPlayerName);
ds_list_add(pokemonInitiativeData, playerPokemonInitiative);

if (opponentPokemonDex == 10 or 11) // BROKEN FIX ON DAY 18
{
	opponentModifierDex = 0;
}
else if (opponentPokemonDex == 12 or 13)
{
	opponentModifierDex = 1;
}
else if (opponentPokemonDex == 14 or 15)
{
	opponentModifierDex = 2;
}
else if (opponentPokemonDex == 16 or 17)
{
	opponentModifierDex = 3;
}
else if (opponentPokemonDex == 18 or 19)
{
	opponentModifierDex = 4;
}
else if (opponentPokemonDex == 20 or 21)
{
	opponentModifierDex = 5;
}
else if (opponentPokemonDex == 22 or 23)
{
	opponentModifierDex = 6;
}
else if (opponentPokemonDex == 24 or 25)
{
	opponentModifierDex = 7;
}

opponentPokemonInitiative = funct_initiativeRoll(opponentModifierDex);
ds_list_add(pokemonInitiativeData, _pokemonOpponentName);
ds_list_add(pokemonInitiativeData, opponentPokemonInitiative);

ds_list_sort(pokemonInitiativeData, false);

show_message(playerPokemonInitiative);
show_message(opponentPokemonInitiative);

if (playerPokemonInitiative >= opponentPokemonInitiative)
{
	// type here
}
else if (playerPokemonInitiative < opponentPokemonInitiative)
{
	// type here
}