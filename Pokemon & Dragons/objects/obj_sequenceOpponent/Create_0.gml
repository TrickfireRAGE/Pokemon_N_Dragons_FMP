/// @description 

enum enumOpponentIndex
{
	rival = 0,
	endGame = 1
}

sprite_index = spr_opponentBattle

switch(global.gameState)
{
	case(enumGameState.level1Battle):
		image_index = enumOpponentIndex.rival;
		break;
	case(enumGameState.endGameBattle):
		image_index = enumOpponentIndex.endGame;
		break;
}
