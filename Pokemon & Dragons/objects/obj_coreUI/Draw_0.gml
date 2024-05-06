/// @description 

switch (room)
{
	case(rm_introVideo):
		#region Video Draw Code
		var _videoData = video_draw(); // Code refereneced from Shaun Spalding
		var _videoStatus = _videoData[0];
		if (_videoStatus == 0)
		{
			draw_surface(_videoData[1], 0, 0);
		}
		#endregion
		break;
	case(rm_titleMenu):
		switch (global.menuState)
		{
			case(enumTitleScreenState.newGame):
				// Pokemon Drawing Variables
				var _xPosition1 = 72;
				var _xPosition2 = room_width - _xPosition1;
				var _yPosition = 85;
				// Choice Circle UI
				var _xPositionChoice = [];
				_xPositionChoice[0] = 0;
				_xPositionChoice[1] = room_width / 2;
				var _yPositionChoice = 0;
				var _subImageChoice = 0;
				// Draw Scene
				switch (global.newGameMenuState)
				{
					case(enumNewGameState.level1Choice):
						#region Level 1 Draw Choice
						// Draw Scene Code
						draw_sprite(spr_pikachu, enumPokemonPosition.front, 
							_xPosition1, _yPosition);
						draw_sprite(spr_riolu, enumPokemonPosition.front,
							_xPosition2, _yPosition);
						draw_sprite(spr_choiceCircle, _subImageChoice,
							_xPositionChoice[global.newGamePokemonChoice], _yPositionChoice);
						#endregion
						break;
					case (enumNewGameState.endGameChoice):
						#region End Game Draw Choice
						// Draw Scene Code
						draw_sprite(spr_pikachu, enumPokemonPosition.front, 
							_xPosition1, _yPosition);
						draw_sprite(spr_lucario, enumPokemonPosition.front,
							_xPosition2, _yPosition);
						draw_sprite(spr_choiceCircle, _subImageChoice,
							_xPositionChoice[global.newGamePokemonChoice], _yPositionChoice);
						#endregion
						break;
				}
			break;
		}
		break;
}


