/*
	File: fn_copBeep.sqf
	Traduction : Skydred
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
_distance = player distance _vehicle;
if ( _distance <= 25 ) then
{
_vehicle say3D "BeepBeep";
};