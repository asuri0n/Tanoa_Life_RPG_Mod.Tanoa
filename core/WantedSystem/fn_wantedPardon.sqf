/*
	File: fn_wantedPardon.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Unwants / pardons a person from the wanted list.
*/
private["_uid","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {};

/*
    Komodo: invo_wanted_list == life_wanted_list V2
    format: [uid, [[crime,quantity]]]
*/
_index = -1;
{
	if (_x select 0 == _uid) exitWith
	{
		_index = _forEachIndex;
	};
} forEach invo_wanted_list;

if (_index != -1) then
{
	invo_wanted_list deleteAt _index;
	publicVariable "invo_wanted_list";
};