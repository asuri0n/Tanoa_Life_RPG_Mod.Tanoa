/*
	File: fn_copBeep.sqf
	Traduction : Skydred
	File: fn_houseSoundOpen.sqf
*/
private["_vehicle"];
//_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicle = CursorTarget;

if(isNull _vehicle) exitWith {};
_distance = player distance _vehicle;
if ( _distance <= 25 ) then
{
_vehicle say3D "fermeture";
};