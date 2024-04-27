/// @description 

switch (room)
{
	case(rm_titleMenu):
		var _gameLogoX = global.videoResolutionWidth / 1.3; // Local Variable for Game Logo X
		var _gameLogoY = global.videoResolutionHeight / 2.5; // Local Variable for Game Logo Y
		var _gameLogoScale = global.videoResolutionWidth / 1920; // Scales the image depending on what resolution the game is running at.
		var _gameTextX = global.videoResolutionWidth / 1.6;
		var _gameTextY = global.videoResolutionHeight / 1.5;
		var _gameTextScale = (global.videoResolutionWidth / 1920) * 3;
		if (titleScreenAlphaLogo <= 1)
		{
			draw_sprite_ext(spr_gameLogo, 0, _gameLogoX, _gameLogoY, _gameLogoScale, _gameLogoScale, 0, c_white, titleScreenAlphaLogo);
			titleScreenAlphaLogo += 0.01;
		}
		else
		{
			
			draw_sprite_ext(spr_gameLogo, 0, _gameLogoX, _gameLogoY, _gameLogoScale, _gameLogoScale, 0, c_white, titleScreenAlphaLogo);
			if (titleScreenAlphaText <= 1)
			{
				draw_set_font(fnt_kyoMadoka);
				draw_text_transformed_colour(_gameTextX, _gameTextY, "Press Start", _gameTextScale, _gameTextScale, 0, c_white, c_white, c_white, c_white, titleScreenAlphaText);
				titleScreenAlphaText += 0.01;
			}
			else
			{
				draw_set_font(fnt_kyoMadoka);
				draw_text_transformed_colour(_gameTextX, _gameTextY, "Press Start", _gameTextScale, _gameTextScale, 0, c_white, c_white, c_white, c_white, titleScreenAlphaText);
			}
		}
		// put other stuff here
		break;
}


