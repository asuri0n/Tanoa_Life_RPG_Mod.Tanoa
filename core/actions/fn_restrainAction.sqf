/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
[[0,format["%1 was restrained by %2",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
*/
private["_unit"];

if (isServer && isDedicated) exitWith {};

_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if((player getVariable "restrained")) exitWith {};
//if((side _unit == west) && (__GETC__(life_adminlevel) == 0)) exitWith {};//add admin autorisation to restrain cop
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
_unit setVariable["playerSurrender",false,true];
_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
//AJOUT SKY LE 10/08/2014 pour rajouter les actions médic
//Si la personne est côté BLUEFOR alors :
if(playerSide == west) then {
	[[0,format["%1 a été menotté par %2", name _unit, name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	}
//sinon (médic ou admin)
else{
	[[0,format["%1 a été mis sous camisole par %2 au vu de l'urgence psychiatrique", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};