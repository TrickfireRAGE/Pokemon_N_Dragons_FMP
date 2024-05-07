/// @description 

if (currentTurn < ds_list_size(pokemonInitiativeData))
{
	// Execute the turn for the current character
	var _charName = ds_list_find_value(pokemonInitiativeData, currentTurn * 2);
	show_message(_charName);
	// Perform other actions specific to the character
	currentTurn += 1;
}
else
{
	currentTurn = 0;
}