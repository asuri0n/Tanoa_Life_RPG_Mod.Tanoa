/*
	File: fn_gpsTracker.sqf
	Author: Poseidon
	
	Description: Attaches a gps tracker to selected vehicle
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "Vous ne pouvez pas utiliser le Trackeur de véhicules sur ceci."};
if(player distance _unit > 7) exitWith {hint "Approchez vous du véhicule!"};
if(!([false,"gpstracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
[[player],"life_fnc_GPS_Sound",nil,true] spawn life_fnc_MP;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Vous n'êtes pas à proximité d'un véhicule!","PLAIN"];};
titleText["Vous avez fixé un Trackeur de véhicules à ce véhicule.","PLAIN"];

[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_gpstracker",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Trackeur sur "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	while {true} do {
		if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
		_marker setMarkerPosLocal getPos _veh;
		sleep 0.5;
	};
};