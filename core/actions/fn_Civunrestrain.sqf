/*
	File: fn_Civunrestrain.sqf
	Author & Traduction : Skydred
*/
private["_unit"];
_unit = _this select 0;

if(isNull _unit || !(_unit getVariable "civrestrained") || !(_unit getVariable "civrestrained") ) exitWith {};
if((player getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "civrestrained")) exitWith {hint "Cette action est impossible ou non autorisée."};

detach _unit;
_unit playMoveNow "AmovPercMstpSnonWnonDnon";
_unit setVariable["civrestrained",false,true];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
[[0,format["%1 a été libéré par %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

if(([true,"ziptie",1] call life_fnc_handleInv)) then
{
	titleText["Tu as récupéré tes menottes.","PLAIN"];
};