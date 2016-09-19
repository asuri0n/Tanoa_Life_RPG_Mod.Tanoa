#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;
_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;

//Error checks
if(!([_num] call life_fnc_isnumber)) exitWith {hint "Mauvais format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Tu ne peux pas entrer un nombre inférieur à 1!";};
if(_ctrl != "goldbar") exitWith {hint "Tu peux juste mettre des lingots d'ors dans ce coffre."};
if(_num > life_inv_goldbar) exitWith {hint format["Tu n'as pas %1 lingot(s) d'ors",_num];};

//Store it.
if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Impossible de supprimer le(s) objet(s) de ton inventaire pour les mettre dans le coffre.";};
_safeInfo = life_safeObj getVariable["safe",0];
life_safeObj setVariable["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory;