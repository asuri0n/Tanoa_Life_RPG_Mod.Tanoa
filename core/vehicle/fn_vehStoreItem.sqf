#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_indexFrom","_valFrom","_dataFrom","_oldFrom","_weightFrom"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call life_fnc_isnumber)) exitWith {hint "Format incorrect";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Tu dois entrer un chiffre suppérieur à 1!";};
if (isNull life_vehicle_transfer_from) exitWith {hint "le véhicule source a disparu!";};
if (isNull life_vehicle_transfer_to) exitWith {hint "le véhicule cible a disparu!";};
if(!alive player) exitwith {[] call life_fnc_vehInventoryClose;};

if(_ctrl == "organ" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F" OR life_trunk_vehicle isKindOf "Ship")}) exitWith {hint "You cannot store that in anything but a land vehicle!"};
if(_ctrl == "uranium1" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F" OR life_trunk_vehicle isKindOf "Ship")}) exitWith {hint "You can't Add Uranium In Elicopter For Somes Reasons."};


[life_vehicle_transfer_from, life_vehicle_transfer_to, _ctrl, _num] call life_fnc_vehTransferItems;
[] call life_fnc_vehInventory;