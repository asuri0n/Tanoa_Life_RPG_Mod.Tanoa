/*
	File: fn_wantedBounty.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Checks if the person is on the bounty list and awards the cop for killing them.
*/
private["_civ","_cop","_id","_half","_bounties","_sum","_code","_occurrences","_type"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_cop = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_half = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ OR isNull _cop) exitWith {};

_id = [(getPlayerUID _civ),invo_wanted_list] call life_fnc_index;
if(_id != -1) then
{
	_bounties = (invo_wanted_list select _id) select 1;
	_sum = 0;
	{
		_code = _x select 0;
		_occurrences = _x select 1;

		_type = [_code] call INVO_fnc_wantedCodeCfg;
		_sum = _sum + (_type select 1) * _occurrences;
	} count _bounties;

	if(_half) then
	{
		[[(_sum / 2), _sum],"life_fnc_bountyReceive",_cop,false] spawn life_fnc_MP;
	}
		else
	{
		[[_sum, _sum],"life_fnc_bountyReceive",_cop,false] spawn life_fnc_MP;
	};
};