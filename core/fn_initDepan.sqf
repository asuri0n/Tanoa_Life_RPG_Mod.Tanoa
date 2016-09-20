#include <macro.h>
/*
	File: fn_initDepan.sqf
	Author: Skydred

	Description:
	Initializes the depan..
*/
private["_end"];

//Sauvegarde de la position
_playerPosition = med_position;

player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

	if((__GETC__(life_depanLevel)) < 1) exitWith {
		["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};

if (indep_gear isEqualTo []) then
{
	[] call life_fnc_depanLoadout;
}
else
{
	_handle = [] spawn life_fnc_civLoadGear;
	waitUntil {scriptDone _handle};
};

[] call life_fnc_depanInitActions;

if (life_is_alive == 0 || (typeName _playerPosition != "ARRAY")) then{	
	[] call life_fnc_spawnMenu;	
	waitUntil{!isNull (findDisplay 38500)}; 	
	//Wait for the spawn selection to be open.
	
	waitUntil{isNull (findDisplay 38500)}; 
	//Wait for the spawn selection to be done.
	
	life_is_alive = true; 
	// Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
} else {				
	player setPos _playerPosition;						
	hint format["Vous êtes toujours en vie. Vous avez réapparu au même endroit."];			
	life_is_alive = true;
}; 
[] execVM "admintools\activate.sqf";

//3 radioChannelAdd [player];

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] execVM "core\functions\tm4_fuelUptake.sqf";
//[] spawn life_fnc_antiAFK;

invo_faction = "depan";
player setVariable ["invo_faction","depan",true];
player setVariable["depanlevel", __GETC__(life_depanlevel), true];