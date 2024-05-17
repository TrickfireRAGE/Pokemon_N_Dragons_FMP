// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function funct_modifierCheck(_stat)
{
	var _modifier = "NOT_SET";
	switch (_stat)
		{
			case(0):
			case(1):
				_modifier = -5;
				return _modifier;
				break;
			case(2):
			case(3):
				_modifier = -4;
				return _modifier;
				break;
			case(4):
			case(5):
				_modifier = -3;
				return _modifier;
				break;
			case(6):
			case(7):
				_modifier = -2;
				return _modifier;
				break;
			case(8):
			case(9):
				_modifier = -1;
				return _modifier;
				break;				
			case(10):
			case(11):
				_modifier = 0;
				return _modifier;
				break;
			case(12):
			case(13):
				_modifier = 1;
				return _modifier;
				break
			case(14):
			case(15):
				_modifier = 2;
				return _modifier;
				break;
			case(16):
			case(17):
				_modifier = 3;
				return _modifier;
				break;
			case(18):
			case(19):
				_modifier = 4;
				return _modifier;
				break;
			case(20):
			case(21):
				_modifier = 5;
				return _modifier;
				break;
			case(22):
			case(23):
				_modifier = 6;
				return _modifier;
				break;
			case(24):
			case(25):
				_modifier = 7;
				return _modifier;
				break;
		}
}

function funct_initiativeRoll(_dexterityModifier, _additionalModifier)
{
	var _roll = funct_diceRoll(20)
	if (_additionalModifier != undefined)
	{
		var _rolled = _roll + _dexterityModifier + _additionalModifier;
		return _rolled
	}
	else
	{
		var _rolled = _roll + _dexterityModifier;
		return _rolled
	}
}

function funct_diceRoll(_diceSize)
{
	return (irandom_range(1, _diceSize));
}

function funct_moveLoader(_moveID)
{
	var _moveArray = [];
	_moveArray[enumMoveLoader.moveID] = _moveID;
	var _pokeMovesLength = array_length(global.pokeMoves) - 1;
	
	for (var i = 0; i <= _pokeMovesLength; i++;)
	{
		if (global.pokeMoves[i][$ "Move ID"] == _moveID) // Update to include sprite/object/sequence
		{
			_moveArray[enumMoveLoader.moveName] = global.pokeMoves[i][$ "Move Name"];
			_moveArray[enumMoveLoader.moveDes] = global.pokeMoves[i][$ "Move Description"];
			_moveArray[enumMoveLoader.moveType] = global.pokeMoves[i][$ "Type"];
			_moveArray[enumMoveLoader.moveTime] = global.pokeMoves[i][$ "Time"];
			_moveArray[enumMoveLoader.movePP] = global.pokeMoves[i][$ "PP"];
			_moveArray[enumMoveLoader.moveDS] = global.pokeMoves[i][$ "Dice or Save"];
			_moveArray[enumMoveLoader.moveAttackType] = global.pokeMoves[i][$ "Attack Type"];
			_moveArray[enumMoveLoader.moveAttackMod] = global.pokeMoves[i][$ "Attack Modifier"];
			_moveArray[enumMoveLoader.moveLV1Dice] = global.pokeMoves[i][$ "LV1 Dice Size"];
			_moveArray[enumMoveLoader.moveLV1Amount] = global.pokeMoves[i][$ "LV1 Dice Amount"];
			_moveArray[enumMoveLoader.moveLV5Dice] = global.pokeMoves[i][$ "LV5 Dice Size"];
			_moveArray[enumMoveLoader.moveLV5Amount] = global.pokeMoves[i][$ "LV5 Dice Amount"];
			_moveArray[enumMoveLoader.moveLV10Dice] = global.pokeMoves[i][$ "LV10 Dice Size"];
			_moveArray[enumMoveLoader.moveLV10Amount] = global.pokeMoves[i][$ "LV10 Dice Amount"];
			_moveArray[enumMoveLoader.moveLV17Dice] = global.pokeMoves[i][$ "LV17 Dice Size"];
			_moveArray[enumMoveLoader.moveLV17Amount] = global.pokeMoves[i][$ "LV17 Dice Amount"];
			_moveArray[enumMoveLoader.moveSideEffect] = global.pokeMoves[i][$ "Side Effect"];
			_moveArray[enumMoveLoader.moveSideType] = global.pokeMoves[i][$ "Side Effect Type"];
			_moveArray[enumMoveLoader.moveSideSoO] = global.pokeMoves[i][$ "Self or Opponent"];
			_moveArray[enumMoveLoader.moveSideAffected] = global.pokeMoves[i][$ "Affected Stats"];
			_moveArray[enumMoveLoader.moveSideModifier] = global.pokeMoves[i][$ "Side Modifier"];
			_moveArray[enumMoveLoader.moveSideDuration] = global.pokeMoves[i][$ "Duration"];
			i = _pokeMovesLength + 1;
		}
	}
	/*for (var i = 0; i < array_length(_maxPP); i++;) // Fixed zero number appearing by deleting it within the array with this check.
	{ // This is a temp solution, when implementing move attacks, consider replacing all of this with functions.
		if (_maxPP[i] == 0)
		{
			array_delete(_textStringAttack, i, 1);
			array_delete(_textMoveType, i, 1);
			array_delete(_textMoveTime, i, 1);
			array_delete(_maxPP, i, 1);
		}
	}*/

	return _moveArray;
} 
// Idea for above (Once fully done) will take the moveID and fully load the move's data and checking if it is an attack or Non-Attack.
// Plus this will also do the check for Action/Bonus and will cancel out if there isn't a point left.
// Additionally, it will enable other functions to be made to do damage which will be below.

