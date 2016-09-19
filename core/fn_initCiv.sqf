#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos","_allVeh","_pUID","_playerPosition"];

//Sauvegarde de la position
_playerPosition = civ_position;
diag_log format ["initciv pos: %1",_playerPosition]; //For debugging

// Liste des spawns
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_5 = nearestObjects[getMarkerPos  "civ_spawn_5", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];

waitUntil {!(isNull (findDisplay 46))};
diag_log format ["life_is_arrested %1",life_is_arrested];

//if(str(player) in ["civ_1","civ_2","civ_3","civ_4","civ_5","civ_6","civ_7","civ_8","civ_9","civ_10","civ_11","civ_12","civ_13","civ_14","civ_15","civ_16","civ_17","civ_18","civ_19","civ_20","civ_21","civ_22","civ_23","civ_24","civ_25","civ_26","civ_27","civ_28","civ_29","civ_30"]) then {
if(str(player) in ["don_1","don_2","don_3","don_4","don_5","don_6","don_7","don_8","don_9","don_10"]) then {
	if((__GETC__(life_donator) < 1)) then
	{
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

/*****
SAUVEGARDE DE LA POSITION
******/
/*
diag_log "------------- Life is alive -------------";
diag_log format["civ position: %1",civ_position];
diag_log format["Life is alive: %1",life_is_alive];
diag_log "------------------------------------------------";
*/
if (life_is_alive == 0 || (typeName _playerPosition != "ARRAY")) then {
	[] call life_fnc_spawnMenu;	
	waitUntil{!isNull (findDisplay 38500)}; 	
	waitUntil{isNull (findDisplay 38500)};
	life_is_alive = true;
} else {
	diag_log "entre dans la 2em partie  boucle";
	if(life_is_arrested) then {
		diag_log "Lise_is_arrested";
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	} else {
		player setPos _playerPosition;						
		hint format["Vous êtes toujours en vie. Vous avez réapparu au même endroit."];						
	};
	life_is_alive = true;
};

player addRating 9999999;

[] execVM "admintools\activate.sqf";
if((__GETC__(life_adminlevel)) == 0) then {
	life_liquide=0;
	life_liquide_before=0;
	["initCiv", false, 0] call life_fnc_antiCheatCash;
};

_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
_name = name player;

{
	_owners = _x getVariable ["vehicle_info_owners",[]];
	_index = [_name,_owners] call life_fnc_index;

	if(!(_index == -1)) then {
		life_vehicles pushBack _x;
	};
} foreach _allVeh;
[] execVM "core\functions\tm4_fuelUptake.sqf";
[] spawn life_fnc_updateInvoAllies;
[] spawn life_fnc_antiAFK;

switch (true) do {
    case license_civ_rebel: {invo_faction = "rebel"; player setVariable ["invo_faction","rebel",true];};
    //case license_civ_gangster: {invo_faction = "gangster"; player setVariable ["invo_faction","gangster",true];};
    //case license_civ_bounty_hunter: {invo_faction = "bounty_hunter"; player setVariable ["invo_faction","bounty_hunter",true];};
    default {invo_faction = "civilian"; player setVariable ["invo_faction","civilian",true];};
};