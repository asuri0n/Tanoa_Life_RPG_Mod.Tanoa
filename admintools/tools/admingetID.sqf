_unit = cursorTarget;
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

[[_unit,player],"STS_fnc_getID",false,false] spawn life_fnc_MP;