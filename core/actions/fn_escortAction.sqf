/*
	File: fn_escortAction.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if(_unit getVariable "AGM_isUnconscious") exitWith {hint "Impossible sur une personne inconsciente, utilises le menu interaction @AGM.";};
//if(!(side _unit in [civilian,independent])) exitWith {};
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
player reveal _unit;