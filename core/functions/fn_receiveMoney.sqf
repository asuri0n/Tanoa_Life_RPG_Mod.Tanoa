/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call life_fnc_isnumber)) exitWith {};
if(_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format["%1 vous a donné $%2",[_from] call life_fnc_getPlayerName,[(parseNumber (_val))] call life_fnc_numberText];
life_liquide = life_liquide + (parseNumber(_val));
["receiveMoney", false, (parseNumber(_val))] call life_fnc_antiCheatCash;
