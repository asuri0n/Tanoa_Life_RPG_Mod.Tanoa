/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_lastPlayMove"];
_curTarget = cursorTarget;
life_interrupted = false;
if (life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint "Le véhicule est déja dans ton porte clées."};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format["Crochettage de %1",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions
player setVariable ["AGM_canTreat", false, true];

//Setup the progress bar
disableSerialization;
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
	_cP = _cP + 0.006;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if(!isNil "_badDistance") exitWith {titleText["Tu es trop loin de la cible.","PLAIN"]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};

life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["ziptiesOwners",[],true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 20) then {
		titleText["Tu as maintenant les clées du véhicule.","PLAIN"];
		life_vehicles pushBack _curTarget;
		[getPlayerUID player,profileName,player,"487"] call life_fnc_addWantedCond;
	} else {
		[getPlayerUID player,profileName,player,"215"] call life_fnc_addWantedCond;
		[[0,format["%1 a été vue en train de crochetter un véhicule.",profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		titleText["Le kit de crochetage à cédé","PLAIN"];
	};
	[[player, "alarmevoiture",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
};