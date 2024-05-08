/// @description 

if (currentTurn < ds_list_size(pokemonInitiativeData))
{
	// Put Switch here when outside of Sequence
	// Execute the turn for the current character
	var _current = ds_list_find_value(pokemonInitiativeData, currentTurn);
	var _charName = "NOT_SET"
	for (var i = 0; i < global.maxPokemon; i++;)
	{
		if (_current == pokemonPlayer[i][enumTrackerArray.initiative])
		{
			_charName = pokemonPlayer[i][enumTrackerArray.name];
			i = global.maxPokemon;
		}
		else if (_current == pokemonOpponent[i][enumTrackerArray.initiative])
		{
			_charName = pokemonOpponent[i][enumTrackerArray.name];
			i = global.maxPokemon;
		}
	}
	//show_message(_charName);
	// Perform other actions specific to the character
	currentTurn += 1;
}
else
{
	currentTurn = 0;
}