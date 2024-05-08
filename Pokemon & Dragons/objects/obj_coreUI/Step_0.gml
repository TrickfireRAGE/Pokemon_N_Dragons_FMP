/// @description 

switch (room)
{
	case(rm_battleRoom):
		switch (global.gameState)
		{
			case(enumGameState.level1Battle):
				switch (global.battleState)
				{
					case(enumBattleState.introSequence):
						if (alarm_get(enumCoreUIAlarms.sequences) > 0)
						{
							//Code here
						}
						else
						{
							alarm_set(enumCoreUIAlarms.sequences, 1);
						}
						break;
					case(enumBattleState.menu):
						//type here
						break;
					case(enumBattleState.move):
						//type here
						break;
					case(enumBattleState.opponent):
						// type here
						break;
				}
		}
		break;
}
