/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Allows cops to 'kick' in the door?
*/
private["_house","_door","_title","_titleText","_progressBar","_cpRate","_cP","_uid","_lastPlayMove"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Cette maison n'a pas de propriétaires."};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint "Cette personne n'est pas en ligne, vous ne pouvez pas piller sa maison!"};

_door = [_house] call life_fnc_nearestDoor;
if(_door == 0) exitWith {hint "Vous n'êtes pas près d'une porte!"};
if((_house getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "La porte est déjà débloqué!"};

life_action_inUse = true;
player setVariable ["AGM_canTreat", false, true];

//Setup the progress bar
disableSerialization;
_title = "Crochettage de la porte";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0092;

[[2,format["%1 votre maison est attaquée par les flics!",(_house getVariable "house_owner") select 1]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

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
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];
_house animate [format["door_%1_rot",_door],1];
_house setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.