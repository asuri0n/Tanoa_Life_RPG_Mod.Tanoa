/*
	Filename: fn_vehIsTank.sqf
	Author: Komodo

	Description:
	return true if the vehicule passed to the function is capable of taking liquids.
*/

private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do {
    case "C_Van_01_fuel_F": {true};
    case "B_Truck_01_fuel_F": {true};

    default {false};
};