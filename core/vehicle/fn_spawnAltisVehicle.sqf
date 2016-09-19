#include <macro.h>
/*
	File: fn_spawnAltisVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_className","_colorIndex","_spawnPoint","_vehicle"];

_className = "B_Truck_01_box_F";
_colorIndex = 0;

_spawnPoint = [((getPos player) select 0) - 3, ((getPos player) select 1) + 3, 0];

//Spawn the vehicle and prep it.
_vehicle = _className createVehicle (_spawnPoint);
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle lock 2;
[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;
/* [[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP; */
_vehicle allowDamage true; //Re-enable damage handling.
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle setVariable["trunk_in_use",false,true];
_vehicle setVariable["trunk_in_use_by","",true];
_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
sleep 3;
_vehicle setdamage 0;

life_vehicles pushBack _vehicle; //Add err to the chain.

//[] call SOCK_fnc_updateRequest; Sync silently because it's obviously silently..
//closeDialog 0; //Exit the menu.
true;

//TBD: insert code here to put in inventory stuff when necessary.
//_vehicle setVariable["Trunk",[[["crystalmethpur",125]],500],true];
_vehicle setVariable["Trunk",[[["goldbar",41]],492],true];