function funct_attack(_moveArray, _moveID, _level, _defenderAC, _defenderType, _attackerType, _attackerStats) // Fully Develop This (Consider putting the visual code here)
{																											// Develop the additional modifiers here because of Growl, Work up.
	// GET RID OF ALL MAGIC NUMBERS IN FUTURE BUILDS.
	var _length = array_length(_moveArray) - 1;
	var _diceRoll = "NOT_SET";
	var _diceRollFull = "NOT_SET";
	var _result = 0;
	
	var _type = "NOT_SET";
	var _time = "NOT_SET"; // Not implemented yet
	var _modifier = "NOT_SET";
	var _modifierNumber = "NOT_SET";
	var _diceOrSave = "NOT_SET";
	var _diceSize = [];
	var _diceAmount = [];
	var _attackRolls = [];
	var _chosenSize = "NOT_SET";
	var _chosenAmount = "NOT_SET";
	
	
	for (var i = _length; i >= 0; i--;)
	{
		if (_moveID == _moveArray[i][$ "Move ID"])
		{
			_type = _moveArray[i][$ "Type"];
			_time = _moveArray[i][$ "Time"];
			_modifier = _moveArray[i][$ "Attack Modifier"];
			_diceOrSave = _moveArray[i][$ "Dice or Save"];
			_diceSize[0] = _moveArray[i][$ "LV1 Dice Size"]; // Make an enumeration later to document this
			_diceSize[1] = _moveArray[i][$ "LV5 Dice Size"];
			_diceSize[2] = _moveArray[i][$ "LV10 Dice Size"];
			_diceSize[3] = _moveArray[i][$ "LV17 Dice Size"];
			_diceAmount[0] = _moveArray[i][$ "LV1 Dice Amount"];
			_diceAmount[1] = _moveArray[i][$ "LV5 Dice Amount"];
			_diceAmount[2] = _moveArray[i][$ "LV10 Dice Amount"];
			_diceAmount[3] = _moveArray[i][$ "LV17 Dice Amount"];
		}
	}
	
	switch (_modifier) // Code to get the modifier set (IN FUTURE VERSIONS, GET RID OF 0 MAGIC NUMBER)
	{
		case("Str"):
			var _stat = _attackerStats[0][enumPokemonArray.str];
			_modifierNumber = funct_modifierCheck(_stat);
			break;
		case("Dex"):
			var _stat = _attackerStats[0][enumPokemonArray.dex];
			_modifierNumber = funct_modifierCheck(_stat);
			break;
		case("Con"):
			var _stat = _attackerStats[0][enumPokemonArray.con];
			_modifierNumber = funct_modifierCheck(_stat);
			break;
		case("Int"):
			var _stat = _attackerStats[0][enumPokemonArray.int];
			_modifierNumber = funct_modifierCheck(_stat);
			break;
		case("Wis"):
			var _stat = _attackerStats[0][enumPokemonArray.wis];
			_modifierNumber = funct_modifierCheck(_stat);
			break;
	}
	
	if (_diceOrSave != string)
	{
		// DEBUG IMPLEMENTATION
		_diceRoll = 20; //funct_diceRoll(_diceOrSave); // Commented out to always make it hit.
		_diceRollFull = _diceRoll + _modifierNumber;
	}
	// Damage Calculation
	switch(_level)
	{
		#region Damage Roll System
		case(1):
		case(2):
		case(3):
		case(4):
			for(var i = 0; i < _diceAmount[0]; i++;)
			{
				var _roll = funct_diceRoll(_diceSize[0]);
				_result += _roll;
				array_push(_attackRolls, _roll);
			}
			_chosenAmount = _diceAmount[0];
			_chosenSize = _diceSize[0];
			_result += _modifierNumber;
			break;
		case(5):
		case(6):
		case(7):
		case(8):
		case(9):
			for(var i = 0; i < _diceAmount[1]; i++;)
			{
				var _roll = funct_diceRoll(_diceSize[1]);
				_result += _roll;
				array_push(_attackRolls, _roll);
			}
			_chosenAmount = _diceAmount[1];
			_chosenSize = _diceSize[1];
			_result += _modifierNumber;
			break;
		case(10):
		case(11):
		case(12):
		case(13):
		case(14):
		case(15):
		case(16):
			for(var i = 0; i < _diceAmount[2]; i++;)
			{
				var _roll = funct_diceRoll(_diceSize[2]);
				_result += _roll;
				array_push(_attackRolls, _roll);
			}
			_chosenAmount = _diceAmount[2];
			_chosenSize = _diceSize[2];
			_result += _modifierNumber;
			break;
		case(17):
		case(18):
		case(19):
		case(20):
			for(var i = 0; i < _diceAmount[3]; i++;)
			{
				var _roll = funct_diceRoll(_diceSize[3]);
				_result += _roll;
				array_push(_attackRolls, _roll);
			}
			_chosenAmount = _diceAmount[3];
			_chosenSize = _diceSize[3];
			_result += _modifierNumber;
			break;
		#endregion
	}
	
	/*if (_diceRoll == "NOT_SET";)
	{
		// Put Saving Code here
	}*/
	
	if (_diceRollFull >= _defenderAC)
	{
		var _effectiveness = funct_typeEffectiveness(_type, _defenderType); // Expand to have multiple types in future.
		
		_result *= _effectiveness;
		
		if (_attackerType == _type)
		{
			_result *= 1.5;
		}
		
		var _final = [];
		_final[enumAttackFunction.baseDice] = _diceRoll;
		_final[enumAttackFunction.diceModifier] = _modifierNumber;
		_final[enumAttackFunction.effectiveness] = _effectiveness;
		_final[enumAttackFunction.result] = _result;
		_final[enumAttackFunction.diceOrSave] = _diceOrSave;
		_final[enumAttackFunction.attackDiceSize] = _chosenSize;
		for (var i = 0; i < _chosenAmount; i++;)
		{
			array_push(_final, _attackRolls[i]);
		}
		return _final;
	}
	else if (_diceRollFull < _defenderAC)
	{
		_result = "FAIL"; // Change if this doesn't work
		var _final = [];
		_final[enumAttackFunction.baseDice] = _diceRoll;
		_final[enumAttackFunction.diceModifier] = _modifierNumber;
		_final[enumAttackFunction.effectiveness] = enumEffectiveness.noEffect;
		_final[enumAttackFunction.result] = _result;
		_final[enumAttackFunction.diceOrSave] = _diceOrSave;
		return _final;
	}
}

