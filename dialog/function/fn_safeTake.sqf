#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {hint "Tu dois sélectionner un objet pour commencer";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
_safeInfo = life_safeObj getVariable["safe",0];

//Error checks
if(!([_num] call life_fnc_isnumber)) exitWith {hint "Mauvais format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Tu ne peux pas entrer un nombre inférieur à 1!";};
if(_ctrl != "goldbar") exitWith {hint "Tu peux juste mettre des lingots d'ors dans ce coffre."};
if(_num > _safeInfo) exitWith {hint format["Il n'y a pas %1 lingot(s) d'ors dans le coffre!",_num];};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Inventaire remplis."};


//Take it
if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Impossible d'en ajouter dans l'inventaire.";};
life_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory;