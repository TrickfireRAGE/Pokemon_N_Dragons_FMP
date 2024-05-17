/// @description ???

var _moveSprite = "NOT_SET";
var _soundEffect = "NOT_SET";

switch (global.playerChoiceAttack)
{
	case (enumPlayerAttack.attack1):
		_moveSprite = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1Sprite]; // Get rid of the magic number in future build.
		_soundEffect = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1Sound];
		break;
	case (enumPlayerAttack.attack2):
		_moveSprite = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2Sprite];
		_soundEffect = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2Sound]; // Get rid of the magic number in future build.
		break;
	case (enumPlayerAttack.attack3):
		_moveSprite = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3Sprite];
		_soundEffect = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3Sound]; // Get rid of the magic number in future build.
		break;
	case (enumPlayerAttack.attack4):
		_moveSprite = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4Sprite]; // Get rid of the magic number in future build.
		_soundEffect = obj_playerPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4Sound];
		break;
}

sprite_index = asset_get_index(_moveSprite);
var _moveSound = asset_get_index(_soundEffect);
audio_play_sound(_moveSound, 0, false);

