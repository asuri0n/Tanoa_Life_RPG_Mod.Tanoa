/*
	File: fn_houseSoundOpen.sqf
	Traduction : Skydred
*/
private["_vehicle"];
_vehicle = player;
if(isNull _vehicle) exitWith {};
_distance = player distance _vehicle;
if ( _distance <= 25 ) then
{
_vehicle say3D "ouverture";

};