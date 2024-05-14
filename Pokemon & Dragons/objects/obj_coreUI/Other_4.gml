/// @description

switch (room)
{
	case(rm_battleRoom):
		var _layerID = layer_get_id("Background"); // For Background
		var _backgroundID = layer_background_get_id(_layerID); // For Background
		switch (global.gameState)
		{
			case(enumGameState.level1Battle):
				// Background Code
				if (layer_background_get_sprite(_backgroundID) != spr_battleBackgroundLevel1)
				{
					layer_background_sprite(_backgroundID, spr_battleBackgroundLevel1);
				}
				
				break;
			case(enumGameState.endGameBattle):
				// Background Code
				if (layer_background_get_sprite(_backgroundID) != spr_battleBackgroundEndGame)
				{
					layer_background_sprite(_backgroundID, spr_battleBackgroundEndGame);
				}
		}
		break;
}

