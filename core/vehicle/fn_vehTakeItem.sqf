#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff","_mWeight","_totalWeight","_itemWeight","_veh_data","_inv","_indexFrom","_val"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {hint "Le véhicule est supprimé ou détruit."};
if(!alive player) exitwith {[] call life_fnc_vehInventoryClose;};

if((lbCurSel 3502) == -1) exitWith {hint "Tu dois sélectionner un objet!";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call life_fnc_isnumber)) exitWith {hint "Format non valide.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Tu ne peux pas entrer un nombre inférieur à 1!";};

[life_trunk_vehicle, life_vehicle_transfer_from, _ctrl, _num] call life_fnc_vehTransferItems;
[] call life_fnc_vehInventory;
