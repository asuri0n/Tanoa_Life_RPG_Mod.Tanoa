#include <macro.h>
/*
	Author: Komodo
	FileName: fn_initAlliancesMenu.sqf

	Description: initalizes alliance menu. 2 main variables: existing alliances (accepted and non accepted) and the list of candidate groups to request alliance to.
*/
private ["_myAlliances","_nonAlliedGroups","_myGangId","_index","_tempGroupId","_gangRank","_alliancesCrl","_groupsCtrl","_alliance","_accepted"];

disableSerialization;
_gangRank = player getVariable ["gang_rank",0];

if (_gangRank < 2) exitWith {hint "Impossible d'y accéder avec ton grade.";};

_myGangId = (group player) getVariable["gang_id",-1];
_myAlliances = [];
_nonAlliedGroups = [];

//Init owned & requested alliances: alliance id, other group ID, accepted, view owner group on map, view other group units on map, group name, persistent, is owner of request.
{
	if (_x select 1 == _myGangId) then
	{
		//Is owner of request
		_myAlliances pushBack [_x select 0, _x select 2, _x select 3, _x select 4, _x select 5, _x select 7, _x select 8, true];
	}
	else
	{
		if (_x select 2 == _myGangId) then
		{
			//Is NOT owner of request
			_myAlliances pushBack [_x select 0, _x select 1, _x select 3, _x select 4, _x select 5, _x select 6, _x select 8, false];
		};
	};
} forEach invo_alliances;

//Init non allied groups on Alliance
{
	_tempGroupId = _x getVariable ["gang_id", -1];
	if ((_tempGroupId != -1) AND (_tempGroupId != _myGangId)) then //Should avoid getting medics in. Cops have gang_id of 0 (or one)
	{
		_index = [_tempGroupId, 1, _myAlliances] call life_fnc_IndexInTable;
		if (_index == -1 && _tempGroupId > 0) then {_nonAlliedGroups pushBack _x;};
	};
} forEach allGroups;

diag_log format ["INVO_DEBUG - initAlliancesMenu - ma: %1; nag: %2", _myAlliances, _nonAlliedGroups];

if(!(createDialog "life_group_alliances_menu")) exitWith {diag_log "INVO_DEBUG - initAlliancesMenu failure createDialog";};
waitUntil{!isNull (findDisplay 47000)};
ctrlShow [47006,false];
ctrlShow [47007,false];
ctrlShow [47008,false];

_alliancesCrl = getControl(47000,47002);
lbClear _alliancesCrl;
{
	if (_x select 2 == 1) then {_accepted = "Acceptée";}
	else {_accepted = "En Attente";};
	_alliancesCrl lbAdd format["%1 - %2",(_x select 5),_accepted];
	_alliancesCrl lbSetData [(lbSize _alliancesCrl)-1,format ["%1", _x select 0]];
} forEach _myAlliances;
lbSort [_alliancesCrl, "ASC"];

_groupsCtrl = getControl(47000,47009);
lbClear _groupsCtrl;
{
	_groupsCtrl lbAdd format["%1",_x getVariable["gang_name","Sans Nom"]];
	_groupsCtrl lbSetData [(lbSize _groupsCtrl)-1,format ["%1", _x getVariable ["gang_id",-1]]];
} foreach _nonAlliedGroups;
lbSort [_groupsCtrl, "ASC"];