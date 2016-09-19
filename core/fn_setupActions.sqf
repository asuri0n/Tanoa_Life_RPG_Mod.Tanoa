/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	/* Komodo: désactivé car plus de raison d'avoir cette option pour les gendarmes. Devrait aussi améliorer les FPS des gendarmes.*/
	case west:
	{
		//life_actions = [player addAction["Monter en tant que conducteur",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//life_actions set [count life_actions,player addAction["Monter en tant que passager",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//life_actions set [count life_actions,player addAction["Sortir",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		life_actions = life_actions + [player addAction["<t color='#00FF00'>Montrer son insigne de police</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5']];

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
		/* Komodo: remplacé par addActions sur les objets.
		//Archeology
		life_actions set [count life_actions,player addAction["Cueillir Des Echantillons",life_fnc_gatherArcheologie,"",0,false,false,"",'
		!life_action_in_use && (typeOf cursorTarget) == "Land_HumanSkull_F" && player distance cursorTarget < 5']];
		*/
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

/*
	Undecided actions
life_actions = life_actions + [player addAction["Repair Vehicle ($500)",life_fnc_pumpRepair,"",999,false,false,"",
' vehicle player != player && (typeOf cursorTarget == "Land_fs_feed_F") && (vehicle player) distance cursorTarget < 6 ']];
life_actions = life_actions + [player addAction["Place Spike Strip",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;};},"",999,false,false,"",'!isNull life_spikestrip']];
//Use Chemlights in hand
life_actions = life_actions + [player addAction["Chemlight (RED) in Hand",life_fnc_chemlightUse,"red",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_red" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (YELLOW) in Hand",life_fnc_chemlightUse,"yellow",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_yellow" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (GREEN) in Hand",life_fnc_chemlightUse,"green",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_green" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Chemlight (BLUE) in Hand",life_fnc_chemlightUse,"blue",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_blue" in (magazines player) && vehicle player == player ']];
//Drop Chemlight
life_actions = life_actions + [player addAction["Drop Chemlight",{if(isNil "life_chemlight") exitWith {};if(isNull life_chemlight) exitWith {};detach life_chemlight; life_chemlight = nil;},"",-1,false,false,"",'!isNil "life_chemlight" && !isNull life_chemlight && vehicle player == player ']];
//Custom Heal
life_actions = life_actions + [player addAction["<t color='#FF0000'>Heal Self</t>",life_fnc_heal,"",99,false,false,"",' vehicle player == player && (damage player) > 0.25 && ("FirstAidKit" in (items player)) && (currentWeapon player == "")']];
//Custom Repair
life_actions = life_actions + [player addAction["<t color='#FF0000'>Repair Vehicle</t>",life_fnc_repairTruck,"",99,false,false,"", ' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (damage cursorTarget) > 0.001 && ("ToolKit" in (backpackItems player)) && (player distance cursorTarget < ((boundingBox cursorTarget select 1) select 0) + 2) ']];
//Service Truck Stuff
life_actions = life_actions + [player addAction["<t color='#0000FF'>Service Nearest Car</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "C_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions +
[player addAction["Push",life_fnc_pushVehicle,"",0,false,false,"",
'!isNull cursorTarget && player distance cursorTarget < 4.5 && cursorTarget isKindOf "Ship"']];
*/
