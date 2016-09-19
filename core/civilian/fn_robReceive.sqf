/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText["Il n'a pas un radis..","PLAIN"]};

life_liquide = life_liquide + _cash;
["robReceive", false, _cash] call life_fnc_antiCheatCash;
titleText[format["Tu as volé %1€",[_cash] call life_fnc_numberText],"PLAIN"];