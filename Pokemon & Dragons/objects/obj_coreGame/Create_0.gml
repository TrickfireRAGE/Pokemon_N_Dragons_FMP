/// @description Main Variables Established here

#region Enumeration Declaration

enum enumCoreGameAlarms // For all the alarms in obj_coreGame
{
	stateSwitch = 0
}

enum enumMusicState // For Music in Battles
{
	startOfBattle = 0,
	aboutToLoop = 1,
	looping = 2,
	lowHealthStart = 3,
	lowAbout = 4, 
	lowLooping = 5
}

enum enumTitleScreenState // States within Title Screens
{
	pressStart = 0,
	mainMenu = 1,
	settingsMenu = 2,
	newGame = 3,
	outOfMenu = 4
}

enum enumNewGameState
{
	newGame = 0,
	level1Choice = 1, 
	endGameChoice = 2
}

enum enumSettingsScreenState // States within Settings
{
	settingsBase = 0,
	resolution = 1,
	fullScreen = 2,
	sound = 3,
	controls = 4,
	credits = 5
}

enum enumGameState // States for Gameplay
{
	story = 0,
	level1Battle = 1,
	endGameBattle = 2
}

enum enumMainMenuChoice 
{
	newGame = 0,
	continueSave = 1,
	settings = 2,
	exitSave = 3
}

enum enumSettingsChoice
{
	resolution = 0,
	fullScreen = 1,
	sound = 2,
	controls = 3,
	credits = 4,
	returnMainMenu = 5
}

enum enumResolutionChoice
{
	resolution480P = 0,
	resolution540P = 1,
	resolution720P = 2,
	resolution1080P = 3,
	resolution1440P = 4,
	resolution2160P = 5,
	returnSettings = 6
}

enum enumFullScreenChoice
{
	windowed = 0,
	fullScreen = 1,
	returnSettings = 2
}

enum enumNewGameChoice
{
	story = 0,
	level1 = 1,
	endGame = 2,
	returnToMainMenu = 3
}

enum enumPokemonChoiceLevel1 // This can be expanded if going past 2 starters
{
	pikachu = 0,
	riolu = 1
}

enum enumPokemonChoiceEndGame // Same as Previous
{
	pikachu = 0,
	lucario = 1
}

enum enumBattleStats
{
	str = 0,
	dex = 1, 
	con = 2,
	int = 3, 
	wis = 4
}

enum enumBattleState
{
	introSequence = 0,
	player = 1,
	intermission = 2,
	opponent = 3,
	initiative = 4,
	playerAttack = 5
}

enum enumBattleChoices
{
	attack = 0,
	bag = 1,
	pokemon = 2, 
	endTurn = 3
}

enum enumPlayerTurnState
{
	attackMenu = 0,
	bagMenu = 1,
	pokemonMenu = 2,
	endTurnSelection = 3,
	baseMenu = 4
}

enum enumPlayerAttack
{
	attack1 = 0,
	attack2 = 1, 
	attack3 = 2, 
	attack4 = 3
}

enum enumOpponentStages // Expand this on future builds
{
	action = 0,
	bonus = 1, 
	endTurn = 2
}

enum enumType // No Fairy Types in This version
{
	normal = 0,
	fighting = 1,
	flying = 2,
	poison = 3,
	ground = 4, 
	rock = 5,
	bug = 6, 
	ghost = 7,
	steel = 8, 
	fire = 9, 
	water = 10, 
	grass = 11, 
	electric = 12,
	psychic = 13,
	ice = 14, 
	dragon = 15, 
	dark = 16
}

enum enumEffectiveness
{
	noEffect = 0,
	notVeryEffective = 0.5,
	normalEffective = 1,
	superEffective = 2
}

enum enumMoveLoader // For the Move functions
{
	moveID = 0,
	moveName = 1,
	moveDes = 2, 
	moveType = 3, 
	moveTime = 4, 
	movePP = 5,
	moveDS = 6, 
	moveAttackType = 7,
	moveAttackMod = 8, 
	moveLV1Dice = 9,
	moveLV1Amount = 10,
	moveLV5Dice = 11,
	moveLV5Amount = 12,
	moveLV10Dice = 13, 
	moveLV10Amount = 14, 
	moveLV17Dice = 15,
	moveLV17Amount = 16, 
	moveSideEffect = 17,
	moveSideType = 18,
	moveSideSoO = 19,
	moveSideAffected = 20,
	moveSideModifier = 21, 
	moveSideDuration = 22
}

enum enumAttackFunction // For the Attack Function
{
	baseDice = 0,
	diceModifier = 1, 
	effectiveness = 2,
	result = 3
}

#endregion

#region Gamepad Initalisation
global.controllerNumber = "NOT_SET";

for (var i = 0; i < gamepad_get_device_count(); i++) // Got from FioreFire
{
	if gamepad_is_connected(i)
	{
		global.controllerNumber = i;
	}
}

#endregion

#region Title Screen Logic

timerTitleScreenCheck = 0;
global.titleScreenOptions = 0; // Global due to coreUI accessing it.
global.settingsScreenOptions = 0; // ^
global.newGameOptions = 0; // ^
global.newGamePokemonChoice = 0;

#endregion

#region Battle Logic
global.maxPokemon = 3;

global.playerPokemonID = [];
global.playerPokemonID[0] = "NOT_SET";
global.playerPokemonID[1] = "NOT_SET";
global.playerPokemonID[2] = "NOT_SET";

global.playerChoiceBattle = "NOT_SET";
global.playerChoiceAttack = "NOT_SET";
global.playerChoicePokemon = "NOT_SET"; // Not Used in Prototype
global.playerChoiceBag = "NOT_SET"; // Might not be used in Prototype

global.opponentPokemonID = [];
global.opponentPokemonID[0] = "NOT_SET";
global.opponentPokemonID[1] = "NOT_SET";
global.opponentPokemonID[2] = "NOT_SET";

global.opponentStageBattle = "NOT_SET";
// Put more here

global.pokemonLevelSet = "NOT_SET";

global.sequenceID = "NOT_SET";
global.initiativeID = "NOT_SET";

randomise(); // Needed to randomise the seed

#endregion

#region Game States

global.menuState = "NOT_SET"; // Handles the State for Menus
global.settingsMenuState = "NOT_SET"; // Handles the State for Settings Menu
global.gameState = "NOT_SET"; // Handles States for Gameplay
global.newGameMenuState = "NOT_SET"; // Handles the Pokemon Choices

global.battleState = "NOT_SET"; // Used for the stages
global.playerBattleState = "NOT_SET"; // Used for the players turn

#endregion


