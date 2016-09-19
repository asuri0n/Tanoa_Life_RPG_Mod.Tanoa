/*
	File: fn_arrestAction.sqf

	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable ["restrained",false])) exitWith {hint "Cette personne n'est pas menottée!";}; //He's not restrained.
if(isNull _unit) exitWith {}; //Not valid

[_unit,player,false] call INVO_fnc_wantedBounty;

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false,_time],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
[[0,format[(localize "STR_NOTF_Arrested_1"), _unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;