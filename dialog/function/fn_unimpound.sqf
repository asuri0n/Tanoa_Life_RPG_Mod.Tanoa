#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.
	Komodo: added code to limit certain vehicles depending on number of players in group.
*/
private["_vehicle","_vehicleType","_vid","_pid","_unit","_price","_limitedVehiclesCount","_playersInGroupCount","_vehiclesLimit","_exit","_vehPrice"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
_vehiclesLimit = 0;

if(isNil "_vehicle") exitWith {hint "ERREUR..."};

if (((_vehicle find "_") == -1)) then {_vehicleType = _vehicle select 0;}
else {_vehicleType = _vehicle;};


// Get vehicle garage price
_price = [_vehicleType,__GETC__(life_garage_prices)] call life_fnc_index;
if(_price == -1) then {
	// get vehicule buy price
	_vehPrice = [_vehicleType] call life_fnc_getPriceVeh;
	_price = _vehPrice*(call sortieVhlCoef);
} else {
	_price = (__GETC__(life_garage_prices) select _price) select 1;
};
if(life_dabliquide < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};


_exit = false;
_playersInGroupCount = count (units (group player));
if (_playersInGroupCount <= 4) then
{
	_vehiclesLimit = 2;
}
else
{
	_vehiclesLimit = 3;
};
/* diag_log format ["DEBUG: - unimpound - veh: %1, type: %2",_vehicle, _vehicleType]; */
if (_vehicleType in invo_limited_vehicles) then
{
	_limitedVehiclesCount = count ([group player, invo_limited_vehicles] call INVO_fnc_vehiclesInGangOfType);

	if (_limitedVehiclesCount >= _vehiclesLimit) exitWith {hint "Ton groupe a déjà trop de blindés!!"; _exit = true;};
	diag_log format ["DEBUG: - unimpound - veh: %1; limitCount: %2, vehLimite: %3", _vehicle, _limitedVehiclesCount, _vehiclesLimit];
};

if (_vehicleType in invo_limited_vehicles_armed) then
{
	_limitedVehiclesCount = count ([group player, invo_limited_vehicles_armed] call INVO_fnc_vehiclesInGangOfType);

	if (_limitedVehiclesCount >= _vehiclesLimit) exitWith {hint "Ton groupe a déjà trop de véhicules armés!!"; _exit = true;};
	diag_log format ["DEBUG: - unimpound - veh: %1; limitCount: %2, vehLimite: %3", _vehicle, _limitedVehiclesCount, _vehiclesLimit];
};

if (_vehicleType in invo_deprecated_vehicles) then
{
	_exit = true;
	hint "Ce véhicule est temporairement désactivé, vous ne pouvez le sortir, il sera de nouveau disponible lorsque qu'il sera corrigé, dans le cas contraire il sera remboursé (pas de suite!).";
};

if (_exit) exitWith {};

if(typeName life_garage_sp == "ARRAY") then {
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	} else {
		[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	};
};

hint localize "STR_Garage_SpawningVeh";

life_dabliquide = life_dabliquide - _price;
["unimpound", true, -1 * _price] call life_fnc_antiCheatCash;
