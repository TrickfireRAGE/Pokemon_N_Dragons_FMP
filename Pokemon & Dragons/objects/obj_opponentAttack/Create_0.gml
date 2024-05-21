/// @description ???

var _moveSprite = "NOT_SET";
var _soundEffect = "NOT_SET";

if (global.opponentMoveChoice <= 249) // Remembered Advice from Finn (Project 1) (Reuse from the Step Event in coreGame)
{
	_moveSprite = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1Sprite]; // Get rid of the magic number in future build.
	_soundEffect = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move1Sound];
}
else if (global.opponentMoveChoice <= 499)
{
	_moveSprite = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2Sprite];
	_soundEffect = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move2Sound]; // Get rid of the magic number in future build.
}
else if (global.opponentMoveChoice <= 749)
{
	_moveSprite = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3Sprite];
	_soundEffect = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move3Sound]; // Get rid of the magic number in future build.
}
else
{
	_moveSprite = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4Sprite]; // Get rid of the magic number in future build.
	_soundEffect = obj_opponentPokemon.pokemonPartyMoves[0][enumPokemonPartyMoves.move4Sound];
}

sprite_index = asset_get_index(_moveSprite);
image_angle = 180; // Testing
var _moveSound = asset_get_index(_soundEffect);
audio_play_sound(_moveSound, 0, false);

