/// @description 

switch (global.battleState)
{
	case(enumBattleState.introSequence):
		if (layer_sequence_is_finished(global.sequenceID) == true) // To make the object in battle visible after sequence
		{
			image_alpha = 1;
		}
		break;
		
}
