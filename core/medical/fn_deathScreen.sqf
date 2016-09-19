/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Yes"} else {"No"};
	_medicsOnline ctrlSetText format["Ambu en ligne: %1",[independent] call life_fnc_playerCount];
	_medicsNear ctrlSetText format["Ambu proche: %1",_nearby];
	sleep 1;
	(isNull (findDisplay 7300))
};