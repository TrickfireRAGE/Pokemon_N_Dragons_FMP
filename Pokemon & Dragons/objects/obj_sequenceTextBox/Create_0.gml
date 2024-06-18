/// @description ???

textBoxTimer = 0;
stringVariable = " Failed!"; // Only for the Prototype, remove this to have future expandability
attackMoveName = "NOT_SET";
idNumber = "NOT_SET";
var _arrayMoveLength = array_length(global.pokeMoves);

if (global.battleState == enumBattleState.opponent)
{
	if (global.opponentMoveChoice <= 249) // Remembered Advice from Finn (Project 1)
	{
		idNumber = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1ID];
	}
	else if (global.opponentMoveChoice <= 499)
	{
		idNumber = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2ID];
	}
	else if (global.opponentMoveChoice <= 749)
	{
		idNumber = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3ID];
	}
	else
	{
		idNumber = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4ID];
	}
		
	for (var i = 0; i < _arrayMoveLength; i++;)
	{
		if (global.pokeMoves[i][$ "Move ID"] == idNumber) // REMOVE MAGIC NUMBER "0" TO HAVE SYSTEM THAT CHECKS WHICH POKEMON IT IS
		{
			attackMoveName = global.pokeMoves[i][$ "Move Name"];
			i = _arrayMoveLength + 1;
		}
	}
}
else if (global.battleState == enumBattleState.playerAttack)
{
	switch(global.playerChoiceAttack)
	{
		case(enumPlayerAttack.attack1):
			idNumber = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1ID];
			break;
		case(enumPlayerAttack.attack2):
			idNumber = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2ID];
			break;
		case(enumPlayerAttack.attack3):
			idNumber = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3ID];
			break;
		case(enumPlayerAttack.attack4):
			idNumber = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4ID];
			break;
	}
	for (var i = 0; i < _arrayMoveLength; i++;)
	{
		if (global.pokeMoves[i][$ "Move ID"] == idNumber) // REMOVE MAGIC NUMBER "0" TO HAVE SYSTEM THAT CHECKS WHICH POKEMON IT IS
		{
			attackMoveName = global.pokeMoves[i][$ "Move Name"];
			i = _arrayMoveLength + 1;
		}
	}
	
}

