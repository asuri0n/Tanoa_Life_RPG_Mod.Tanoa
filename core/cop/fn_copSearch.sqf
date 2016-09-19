#include <macro.h>
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns information on the search.
*/
life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];
private["_civ","_invs","_license","_robber","_guns","_gun"];

if (isServer && isDedicated) exitWith {};

_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_robber = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_index = [_x select 0,__GETC__(sell_array)] call life_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((__GETC__(sell_array) select _index) select 1));
		};
	} foreach _invs;
	if(_illegal > 6000) then
	{
		[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"] call INVO_fnc_wantedAdd;
	};

	[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"] call INVO_fnc_wantedAdd;
	[[0,format["%1 avait %2 $ de contrebande sur lui.",(_civ getVariable["realname",name _civ]),[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
}
	else
{
	_inv = "No illegal items";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format["Impossible de rechercher %1",_civ getVariable["realname",name _civ]]};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Items Illegaux</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Robbed the bank"} else {""}];

if(_robber) then
{
	[[0,format["%1 a été identifié comme le braqueur de la banque!",(_civ getVariable["realname",name _civ])]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};