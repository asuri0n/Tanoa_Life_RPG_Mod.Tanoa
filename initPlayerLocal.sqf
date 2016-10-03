/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
if(!hasInterface) exitWith {diag_log "HC PLAYER CONNECTED";}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

[] spawn {
    waitUntil {!isNil "life_pumps"};
    scriptName "Refuel Pumps";
    {
    	_x addAction ["<t color='#00EB00'>Faire le plein</t>", life_fnc_refuelPump];
    } foreach life_pumps;
};

[] execVM "core\functions\tm4_fuelUptake.sqf";
//[] execVM "addons\vehicleManager.sqf";