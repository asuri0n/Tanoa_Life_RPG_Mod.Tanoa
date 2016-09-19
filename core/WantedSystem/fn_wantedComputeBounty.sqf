/*
	Filename: fn_wantedComputeBounty.sqf
	Author: Komodo

	Description: uses the list of crimes of given PID and returns total Bounty
*/

private ["_uid","_index","_bounties","_type","_bounty"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;

_index = [_uid, 0, invo_wanted_list] call life_fnc_indexInTable;

_bounties = (invo_wanted_list select _index) select 1;
_bounty = 0;
{
	_type  = [_x select 0] call INVO_fnc_wantedCodeCfg;
	_bounty = _bounty + (_type select 1) * (_x select 1);
} count _bounties;

_bounty;