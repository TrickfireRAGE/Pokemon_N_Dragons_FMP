/// @description ???

switch (room)
{
	case(rm_battleRoom):
		global.battleState = enumBattleState.initiative;
		
		var _xPositionPlayer = room_width / 4;
		var _xPositionOpponent = _xPositionPlayer * 3;
		var _yPosition = room_height / 2;
		var _playerDice = obj_coreTracker.pokemonPlayer[0][enumTrackerArray.initiativeDice];
		var _playerModifier = obj_coreTracker.pokemonPlayer[0][enumTrackerArray.dexModifier];
		var _opponentDice = obj_coreTracker.pokemonOpponent[0][enumTrackerArray.initiativeDice];
		var _opponentModifier = obj_coreTracker.pokemonOpponent[0][enumTrackerArray.dexModifier];
					
		global.initiativeID = funct_diceVisual(_playerDice, _xPositionPlayer,
			_yPosition, _playerModifier, enumDiceSize.d20);
		funct_diceVisual(_opponentDice, _xPositionOpponent,
			_yPosition, _opponentModifier, enumDiceSize.d20);
		break;
}
