/*
	Filename: fn_demoChargeTimer.sqf
	Author: Tonic

	Description: unknown
*/
if (isServer && isDedicated) exitWith {};

private["_uiDisp","_time","_timer","_vault"];
_vault = _this select 0;
disableSerialization;

if (invo_demoChargeTimerInUse) exitWith {sleep (15 * 60);};

invo_demoChargeTimerInUse = true;

6 cutRsc ["life_timer","PLAIN"];
_uiDisp = uiNamespace getVariable "life_timer";
_timer = _uiDisp displayCtrl 38301;
_time = time + (15 * 60);
while {true} do {
	if(isNull _uiDisp) then {
		6 cutRsc ["life_timer","PLAIN"];
		_uiDisp = uiNamespace getVariable "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if(round(_time - time) < 1) exitWith {};
	if(!(_vault getVariable["chargeplaced",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS"] call BIS_fnc_secondsToString];
	sleep 10;
};
6 cutText["","PLAIN"];
invo_demoChargeTimerInUse = false;