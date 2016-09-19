/*
	File: fn_waitSound.sqf
	Author: Bloopis
	Date : 04/27/2014
	Description:
	restrict a sound

	Parameter(s) :
		- NUMBER : time to wait
		- STRING : variable name

	Returns:
		NULL
*/

private["_time","_variable"];
_time = [_this,0,10,[0]] call BIS_fnc_param;
_variable = [_this,1,"",[""]] call BIS_fnc_param;

player setVariable["isHorn",true,true];
sleep _time;
player setVariable["isHorn",false,true];