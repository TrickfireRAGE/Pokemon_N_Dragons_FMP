/// @description 

switch (global.battleState)
{
	case(enumBattleState.introSequence):
		if (layer_sequence_is_finished(global.sequenceID) == true)
		{
			image_alpha = 1;
		}
		break;
}
