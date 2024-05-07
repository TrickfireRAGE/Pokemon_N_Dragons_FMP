/// @description

switch (room)
{
	case(rm_battleRoom):
		switch (global.gameState)
		{
			case(enumGameState.level1Battle):
				var _xPosition = 128;
				var _yPosition = 72;
				battleVisualState = enumBattleVisualState.introSequence;
				sequenceID = layer_sequence_create("sequenceLayer", _xPosition, _yPosition, seq_level1Battle);
				break;
		}
		break;
}

