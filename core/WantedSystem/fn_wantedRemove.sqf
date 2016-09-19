/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Removes a person from the wanted list.
*/
private["_uid","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {}; //Bad data

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