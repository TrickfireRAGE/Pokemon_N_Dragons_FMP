/// @description Move Alarm

//var _whichAttack = "NOT_SET";
var _actionBonus = "NOT_SET";
var _whichAttackEnumID = "NOT_SET";
var _whichAttackEnumPP = "NOT_SET";
attackNonCheck = "NOT_SET"; // Made into Object Variable instead of local due to need of access in step event

global.battleState = enumBattleState.playerAttack;

switch (global.playerChoiceAttack)
{
	case(enumPlayerAttack.attack1):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1Point]; // Temp Solution
		attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move1ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move1PP;
		break;
	case(enumPlayerAttack.attack2):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2Point];
		attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move2ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move2PP;
		break;
	case(enumPlayerAttack.attack3):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3Point];
		attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move3ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move3PP;
		break;
	case(enumPlayerAttack.attack4):
		_actionBonus = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4Point];
		attackNonCheck = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4AoN];
		_whichAttackEnumID = enumPokemonPartyMoves.move4ID;
		_whichAttackEnumPP = enumPokemonPartyMoves.move4PP;
		break;
}

if (attackNonCheck == "Attack")
{
	global.moveReturnArray = funct_attack(global.pokeMoves, // Seems to work on a basic level for now. (Does do a basic change of HP, No PP/Bonus/Action removal)
		obj_playerPokemon.pokemonPartyMoves[0][_whichAttackEnumID], 
		global.pokemonLevelSet, 
		obj_opponentPokemon.pokemonParty[0][enumPokemonArray.AC],
		obj_opponentPokemon.pokemonParty[0][enumPokemonArray.type],
		obj_playerPokemon.pokemonParty[0][enumPokemonArray.type],
		obj_playerPokemon.pokemonParty, // Implement this here once the update to the parent pokemon is done.
		0,
		global.playerSideEffectArray,
		global.opponentSideEffectArray); // Magic number for ease of building
		
	obj_playerPokemon.pokemonPartyMoves[0][_whichAttackEnumPP] -= 1;
	if (global.moveReturnArray[enumAttackFunction.result] == "FAIL")			// Using Magic Number to ensure working due to only one pokemon.
	{
		global.attackIDRoll = funct_diceVisual(global.moveReturnArray[enumAttackFunction.baseDice], 
			room_width / 2, room_height / 2,
			global.moveReturnArray[enumAttackFunction.diceModifier], 
			global.moveReturnArray[enumAttackFunction.diceOrSave]);
			// expand the fail code
	}
	else if (global.moveReturnArray[enumAttackFunction.result] == 0)
	{
		// put no effect here
	}
	else if (global.moveReturnArray[enumAttackFunction.baseDice] == "ALWAYS_HITS")
	{
		// Put the code for the rest without needing to show the D20 dice
	}
	else
	{
		global.attackIDRoll = funct_diceVisual(global.moveReturnArray[enumAttackFunction.baseDice], 
			room_width / 2, room_height / 2,
			global.moveReturnArray[enumAttackFunction.diceModifier], 
			global.moveReturnArray[enumAttackFunction.diceOrSave]);
	}
}
else if (attackNonCheck == "Non-Attack")
{
	var _nonAttack = "NOT_SET";
	_nonAttack = funct_nonAttack(global.pokeMoves, 
		obj_playerPokemon.pokemonPartyMoves[0][_whichAttackEnumID],
		global.pokemonLevelSet, obj_opponentPokemon.pokemonParty, 
		obj_playerPokemon.pokemonParty, 0, false);
	obj_playerPokemon.pokemonPartyMoves[0][_whichAttackEnumPP] -= 1;
	if (_nonAttack == false)
	{
		// Put fail code here
	}
	else
	{
		switch (_nonAttack[enumNonAttackFunction.sideWho])
		{
			case ("Self"):
				global.playerSideEffectArray[enumNonAttackFunction.sideAffected] = _nonAttack[enumNonAttackFunction.sideAffected];
				global.playerSideEffectArray[enumNonAttackFunction.sideModifier] = _nonAttack[enumNonAttackFunction.sideModifier];
				global.playerSideEffectArray[enumNonAttackFunction.sideDuration] = _nonAttack[enumNonAttackFunction.sideDuration];
				break;
			case ("Opponent"):
				global.opponentSideEffectArray[enumNonAttackFunction.sideAffected] = _nonAttack[enumNonAttackFunction.sideAffected];
				global.opponentSideEffectArray[enumNonAttackFunction.sideModifier] = _nonAttack[enumNonAttackFunction.sideModifier];
				global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] = _nonAttack[enumNonAttackFunction.sideDuration];
				break;
		}
	}
	
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



