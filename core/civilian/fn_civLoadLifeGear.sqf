/*
	Filename: fn_civLoadLifeGear.sqf
	Author: Komodo

	Description:
	Here I need to cut code from civLoadGear in 2 pieces: one to handle Arma stuff loading, another piece tha requiresto be launched after survival init...
	Required to fix "items not being saved" issues...
	OBSOLETE
*/
private["_itemArray","_yItems","_item"];

_itemArray = civ_gear;
_yItems = [_itemArray,18,[],[[]]] call BIS_fnc_param;
diag_log format["INVO DEBUG - fn_civLoadLifeGear - yItems: %1 - yItemArray: %2",_yItems,_itemArray];

{
    _item = [_x,1] call life_fnc_varHandle;
    [true,_item,1] call life_fnc_handleInv;
} foreach (_yItems);