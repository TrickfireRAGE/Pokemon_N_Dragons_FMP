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
				#region New Game Menu Draw Stuff
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
				#endregion
				break;
			case(enumTitleScreenState.settingsMenu):
				#region Settings Menu Draw Stuff
				switch(global.settingsMenuState)
				{
					case(enumSettingsScreenState.controls):
						var _xControls = 0;
						var _yControls = 0;
						draw_sprite(spr_controlSettings, 0, _xControls, _yControls);
						break;
				}
				#endregion
				break;
			}
			break;
	case(rm_battleRoom):
		switch (global.gameState)
		{
			#region Custom Background Effects Code
			case(enumGameState.level1Battle):
				// Type here
				break;
			case(enumGameState.endGameBattle):
				var _randomEffect = "NOT_SET";
				_randomEffect = irandom_range(0, 999);
				if (_randomEffect == 999)
				{
					alarm_set(enumCoreUIAlarms.backgroundEffect, 1);
				}
				break;
			#endregion
		}
		switch (global.battleState)
		{
			case(enumBattleState.initiative): // For the text boxes under text and Rolls
				var _xPosition = room_width / 2;
				var _yPosition = room_height / 2;
				var _xScale = 3;
				var _yScale = 3.7;
				if (!(global.initiativeID.loopCounter == global.initiativeID._timeLength + 4))
				{
					draw_sprite_ext(spr_textBox, 0, 
						_xPosition, _yPosition,
						_xScale, _yScale, 
						0, c_white, 
						1); // Put into variables after testing
				}
				else
				{
					draw_sprite_ext(spr_textBox, 0, 
						_xPosition, _yPosition, 
						_xScale, _yScale, 
						0, c_white, 
						initiativeAlpha); // Put into variables after testing
				}
				break;
		}
		break;
}


