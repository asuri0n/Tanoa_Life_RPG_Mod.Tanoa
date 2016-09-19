/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Displays wanted list information sent from the server.
	Komodo: seems to list non jailed players in a quite weird manner...
*/
private["_list","_jailedUnits"];
diag_log "INVO DEBUG - wantedfetch";

_jailedUnits = [];
{if(_x distance (getMarkerPos "jail_marker") < 60) then {_jailedUnits pushBack (getPlayerUID _x);};} forEach playableUnits;

_list = [];
{
	_uid = _x select 0;
	if([_uid] call life_fnc_isUIDActive) then
	{
		if(!(_uid in _jailedUnits)) then {
			_list pushBack _x;
		};
	};
} foreach invo_wanted_list;

[_list] call life_fnc_wantedList;