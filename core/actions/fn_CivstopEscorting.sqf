/*
	File: fn_CivstopEscorting.sqf
	Author & Traduction : Skydred	
	Description:
	ASFSDFHAGFASF
*/
private["_unit"];
if((_unit getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "civrestrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable "Escorting")) exitWith {}; //He's not being Escorted.
if(isNull _unit) exitWith {}; //Not valid
detach _unit;
_unit setVariable["Escorting",false,true];