/// @description Background Effect

switch (global.gameState)
{
	case(enumGameState.level1Battle):
		// Type here
		break;
	case(enumGameState.endGameBattle):
		var _randomX = 0;
		var _randomY = 0;
		for (var i = 0; i <= 1; i += 0.01;)
		{
			draw_sprite_ext(spr_battleBackgroundEndGameEffect, 0, 0, 0, 1, 1, 0, c_white, i);
		}
		break;
}

