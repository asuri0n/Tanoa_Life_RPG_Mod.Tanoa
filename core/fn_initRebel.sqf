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
if (VACA_SERV_DEBUG) then
{
	diag_log format ["initciv reb: %1",_playerPosition]; //For debugging
};

// Liste des spawns
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];
civ_spawn_5 = nearestObjects[getMarkerPos  "civ_spawn_5", ["Land_Shop_City_02_F","Land_Shop_City_01_F"],250];

waitUntil {!(isNull (findDisplay 46))};

if(!license_civ_rebel) then
{
	player enableSimulation false;
	["noRebel",false,true] call BIS_fnc_endMission;
	sleep 35;
};

/*****
SAUVEGARDE DE LA POSITION
******/

if (VACA_SERV_DEBUG) then
{
	diag_log "------------- Life is alive -------------";
	diag_log format["reb position: %1",civ_position];
	diag_log format["Life is alive: %1",life_is_alive];
	diag_log "------------------------------------------------";
};

if (life_is_alive == 0 || (typeName _playerPosition != "ARRAY")) then {
	if(life_is_arrested) then {
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	} else {
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)};
		waitUntil{isNull (findDisplay 38500)};
	};
	life_is_alive = true;
} else {
	if(life_is_arrested) then {
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

invo_faction = "rebel"; player setVariable ["invo_faction","rebel",true];

[] call life_fnc_playerSkins;