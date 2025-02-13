/// @description Used for State Switches
switch (room)
{
	case(rm_titleMenu):
		switch (global.menuState)
		{
			case(enumTitleScreenState.pressStart):
				global.menuState = enumTitleScreenState.mainMenu;
				break;
			case(enumTitleScreenState.mainMenu):
				if (global.titleScreenOptions == enumMainMenuChoice.newGame)
				{
					global.newGameMenuState = enumNewGameState.newGame;
					global.menuState = enumTitleScreenState.newGame;
				}
				else if (global.titleScreenOptions == enumMainMenuChoice.continueSave)
				{
					// Put code here when save system is implemented
				}
				break;
		}
	case(rm_battleRoom):
		switch (global.battleState)
		{
			case(enumBattleState.introSequence):
				if (layer_sequence_is_finished(global.sequenceID) == true)
				{
					layer_sequence_destroy(global.sequenceID);
					global.battleState = enumBattleState.intermission;
				}
				break;
			case(enumBattleState.playerAttack): 
				if (layer_sequence_is_finished(global.moveIDSequence) == true)
				{
					layer_sequence_destroy(global.moveIDSequence);
					global.moveIDSequence = "NOT_SET";
					global.battleState = enumBattleState.player;
				}
				break;
			case(enumBattleState.opponent):
				if (layer_sequence_is_finished(global.moveIDSequence) == true)
				{
					layer_sequence_destroy(global.moveIDSequence);
					global.moveIDSequence = "NOT_SET";
					global.opponentStageBattle = enumOpponentStages.endTurn;
				}
				break;
		}
		break;
}




