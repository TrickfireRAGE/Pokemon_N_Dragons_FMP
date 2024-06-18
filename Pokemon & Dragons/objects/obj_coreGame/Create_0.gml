/// @description Main Variables Established here

#region Enumeration Declaration

enum enumCoreGameAlarms // For all the alarms in obj_coreGame
{
	stateSwitch = 0,
	moveAlarm = 1,
	damageDealt = 2
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
	tutorial = 4,
	outOfMenu = 5
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
	tutorial = 3,
	exitSave = 4
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
	playerAttack = 5,
	playerDamage = 6, // When the player deals damage
	playerNonAttack = 7,
	opponentDamage = 8, // When the Opponent Deals Damage
	opponentNonAttack = 9 // Here to try and fix the effect issue
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
	loading = 0,
	action = 1, 
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
	notVeryEffective = -1,
	normalEffective = 1,
	superEffective = 2
}

enum enumMoveLoader // For the Move functions
{
	pokemonID = 0,
	moveID = 1,
	moveName = 2,
	moveDes = 3, 
	moveType = 4, 
	moveTime = 5, 
	movePP = 6,
	moveDS = 7, 
	moveAttackType = 8,
	moveAttackMod = 9, 
	moveLV1Dice = 10,
	moveLV1Amount = 11,
	moveLV5Dice = 12,
	moveLV5Amount = 13,
	moveLV10Dice = 14, 
	moveLV10Amount = 15, 
	moveLV17Dice = 16,
	moveLV17Amount = 17, 
	moveSideEffect = 18,
	moveSideType = 19,
	moveSideSoO = 20,
	moveSideAffected = 21,
	moveSideModifier = 22, 
	moveSideDuration = 23
}

enum enumAttackFunction // For the Attack Function
{
	baseDice = 0,
	diceModifier = 1, 
	effectiveness = 2,
	baseResult = 3,
	result = 4,
	diceOrSave = 5,
	attackDiceSize = 6,
	attackDiceRollFirst = 7
}

enum enumNonAttackFunction // For the Non Attack Function
{
	sideAffected = 0,
	sideModifier = 1,
	sideDuration = 2, 
	sideWho = 3
}

enum enumDiceSize
{
	d4 = 4,
	d6 = 6,
	d8 = 8,
	d10 = 10, 
	d12 = 12, 
	d20 = 20
}

enum enumTutorialChoice
{
	battleGameplay = 0,
	dice = 1,
	moves = 2,
	dnd = 3,
	returnMain = 4
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
global.tutorialDialogue = 0; // Used for basic tutorial

#endregion

#region Battle Logic
global.maxPokemon = 3;
attackNonCheck = "NOT_SET"; // Made into Object Variable instead of local due to need of access in step event
global.failureVariable = -999; // To replace Fail 

global.playerPokemonID = [];
global.playerPokemonID[0] = "NOT_SET";
global.playerPokemonID[1] = "NOT_SET";
global.playerPokemonID[2] = "NOT_SET";

global.playerChoiceBattle = "NOT_SET";
global.playerChoiceAttack = "NOT_SET";
global.playerChoiceAttackExplain = false; // Use true or false for this.
global.playerChoicePokemon = "NOT_SET"; // Not Used in Prototype
global.playerChoiceBag = "NOT_SET"; // Might not be used in Prototype
global.playerActionPoint = "NOT_SET"; // Using as a global variable to make it easier on implementaiton.
global.playerBonusPoint = "NOT_SET"; // ^

global.playerSideEffectArray = [];
global.playerSideEffectArray[enumNonAttackFunction.sideAffected] = "NOT_SET";
global.playerSideEffectArray[enumNonAttackFunction.sideDuration] = "NOT_SET";
global.playerSideEffectArray[enumNonAttackFunction.sideModifier] = "NOT_SET";

// Potentially put effected points here

global.opponentPokemonID = [];
global.opponentPokemonID[0] = "NOT_SET";
global.opponentPokemonID[1] = "NOT_SET";
global.opponentPokemonID[2] = "NOT_SET";

global.opponentSideEffectArray = [];
global.opponentSideEffectArray[enumNonAttackFunction.sideAffected] = "NOT_SET";
global.opponentSideEffectArray[enumNonAttackFunction.sideDuration] = "NOT_SET";
global.opponentSideEffectArray[enumNonAttackFunction.sideModifier] = "NOT_SET";

// Potentially put effected points here

global.moveReturnArray = [];
global.nonAttackReturnArray = [];
global.hpDamageReduction = "NOT_SET"; // Used for cross referencing between core and UI for the HP lowering.


global.opponentStageBattle = "NOT_SET";
global.opponentMoveChoice = "NOT_SET";
// Put more here

global.pokemonLevelSet = "NOT_SET";

global.sequenceID = "NOT_SET";
global.moveIDSequence = "NOT_SET";
global.initiativeID = "NOT_SET";
global.attackIDRoll = "NOT_SET";
global.attackIDDamage = "NOT_SET";

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


