/// @description Used for Sound Effect State Transitions

switch (global.menuState)
{
	case(enumTitleScreenState.pressStart):
		global.menuState = enumTitleScreenState.mainMenu;
		break;
	case(enumTitleScreenState.mainMenu):
		if (global.titleScreenOptions == enumMainMenuChoice.newGame)
		{
			global.newGameMenuState = enumNewGameState.newGame;
			global.menuState = enumTitleScreenState.newGame;
		}
		else if (global.titleScreenOptions == enumMainMenuChoice.continueSave)
		{
			// Put code here when save system is implemented
		}
		break;
}


