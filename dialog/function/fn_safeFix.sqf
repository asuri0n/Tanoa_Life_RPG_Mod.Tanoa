/*
	Author: Tonic
	Filename: fn_safeFix.sqf
	I am so tired of writing this.
*/
private["_vault","_title","_ui","_progressBar","_titleText","_cP","_lastPlayMove"];
_vault = _this select 0;
if(!(_vault getVariable["safe_open",false])) exitWith {hint "The vault is already locked?"};

life_action_inUse = true;
/*player setVariable ["AGM_canTreat", false, true];*/

//Setup the progress bar
disableSerialization;
_title = "Réparation du coffre...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_lastPlayMove = 0;

while {true} do
{
	if((_lastPlayMove - time) < 0) then {
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		_lastPlayMove = time + 5.8;
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + .012;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;

_vault setVariable["safe_open",false,true];
hint "Le coffre est a nouveau fermé.";