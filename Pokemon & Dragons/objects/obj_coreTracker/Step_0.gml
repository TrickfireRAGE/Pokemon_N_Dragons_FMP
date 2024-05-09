/// @description 
switch (global.battleState)
{
	case(enumBattleState.introSequence):
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
					_charName = pokemonPlayer[i][enumTrackerArray.name];
					i = global.maxPokemon;
					global.playerChoiceBattle = enumBattleChoices.attack;
					global.playerBattleState = enumPlayerTurnState.baseMenu; // Missed this line which caused choices not to work
					global.battleState = enumBattleState.player;
				}
				else if (_current == pokemonOpponent[i][enumTrackerArray.initiative])
				{
					_charName = pokemonOpponent[i][enumTrackerArray.name];
					i = global.maxPokemon;
					global.opponentStageBattle = enumOpponentStages.action;
					global.battleState = enumBattleState.opponent;
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