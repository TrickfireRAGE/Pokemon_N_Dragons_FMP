/// @description 


battleMusicState = false; // Changes to 1 after starting battle so loop can engage

soundCountBattle = 0;
opponentPokemonCrySound = "NOT_SET";
playerPokemonCrySound = "NOT_SET";

audio_group_load(sg_battleMusicGroup);
audio_group_load(sg_menuMusicGroup);
audio_group_load(sg_pokemonCriesGroup);
audio_group_load(sg_soundEffectsGroup);

funct_soundChanges(global.soundVolume); // Function to set all sound levels for the project