#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	filename: fn_inventoryClosed.sqf
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container","_house"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

[1] call SOCK_fnc_updateRequestCivGear;

_container setVariable["accessed_by","",true];

if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then
{
	_house = _container getVariable ["house", ObjNull];
	if (isNull _house OR !(_house isKindOf "House_F")) exitWith {hint "Problème avec le système de gestion des maisons. Ne stockez rien et avertissez un admin.";};
	_house setVariable ["syncInProgressTrunk", true, true];
	sleep 8;
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
	[] call SOCK_fnc_updateRequest; //sync data pour éviter les duplis avant le restart. Et plein de requettes en plus à cause des abus...
	sleep 4;
	_house setVariable ["syncInProgressTrunk", false, true];
} else {
	PlaySound "zipdown";
};

if (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    if ((_container isKindOf "Car") || (_container isKindOf "Air") || (_container isKindOf "Ship")) then {
			[[_container,1], "TON_fnc_vehicleUpdate",false,false] spawn life_fnc_MP;
    };
};
