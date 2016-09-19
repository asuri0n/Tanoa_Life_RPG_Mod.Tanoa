/*
	Author: Komodo
	Filename: fn_getAlliedUnits.sqf

	Description: returns list of allied units.
*/
private ["_unit","_ally","_allyGroup","_return"];

_return = [];

if (invo_allies isEqualTo []) exitWith {};
{
	_ally = _x;
	_allyGroup = _ally select 1;
	//Storing the group if not already encountered once, otherwise using the group units to display icons
	if (_allyGroup getVariable ["gang_id", -10] == -10) then
	{
		{
			if (_ally select 0 == _x getVariable ["gang_id",-10]) exitWith
			{
				_ally set [1,_x];
				_allyGroup = _x;
			};
		} count allGroups;
		if (_allyGroup getVariable ["gang_id", -10] > -1) then {invo_allies set [_forEachIndex, _ally];};
	};

	//Now filling in the list of allied units
	if (_allyGroup getVariable ["gang_id", -10] > -1) then
	{
		{
			_return pushBack _x;
			true;
		} count (units _allyGroup);
	};
} forEach invo_allies;

_return;