/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;

//Update food
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
//Update Water
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
//Update Health
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;