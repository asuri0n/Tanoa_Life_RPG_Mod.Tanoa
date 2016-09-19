/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == ObjNull) exitWith {};

titleText[format["Tu a été assommé par %1",[_who] call life_fnc_getPlayerName],"PLAIN"];
[[format["%1 a ete assomme par %2",_target,(name _who)]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
player playMoveNow "Incapacitated";
_obj = createVehicle ["Land_ClutterCutter_small_F", getPosATL player, [], 0, "NONE"];
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];