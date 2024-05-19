/// @description Damage Dealt Code
if (layer_sequence_is_finished(global.moveIDSequence) == true) // To ensure it doesn't endlessly loop.
{
	if (global.battleState == enumBattleState.playerAttack)
	{
		layer_sequence_destroy(global.moveIDSequence);
		switch (global.moveReturnArray[enumAttackFunction.effectiveness])
		{
			case(0.5):
			case(1):
				audio_play_sound(snd_hitNormal, 0, false);
				global.moveIDSequence = "NOT_SET";
				global.attackIDDamage = "NOT_SET";
				global.hpDamageReduction = obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP];
				obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP] -= global.moveReturnArray[enumAttackFunction.result];
				global.battleState = enumBattleState.playerDamage;
				break;
			case(2):
				audio_play_sound(snd_hitSuperEffective, 0, false);
				global.moveIDSequence = "NOT_SET";
				global.attackIDDamage = "NOT_SET";
				global.hpDamageReduction = obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP];
				obj_opponentPokemon.pokemonParty[0][enumPokemonArray.currentHP] -= global.moveReturnArray[enumAttackFunction.result];
				global.battleState = enumBattleState.playerDamage;
				break;
		}
	}
	else if (global.battleState == enumBattleState.opponent)
	{
		// Type here once opponent code is done)
	}
}

