/*
	File: fn_CivunrestrainAction.sqf
	Author: Skalicon
	Traduction : Skydred
	Description:
	Unrestrains player
*/
private["_unit"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

_unit playMoveNow "AmovPercMstpSnonWnonDnon";
_unit setVariable["civrestrained",false,true];
_unit setVariable["playerSurrender",false,true];

life_disable_actions = false;
life_abort_enabled = true;