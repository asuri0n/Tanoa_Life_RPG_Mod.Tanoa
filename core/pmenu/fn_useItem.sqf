/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item","_target"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Tu dois d'abord sélectionner un objet!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item =="marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
	};

	case (_item =="bottledwhiskey"):
	{
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};

	case (_item =="bottledshine"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};

	case (_item =="wine"):
	{
		if(playerSide in [independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkwine;
		};
	};

	case (_item =="bottledbeer"):
	{
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	case (_item == "water" or _item == "coffee" or _item == "grapejuice"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};

	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): {
		if ( (player distance ( getMarkerPos "national_bank")) < 300 ) then
		{
			player reveal fed_bank_1;
			(group player) reveal fed_bank_1;
			player reveal fed_bank_2;
			(group player) reveal fed_bank_2;
			player reveal fed_bank_3;
			(group player) reveal fed_bank_3;
			[cursorTarget] spawn life_fnc_blastingCharge;
		};

		if ( (player distance ( getMarkerPos "breach")) < 30 ) then
		{
			[] spawn INVO_fnc_wallDestruction;
		};

		if ((cursorTarget isKindOf "LandVehicle") OR (cursorTarget isKindOf "Ship") OR ((cursorTarget isKindOf "Air"))) then
		{
			[cursorTarget] spawn INVO_fnc_blastingChargeUse;
		};
	};

	case (_item == "masonry_kit"):
	{
		if ( (player distance ( getMarkerPos "breach")) < 30 ) then
		{
			[] spawn INVO_fnc_wallReconstruction;
		};
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText["Tu peux maintenant courrir plus vite","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Tu es déja en train de poser une herse"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Impossible quand tu es dans un véhicule!"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","hamburger","frites","cheeseburger","applecompote","peachcompote","grapes"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe" OR _item=="machete"):
	{
		//[] spawn life_fnc_pickAxeUse;
		[_item] spawn life_fnc_farmingToolUse;
	};
	 case (_item == "barriere"):
	{
		if(!isNull life_barriere) exitWith {hint "Tu es déjà en train de déployer une barrière"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_barriere;
		};
	};

	case (_item == "barriereStop"):
	{
		if(!isNull life_barrierestop) exitWith {hint "Tu es déjà en train de déployer une barrière Stop"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_barriereStop;
		};
	};

	case (_item == "conewithlight"):
	{
		if(!isNull life_barriere) exitWith {hint "Tu es déjà en train de déployer une barrière"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_conewithlight;
		};
	};
	case (_item == "poison"):
	{
		if((isNull cursortarget) OR (alive cursortarget /*&& !(cursortarget getVariable "AGM_isUnconscious")*/)) exitWith {hint "Impossible d'effectuer cette action"};
		if(!isNull cursortarget && alive cursortarget/* && cursortarget getVariable "AGM_isUnconscious"*/) then
		{
			[] spawn
			{
				private ["_targetPlayer","_startPos"];
				life_action_in_use = true;
				_targetPlayer = cursorTarget;
				_startPos = getPosATL player;
				hint "Tu es en train d'empoisonner cette personne, ne bouge pas pendant 6 secondes.";
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
				sleep(6);
				if (!alive player) exitWith {};
				if ((player distance _startPos) > 2) exitWith {hint "Tu crois pouvoir empoisonner en bougeant?"; life_action_in_use = false;};
				[getPlayerUID player,name player,player,"187"] call life_fnc_addWantedCond;
				// [[getPlayerUID player,name player,"187"],"INVO_fnc_wantedAdd",false,false] spawn BIS_fnc_MP;
				_targetPlayer setDamage 1;
				life_action_in_use = false;
		 		player playActionNow "stop";
		 	};
		};
	};
	case (_item == "gpstracker"): 
	{
		[cursorTarget] spawn life_fnc_gpsTracker;
	}; 
	default
	{
		hint "Cet objet n'est pas utilisable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;