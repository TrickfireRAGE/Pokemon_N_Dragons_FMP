/// @description 
switch (global.battleState)
{
	case(enumBattleState.initiative):
		#region Sequence
		if (firstTurn == "NOT_SET")
		{
			var _current = ds_list_find_value(pokemonInitiativeData, currentTurn);
			if (_current == pokemonPlayer[0][enumTrackerArray.initiative])
			{
				firstTurn = pokemonPlayer[0][enumTrackerArray.ID];
			}
			else if (_current == pokemonOpponent[0][enumTrackerArray.initiative])
			{
				firstTurn = pokemonOpponent[0][enumTrackerArray.ID];
			}
		}
		else
		{
			// Type here
		}
		#endregion
		break;
	case(enumBattleState.player):
		if (global.playerBattleState == enumPlayerTurnState.endTurnSelection)
		{
			currentTurn += 1;
			global.battleState = enumBattleState.intermission;
		}
		break;
	case(enumBattleState.intermission):
		if (currentTurn < ds_list_size(pokemonInitiativeData)) // Needs to be reworked for the two pokemon on the field if there is multiple pokemon on a team
		{
			var _current = ds_list_find_value(pokemonInitiativeData, currentTurn);
			var _charName = "NOT_SET"
			for (var i = 0; i < global.maxPokemon; i++;)
			{
				if (_current == pokemonPlayer[i][enumTrackerArray.initiative])
				{
					#region Player Initiative Check
					_charName = pokemonPlayer[i][enumTrackerArray.name];
					i = global.maxPokemon;
					global.playerChoiceBattle = enumBattleChoices.attack;
					global.playerBattleState = enumPlayerTurnState.baseMenu; // Missed this line which caused choices not to work
					global.playerActionPoint = 1; // Magic Number for the Prototype as there will only be one of each until later versions
					global.playerBonusPoint = 1; // ^
					if (global.playerSideEffectArray[enumNonAttackFunction.sideDuration] == "NOT_SET")
					{
						global.battleState = enumBattleState.player;
					}
					else if (global.playerSideEffectArray[enumNonAttackFunction.sideDuration] > 0)
					{
						global.playerSideEffectArray[enumNonAttackFunction.sideDuration] -= 1;
						global.battleState = enumBattleState.player;
					}
					else if (global.playerSideEffectArray[enumNonAttackFunction.sideDuration] == 0)
					{
						global.playerSideEffectArray[enumNonAttackFunction.sideDuration] = "NOT_SET";
						global.playerSideEffectArray[enumNonAttackFunction.sideAffected] = "NOT_SET";
						global.playerSideEffectArray[enumNonAttackFunction.sideModifier] = "NOT_SET";
						global.battleState = enumBattleState.player;
					}
					#endregion
				}
				else if (_current == pokemonOpponent[i][enumTrackerArray.initiative])
				{
					#region Opponenet Initiative Check
					_charName = pokemonOpponent[i][enumTrackerArray.name];
					i = global.maxPokemon;
					global.opponentStageBattle = enumOpponentStages.loading;
					if (global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] == "NOT_SET")
					{
						global.battleState = enumBattleState.opponent;
					}
					else if (global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] > 0)
					{
						global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] -= 1;
						global.battleState = enumBattleState.opponent;
					}
					else if (global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] == 0)
					{
						global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] = "NOT_SET";
						global.opponentSideEffectArray[enumNonAttackFunction.sideModifier] = "NOT_SET";
						global.opponentSideEffectArray[enumNonAttackFunction.sideAffected] = "NOT_SET";
						global.battleState = enumBattleState.opponent;
					}
					#endregion
				}
			}
		}
		else
		{
			currentTurn = 0;
		}
		break;
	case(enumBattleState.opponent):
		if (global.opponentStageBattle == enumOpponentStages.endTurn)
		{
			currentTurn += 1;
			global.battleState = enumBattleState.intermission;
		}
		break;
}