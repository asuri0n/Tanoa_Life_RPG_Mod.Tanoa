/*
	Filename: fn_computeOwnCrimes.sqf
	Author: Komodo

	Description: computes list of crimes to be saved in DB with player data.
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];

    Komodo: invo_wanted_list == life_wanted_list V2
    format: [uid, [[crime,quantity]]]
*/

private ["_crimes"];

_crimes = [];
{
	if ((_x select 0) == getPlayerUID player) exitWith
	{
		_crimes = (_x select 1);
	};
} forEach invo_wanted_list;

_crimes;