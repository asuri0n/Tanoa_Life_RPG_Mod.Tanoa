/*
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_unit","_entry"];

disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayctrl 2401;

{
	_entry = _x;
	_unit = objNull;
	{
		if (_entry select 0 == getPlayerUID _x) exitWith {_unit = _x;};
	} count playableUnits;
	if (_unit != objNull) then
	{
		_list lbAdd format["%1", (name _unit)];
		_list lbSetData [(lbSize _list)-1,str(_entry)];
	};
} foreach _info;

ctrlSetText[2404,"Connexion au seveur du central"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "Aucun bandits";
};