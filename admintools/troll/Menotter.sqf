private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

_unit setVariable["restrained",true,true];
[_unit] call life_fnc_addVehicle2Chain;
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;