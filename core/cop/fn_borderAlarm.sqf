/*
	File: fn_borderAlarm.sqf
	Author: S.Lambert

	Description:
	Starts borderHQ siren when breach on the border
*/
private["_building"];
_building = border_HQ;

if(isNull _building) exitWith {};
_building say3D "bankalarm";
sleep 23;
_building say3D "bankalarm";
sleep 23;
_building say3D "bankalarm";
sleep 23;