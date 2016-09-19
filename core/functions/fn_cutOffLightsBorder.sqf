/*
	File: fn_cutOffLightsBorder.sqf
	Author: Voltox


*/
private["_types","_lights"];
_types = ["Lamps_Base_F", "PowerLines_base_F", "A3_Air_F_Heli_Light_01", "A3_Structures_F_Civ_Lamps", "A3_Structures_F_Items_Electronics", "Land_LampHarbour_F", "Land_LampHalogen_F","_switch"];
_switch = [_this,0,"ON",["ON"]] call BIS_fnc_param;

_lights = nearestObjects [position transfo,_types,250];
{
	_x switchLight "_switch";
	_x sethit["light_1_hitpoint",1];
	_x sethit["light_2_hitpoint",1];
	_x sethit["light_3_hitpoint",1];
	_x sethit["light_4_hitpoint",1];
}foreach _lights;
