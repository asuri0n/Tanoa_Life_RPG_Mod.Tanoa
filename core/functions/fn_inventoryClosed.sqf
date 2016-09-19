/*
	Author: Bryan "Tonic" Boardwine
	filename: fn_inventoryClosed.sqf
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container","_house","_nop"];
_nop = true;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)

_container setVariable["accessed_by","",true];

if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then
{
	_house = _container getVariable ["house", ObjNull];
	diag_log format ["INVO LOGS - TESTTESTTESTTESTTESTTEST : %1", _house];
	
	if (isNull _house OR !(_house isKindOf "House_F")) exitWith {hint "Problème avec le système de gestion des maisons. Ne stockez rien et avertissez un admin.";};
	_house setVariable ["syncInProgressTrunk", true, true];
	sleep 8;
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
	[] call SOCK_fnc_updateRequest; //sync data pour éviter les duplis avant le restart. Et plein de requettes en plus à cause des abus...
	sleep 4;
	_house setVariable ["syncInProgressTrunk", false, true];
	_nop = false;
};


if(_nop) then {
	PlaySound "zipdown";
};
