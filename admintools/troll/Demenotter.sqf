private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
//if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
_unit playMoveNow "AmovPercMstpSnonWnonDnon";
_unit setVariable["restrained",false,true];
_unit setVariable["civrestrained",false,true];
_unit setVariable["ziptiesOwners",[],true];
detach _unit;
[[0,format["%1 a été démenotté par un admninistrateur",name _unit]],"life_fnc_broadcast",true,FALSE] call life_fnc_MP;