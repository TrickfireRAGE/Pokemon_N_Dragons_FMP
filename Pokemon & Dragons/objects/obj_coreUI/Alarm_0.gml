/// @description Sequences

switch (global.gameState)
{
	case(enumGameState.level1Battle):
		if (layer_sequence_is_finished(sequenceID) == true)
		{
			layer_sequence_destroy(sequenceID);
			battleVisualState = enumBattleVisualState.menu;
		}
		break;
}
