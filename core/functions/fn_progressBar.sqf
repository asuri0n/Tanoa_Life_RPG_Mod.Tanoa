/*
	Filename: fn_progressBar.sqf
	Author: Komodo
	Description: spawns a progress bar, that goes from 0 to 100% in given input time
	_duration: time in seconds
	_text: text to display aside percentage
	Use "life_interrupted" to close the progress bar, works only if life_action_inUse set to true.
*/

private ["_duration","_text","_startTime","_ui","_progress","_pgText","_cP"];

_duration = [_this,0,0,[0]] call BIS_fnc_param;
_text = [_this,1,"",[""]] call BIS_fnc_param;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_text];
_progress progressSetPosition 0.01;
_cP = 0;

_startTime = time;

while{true} do
{
	sleep 0.2;
	_cP = ((time - _startTime) / _duration);
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_text];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
	if(!life_action_inUse) exitWith {};
};

5 cutText ["","PLAIN"];