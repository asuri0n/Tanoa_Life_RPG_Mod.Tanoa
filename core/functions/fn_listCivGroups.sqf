/*
	Author: Komodo
	FileName: fn_listCivGroups.sqf

	Description: Lists all groups for civilian faction. To be used on alliances selection
	OBSOLETE (pas de créer une fonction qui ne sert à rien, non? :) )
*/

private ["_result","_groupId"];

_result = [];

{
	_groupId = _x getVariable ["gang_id",-1];
	if (_groupId > 0) then {_result pushBack _x;};
} count allGroups;

_result;