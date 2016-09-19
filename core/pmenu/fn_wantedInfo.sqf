/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls back information about the wanted criminal.
*/
private["_display","_list","_crimes","_type","_occurrences"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_mylist = [];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {_list lbAdd "Impossible";};
if(typeName _data != "ARRAY") exitWith {_list lbAdd "Impossible";};
if(count _data == 0) exitWith {_list lbAdd "Impossible";};
lbClear _list;

_crimes = _data select 1;

{
	_type = [_x select 0] call INVO_fnc_wantedCodeCfg;
	_occurrences = _x select 1;
	_list lbAdd format["%1 %2", _occurrences, _type select 0];
} foreach _crimes;

ctrlSetText[2403,format["Prix de la prime: $%1",[[_data select 0] call INVO_fnc_wantedComputeBounty] call life_fnc_numberText]];