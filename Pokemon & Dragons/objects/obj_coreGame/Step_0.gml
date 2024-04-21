/// @description Runs the core states

switch (global.currentGameState)
{
	case(gameState.studioVideoState):
		if (video_get_status() == video_status_closed)
		{
			global.currentGameState = gameState.menuState;
		}
		break;
	case(gameState.menuState):
		show_debug_message("Call");
		break;
}
