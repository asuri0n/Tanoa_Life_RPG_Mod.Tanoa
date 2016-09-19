/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicle say3D "gps_tracker";