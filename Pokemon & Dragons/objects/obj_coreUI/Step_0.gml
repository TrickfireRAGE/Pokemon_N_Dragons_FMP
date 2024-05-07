/// @description 

switch (room)
{
	case(rm_battleRoom):
		switch (global.gameState)
		{
			case(enumGameState.level1Battle):
				switch (battleVisualState)
				{
					case(enumBattleVisualState.introSequence):
						if (alarm_get(enumCoreUIAlarms.sequences) > 0)
						{
							//Code here
						}
						else
						{
							alarm_set(enumCoreUIAlarms.sequences, 1);
						}
						break;
					case(enumBattleVisualState.menu):
						//type here
						break;
					case(enumBattleVisualState.move):
						//type here
						break;
					case(enumBattleVisualState.opponent):
						// type here
						break;
				}
		}
		break;
}