function funct_typeEffectiveness(_attacker, _defender)
{
	var _attackerType = "NOT_SET";
	var _defenderType = "NOT_SET";
	
	#region Type Connection
	switch (_attacker) //Make this into a seperate function to reduce code.
	{
		case("Normal"):
			_attackerType = enumType.normal;
			break;
		case("Fighting"):
			_attackerType = enumType.fighting;
			break;
		case("Flying"):
			_attackerType = enumType.flying;
			break;
		case("Poison"):
			_attackerType = enumType.poison;
			break;
		case("Ground"):
			_attackerType = enumType.ground;
			break;
		case("Rock"):
			_attackerType = enumType.rock;
			break;
		case("Bug"):
			_attackerType = enumType.bug;
			break;
		case("Ghost"):
			_attackerType = enumType.ghost;
			break;
		case("Steel"):
			_attackerType = enumType.steel;
			break;
		case("Fire"):
			_attackerType = enumType.fire;
			break;
		case("Water"):
			_attackerType = enumType.water;
			break;
		case("Grass"):
			_attackerType = enumType.grass;
			break;
		case("Electric"):
			_attackerType = enumType.electric;
			break;
		case("Psychic"):
			_attackerType = enumType.psychic;
			break;
		case("Ice"):
			_attackerType = enumType.ice;
			break;
		case("Dragon"):
			_attackerType = enumType.dragon;
			break;
		case("Dark"):
			_attackerType = enumType.dark;
			break;
	}
	switch (_defender)
	{
		case("Normal"):
			_defenderType = enumType.normal;
			break;
		case("Fighting"):
			_defenderType = enumType.fighting;
			break;
		case("Flying"):
			_defenderType = enumType.flying;
			break;
		case("Poison"):
			_defenderType = enumType.poison;
			break;
		case("Ground"):
			_defenderType = enumType.ground;
			break;
		case("Rock"):
			_defenderType = enumType.rock;
			break;
		case("Bug"):
			_defenderType = enumType.bug;
			break;
		case("Ghost"):
			_defenderType = enumType.ghost;
			break;
		case("Steel"):
			_defenderType = enumType.steel;
			break;
		case("Fire"):
			_defenderType = enumType.fire;
			break;
		case("Water"):
			_defenderType = enumType.water;
			break;
		case("Grass"):
			_defenderType = enumType.grass;
			break;
		case("Electric"):
			_defenderType = enumType.electric;
			break;
		case("Psychic"):
			_defenderType = enumType.psychic;
			break;
		case("Ice"):
			_defenderType = enumType.ice;
			break;
		case("Dragon"):
			_defenderType = enumType.dragon;
			break;
		case("Dark"):
			_defenderType = enumType.dark;
			break;
	}	
	#endregion
	
	#region Type Array Code Storage
	typesArray = []; // Finish this soon!
	// Normal Defense
				// Defense		// Attacker
	typesArray[enumType.normal][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.fighting] = enumEffectiveness.superEffective;
	typesArray[enumType.normal][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.ghost] = enumEffectiveness.noEffect;
	typesArray[enumType.normal][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.grass] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.normal][enumType.dark] = enumEffectiveness.normalEffective;
	// Fighting Defense
				// Defense		// Attacker
	typesArray[enumType.fighting][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.fighting] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.flying] = enumEffectiveness.superEffective;
	typesArray[enumType.fighting][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.rock] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.fighting][enumType.bug] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.fighting][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.grass] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.psychic] = enumEffectiveness.superEffective;
	typesArray[enumType.fighting][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.fighting][enumType.dark] = enumEffectiveness.notVeryEffective;
	// Flying Defense
				// Defense		// Attacker
	typesArray[enumType.flying][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.fighting] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.flying][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.ground] = enumEffectiveness.noEffect;
	typesArray[enumType.flying][enumType.rock] = enumEffectiveness.superEffective;
	typesArray[enumType.flying][enumType.bug] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.flying][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.grass] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.flying][enumType.electric] = enumEffectiveness.superEffective;
	typesArray[enumType.flying][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.ice] = enumEffectiveness.superEffective;
	typesArray[enumType.flying][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.flying][enumType.dark] = enumEffectiveness.normalEffective;
	// Poison Defense
				// Defense		// Attacker
	typesArray[enumType.poison][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.fighting] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.poison][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.poison] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.poison][enumType.ground] = enumEffectiveness.superEffective;
	typesArray[enumType.poison][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.bug] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.poison][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.grass] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.poison][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.psychic] = enumEffectiveness.superEffective;
	typesArray[enumType.poison][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.poison][enumType.dark] = enumEffectiveness.normalEffective;
	// Ground Defense
				// Defense		// Attacker
	typesArray[enumType.ground][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.fighting] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.poison] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.ground][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.rock] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.ground][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.water] = enumEffectiveness.superEffective;
	typesArray[enumType.ground][enumType.grass] = enumEffectiveness.superEffective;
	typesArray[enumType.ground][enumType.electric] = enumEffectiveness.noEffect;
	typesArray[enumType.ground][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.ice] = enumEffectiveness.superEffective;
	typesArray[enumType.ground][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.ground][enumType.dark] = enumEffectiveness.normalEffective;
	// Rock Defense
				// Defense		// Attacker
	typesArray[enumType.rock][enumType.normal] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.rock][enumType.fighting] = enumEffectiveness.superEffective;
	typesArray[enumType.rock][enumType.flying] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.rock][enumType.poison] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.rock][enumType.ground] = enumEffectiveness.superEffective;
	typesArray[enumType.rock][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.rock][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.rock][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.rock][enumType.steel] = enumEffectiveness.superEffective;
	typesArray[enumType.rock][enumType.fire] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.rock][enumType.water] = enumEffectiveness.superEffective;
	typesArray[enumType.rock][enumType.grass] = enumEffectiveness.superEffective;
	typesArray[enumType.rock][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.rock][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.rock][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.rock][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.rock][enumType.dark] = enumEffectiveness.normalEffective;
	// Bug Defense
				// Defense		// Attacker
	typesArray[enumType.bug][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.fighting] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.bug][enumType.flying] = enumEffectiveness.superEffective;
	typesArray[enumType.bug][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.ground] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.bug][enumType.rock] = enumEffectiveness.superEffective;
	typesArray[enumType.bug][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.fire] = enumEffectiveness.superEffective;
	typesArray[enumType.bug][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.grass] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.bug][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.bug][enumType.dark] = enumEffectiveness.normalEffective;
	// Ghost Defense
				// Defense		// Attacker
	typesArray[enumType.ghost][enumType.normal] = enumEffectiveness.noEffect;
	typesArray[enumType.ghost][enumType.fighting] = enumEffectiveness.noEffect;
	typesArray[enumType.ghost][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.poison] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.ghost][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.bug] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.ghost][enumType.ghost] = enumEffectiveness.superEffective;
	typesArray[enumType.ghost][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.grass] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.ghost][enumType.dark] = enumEffectiveness.superEffective;
	// Steel Defense
				// Defense		// Attacker
	typesArray[enumType.steel][enumType.normal] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.fighting] = enumEffectiveness.superEffective;
	typesArray[enumType.steel][enumType.flying] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.poison] = enumEffectiveness.noEffect;
	typesArray[enumType.steel][enumType.ground] = enumEffectiveness.superEffective;
	typesArray[enumType.steel][enumType.rock] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.bug] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.steel][enumType.steel] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.fire] = enumEffectiveness.superEffective;
	typesArray[enumType.steel][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.steel][enumType.grass] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.steel][enumType.psychic] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.ice] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.dragon] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.steel][enumType.dark] = enumEffectiveness.normalEffective;
	// Fire Defense
				// Defense		// Attacker
	typesArray[enumType.fire][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.fighting] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.ground] = enumEffectiveness.superEffective;
	typesArray[enumType.fire][enumType.rock] = enumEffectiveness.superEffective;
	typesArray[enumType.fire][enumType.bug] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.fire][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.steel] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.fire][enumType.fire] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.fire][enumType.water] = enumEffectiveness.superEffective;
	typesArray[enumType.fire][enumType.grass] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.fire][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.ice] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.fire][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.fire][enumType.dark] = enumEffectiveness.normalEffective;
	// Water Defense
				// Defense		// Attacker
	typesArray[enumType.water][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.fighting] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.steel] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.water][enumType.fire] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.water][enumType.water] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.water][enumType.grass] = enumEffectiveness.superEffective;
	typesArray[enumType.water][enumType.electric] = enumEffectiveness.superEffective;
	typesArray[enumType.water][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.ice] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.water][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.water][enumType.dark] = enumEffectiveness.normalEffective;
	// Grass Defense
				// Defense		// Attacker
	typesArray[enumType.grass][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.grass][enumType.fighting] = enumEffectiveness.normalEffective;
	typesArray[enumType.grass][enumType.flying] = enumEffectiveness.superEffective;
	typesArray[enumType.grass][enumType.poison] = enumEffectiveness.superEffective;
	typesArray[enumType.grass][enumType.ground] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.grass][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.grass][enumType.bug] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.grass][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.grass][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.grass][enumType.fire] = enumEffectiveness.superEffective;
	typesArray[enumType.grass][enumType.water] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.grass][enumType.grass] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.grass][enumType.electric] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.grass][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.grass][enumType.ice] = enumEffectiveness.superEffective;
	typesArray[enumType.grass][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.grass][enumType.dark] = enumEffectiveness.normalEffective;
	// Electric Defense
				// Defense		// Attacker
	typesArray[enumType.electric][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.fighting] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.flying] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.electric][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.ground] = enumEffectiveness.superEffective;
	typesArray[enumType.electric][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.steel] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.electric][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.grass] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.electric] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.electric][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.electric][enumType.dark] = enumEffectiveness.normalEffective;
	// Psychic Defense
				// Defense		// Attacker
	typesArray[enumType.psychic][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.fighting] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.psychic][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.bug] = enumEffectiveness.superEffective;
	typesArray[enumType.psychic][enumType.ghost] = enumEffectiveness.superEffective;
	typesArray[enumType.psychic][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.grass] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.psychic] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.psychic][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.psychic][enumType.dark] = enumEffectiveness.superEffective;
	// Ice Defense
				// Defense		// Attacker
	typesArray[enumType.ice][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.fighting] = enumEffectiveness.superEffective;
	typesArray[enumType.ice][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.rock] = enumEffectiveness.superEffective;
	typesArray[enumType.ice][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.steel] = enumEffectiveness.superEffective;
	typesArray[enumType.ice][enumType.fire] = enumEffectiveness.superEffective;
	typesArray[enumType.ice][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.grass] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.ice] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.ice][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.ice][enumType.dark] = enumEffectiveness.normalEffective;
	// Dragon Defense
				// Defense		// Attacker
	typesArray[enumType.dragon][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.fighting] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.bug] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.ghost] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.fire] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.dragon][enumType.water] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.dragon][enumType.grass] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.dragon][enumType.electric] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.dragon][enumType.psychic] = enumEffectiveness.normalEffective;
	typesArray[enumType.dragon][enumType.ice] = enumEffectiveness.superEffective;
	typesArray[enumType.dragon][enumType.dragon] = enumEffectiveness.superEffective;
	typesArray[enumType.dragon][enumType.dark] = enumEffectiveness.normalEffective;
	// Dark Defense
				// Defense		// Attacker
	typesArray[enumType.dark][enumType.normal] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.fighting] = enumEffectiveness.superEffective;
	typesArray[enumType.dark][enumType.flying] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.poison] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.ground] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.rock] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.bug] = enumEffectiveness.superEffective;
	typesArray[enumType.dark][enumType.ghost] = enumEffectiveness.notVeryEffective;
	typesArray[enumType.dark][enumType.steel] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.fire] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.water] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.grass] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.electric] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.psychic] = enumEffectiveness.noEffect;
	typesArray[enumType.dark][enumType.ice] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.dragon] = enumEffectiveness.normalEffective;
	typesArray[enumType.dark][enumType.dark] = enumEffectiveness.notVeryEffective;
	
	#endregion
	
	return typesArray[_defenderType][_attackerType];
	
}

function funct_actionBonusPoint(_time, _actionPoints, _bonusPoints) // Used to check if bonus/action points have been used up
{
	switch (_time)
	{
		case("Action"):
			if (_actionPoints == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
			break;
		case("Bonus"):
			if (_bonusPoints == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
			break;
	}
}

function funct_nonAttack()
{
	
	// put function here
}