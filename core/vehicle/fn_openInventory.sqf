#include "..\..\script_macros.hpp"
/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data","_nearVehiclesCtrl","_color","_text","_name","_vehFrom","_pic","_i","_display","_nearPlayers","_found"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F")) exitWith {}; //Either a null or invalid vehicle type.

if((_vehicle getVariable ["trunk_in_use",false])) exitWith
{
	hint "L'inventaire est déjà utilisé.";

	//Komodo: handles the case where inventory lock made by people who disconnected without leaving inventory menu properly.
	_nearPlayers = _vehicle nearEntities ["Man", 100];
	_found = false;
	{
		if (getPlayerUID _x == _vehicle getVariable ["trunk_in_use_by",""]) exitWith {_found = true;};
	} forEach _nearPlayers;

	if (!_found) then
	{
		_vehicle setVariable["trunk_in_use",false,true];
		_vehicle setVariable["trunk_in_use_by","",true];
	};
};
_vehicle setVariable["trunk_in_use",true,true];
_vehicle setVariable["trunk_in_use_by",getPlayerUID player,true]; //Komodo: anti-cheat v2: stocker le dernier accès à l'inventaire, et vérifier dès que possible si c'est la bonne personne.
if(!createDialog "TrunkMenu") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

life_vehicle_transfer_to = _vehicle;

waitUntil {!isNull (findDisplay 3500)};
_display = findDisplay 3500;

/* Komodo: adding system to select from wich inventory we should pickup items */

_nearVehiclesCtrl = _display displayCtrl 3499;
lbClear _nearVehiclesCtrl;
_nearVehiclesCtrl lbAdd "Inventaire (personnage)";
_nearVehiclesCtrl lbSetData [0,"Inventaire"];

//diag_log "Inventory From: Control set";

for "_i" from 0 to (count life_vehicles)-1 do
{
	_vehFrom = life_vehicles select _i;

	if(!isNull _vehFrom && alive _vehFrom && (player distance _vehFrom < 12) && (_vehicle != _vehFrom)) then
	{
		//diag_log "Inventory From: in loop";
		_color = [(typeOf _vehFrom),(_vehFrom getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
		_text = format["(%1)",_color];
		if(_text == "()") then
		{
			_text = "";
		};

		_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehFrom) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _vehFrom) >> "picture");
		_nearVehiclesCtrl lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _vehFrom),_text];

		if(_pic != "pictureStaticObject") then {
			_nearVehiclesCtrl lbSetPicture [(lbSize _nearVehiclesCtrl)-1,_pic];
		};

		_nearVehiclesCtrl lbSetData [(lbSize _nearVehiclesCtrl)-1,str(_i)];
	};
};

/* _nearVehiclesCtrl lbSetCurSel 0; - this might be source of issues, deleted. */

/* Komodo: end of added bloc */

if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format["Inventaire maison - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format["Inventaire véhicule - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

if(_vehicle isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith
{
	hint "Tu dois installer un container pour pouvoir utiliser le stockage !";
	closeDialog 0;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["trunk_in_use_by","",true];
};
if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith
{
	closeDialog 0;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["trunk_in_use_by","",true];
	hint "Ce véhicule ne posséde pas de coffre :/";
};

ctrlSetText[3504,format["Weight: %1/%2",_veh_data select 1,_veh_data select 0]];
//[_vehicle] call life_fnc_vehInventory; removed for direct transfer system, _vehicle is stored in a global varialbe
[] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

//Komodo: function to save data to database when life inventory menu is closed.
_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	sleep 5; //Komodo: to ensure server has enough time to gather information...

	//Saving content of "to" house to the DB
	_this setVariable["trunk_in_use",false,true];
	_this setVariable["trunk_in_use_by","",true];
	if(_this isKindOf "House_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
	};

	//Komodo: here I ensure that the house trunk ge saved even if it wasn't the last selected source...
	if (!(isNull life_vehicle_transfer_house) && (life_vehicle_transfer_house != life_vehicle_transfer_from)) then {[[life_vehicle_transfer_house],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;};

	if (!isNull life_vehicle_transfer_from && life_vehicle_transfer_from != player) then {
		life_vehicle_transfer_from setVariable["trunk_in_use",false,true];
		life_vehicle_transfer_from setVariable["trunk_in_use_by","",true];
		if (life_vehicle_transfer_from isKindOf "House_F") then {
			[[life_vehicle_transfer_from],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
		};
		life_vehicle_transfer_from = ObjNull;
	};

	if (!isNull life_vehicle_transfer_to) then
	{
		life_vehicle_transfer_to setVariable["trunk_in_use",false,true];
		life_vehicle_transfer_to setVariable["trunk_in_use_by","",true];
	};
	life_vehicle_transfer_to = Objnull;
	life_vehicle_transfer_house = ObjNull;

	if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
        if ((_this isKindOf "Car") || (_this isKindOf "Air") || (_this isKindOf "Ship")) then {
        	[[_this,2], "TON_fnc_vehicleUpdate",false,false] spawn life_fnc_MP;
        };
    };
};