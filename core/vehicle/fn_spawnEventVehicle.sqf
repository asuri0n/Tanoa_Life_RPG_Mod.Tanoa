#include <macro.h>
/*
	File: fn_spawnEventVehicle.sqf
	Author: Komodo

	Description:
	Spawning a rental type vehicle, with inventory already filled in.
	0: vehicle class (default HEMTT)
	1: spawnPoint - [0,0,0]
	2: direction - angle (default 0)
	3: Virtual Inventory (default empty)
	4: Color (default 0)
*/
private["_className","_colorIndex","_virtualInventory","_vehicle","_spawnPoint","_direction"];
_className = [_this,0,"B_Truck_01_box_F",[""]] call BIS_fnc_param;
_spawnPoint = [_this,1,getPosATL player,[[]]] call BIS_fnc_param;
_direction = [_this,2,0,[0]] call BIS_fnc_param;
_virtualInventory = [_this,3,[[],0],[[]]] call BIS_fnc_param;
_colorIndex = [_this,4,0,[0]] call BIS_fnc_param;

invo_createdEventVehicle = objNull;

if(count(nearestObjects[_spawnPoint,["Car","Ship","Air"],5]) != 0) exitWith {hint "Un véhicule bloque le point de spawn.";};

//Spawn the vehicle and prep it.
_vehicle = createVehicle [_className, _spawnPoint, [], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle setDir _direction;
_vehicle lock 2;
[_vehicle,_colorIndex] spawn life_fnc_colorVehicle;


[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle setVariable["trunk_in_use",false,true];
_vehicle setVariable["trunk_in_use_by","",true];
_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
sleep 3;
_vehicle setdamage 0;


life_vehicles pushBack _vehicle; //Add err to the chain.
invo_createdEventVehicle = _vehicle;

_vehicle setVariable["Trunk",_virtualInventory,true];
//_vehicle setVariable["Trunk",[[["crystalmethpur",125]],500],true];