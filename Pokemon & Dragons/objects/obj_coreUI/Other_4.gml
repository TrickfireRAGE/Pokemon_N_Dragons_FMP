/// @description

switch (room)
{
	case(rm_battleRoom):
		var _xPosition = 128;
		var _yPosition = 72;
		global.battleState = enumBattleState.introSequence;
		global.sequenceID = layer_sequence_create("sequenceLayer", _xPosition, _yPosition, seq_startBattleSequence);
		switch (global.gameState)
		{
			case(enumGameState.level1Battle):
				// Background Code
				var _layerID = layer_get_id("Background");
				var _backgroundID = layer_background_get_id(_layerID);
				if (layer_background_get_sprite(_backgroundID) != spr_battleBackgroundLevel1)
				{
					layer_background_sprite(_backgroundID, spr_battleBackgroundLevel1);
				}
				
				break;
			case(enumGameState.endGameBattle):
				// Background Code
				var _layerID = layer_get_id("Background");
				var _backgroundID = layer_background_get_id(_layerID);
				if (layer_background_get_sprite(_backgroundID) != spr_battleBackgroundEndGame)
				{
					layer_background_sprite(_backgroundID, spr_battleBackgroundEndGame);
				}
		}
		break;
}

