/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Montrer son insigne de police</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5']];

	};

	case east:
	{
		//Passport System
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Montrer son passport</t>",life_fnc_civShowPassport,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5']];
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction["Rob Person",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	};

	case civilian:
	{
		//Passport System
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Montrer son passport</t>",life_fnc_civShowPassport,"",1,false,true,"",' playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5']];
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction["Rob Person",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	};
	case independent:
	{
	/*
	life_actions = life_actions + [player addAction["Voir les inconscient",life_fnc_med,"",0,false,false,"",' playerside == independent ']];
	life_actions = life_actions + [player addAction["<t color='#FF0000'>Se soigner</t>",life_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage player) > 0 && ("Medikit" in (items player)) ']];
	life_actions = life_actions + [player addAction["<t color='#FF0000'>Soigner la personne</t>",life_fnc_heal_target,"",99,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 3.5 && vehicle player == player && (damage cursorTarget) > 0 && ("Medikit" in (items player)) ']];
	*/
	};

};