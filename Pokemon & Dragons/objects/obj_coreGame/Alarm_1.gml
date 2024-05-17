/// @description Move Alarm

//var _whichAttack = "NOT_SET";
var _actionBonus = "NOT_SET";
var _whichAttackEnumID = "NOT_SET";
var _whichAttackEnumPP = "NOT_SET";
var _attackNonCheck = "NOT_SET";

global.battleState = enumBattleState.playerAttack;

switch (global.playerChoiceAttack)
{
	case(enumPlayerAttack.attack1):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1Point]; // Temp Solution
		_attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move1ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move1PP;
		break;
	case(enumPlayerAttack.attack2):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2Point];
		_attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move2ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move2PP;
		break;
	case(enumPlayerAttack.attack3):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3Point];
		_attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move3ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move3PP;
		break;
	case(enumPlayerAttack.attack4):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4Point];
		_attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move4ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move4PP;
		break;
}

if (_attackNonCheck == "Attack")
{
	global.moveReturnArray = funct_attack(global.pokeMoves, // Seems to work on a basic level for now. (Does do a basic change of HP, No PP/Bonus/Action removal)
		obj_playerPokemon.pokemonPartyMoves[0][_whichAttackEnumID], 
		global.pokemonLevelSet, 
		obj_opponentPokemon.pokemonParty[0][enumPokemonArray.AC],
		obj_opponentPokemon.pokemonParty[0][enumPokemonArray.type],
		obj_playerPokemon.pokemonParty[0][enumPokemonArray.type],
		obj_playerPokemon.pokemonParty); // Implement this here once the update to the parent pokemon is done.
		
	obj_playerPokemon.pokemonPartyMoves[0][_whichAttackEnumPP] -= 1;
	if (global.moveReturnArray[enumAttackFunction.result] == "FAIL")			// Using Magic Number to ensure working due to only one pokemon.
	{
		global.attackIDRoll = funct_diceVisual(global.moveReturnArray[enumAttackFunction.baseDice], 
			room_width / 2, room_height / 2,
			global.moveReturnArray[enumAttackFunction.diceModifier], 
			global.moveReturnArray[enumAttackFunction.diceOrSave]);
	}
	else if (global.moveReturnArray[enumAttackFunction.result] == 0)
	{
		// put no effect here
	}
	else
	{
		global.attackIDRoll = funct_diceVisual(global.moveReturnArray[enumAttackFunction.baseDice], 
			room_width / 2, room_height / 2,
			global.moveReturnArray[enumAttackFunction.diceModifier], 
			global.moveReturnArray[enumAttackFunction.diceOrSave]);
		// Put Damage Dice Code here
		var _damage = string(global.moveReturnArray[enumAttackFunction.result]);
		var _effectiveness = string(global.moveReturnArray[enumAttackFunction.effectiveness]);
		show_message(_damage);
		show_message(_effectiveness);
		obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP] -= _damage;
	}
}
else if (_attackNonCheck == "Non-Attack")
{
	// Put Non Attack Code here
}

// Point Removal
switch (_actionBonus)
{
	case("Action"):
		global.playerActionPoint -= 1;
		break;
	case("Bonus"):
		global.playerBonusPoint -= 1;
		break;
}



