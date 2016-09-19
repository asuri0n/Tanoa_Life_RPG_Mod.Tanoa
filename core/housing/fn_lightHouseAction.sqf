/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lights up the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house getVariable ["light01",ObjNull]) || isNull (_house getVariable ["light02",ObjNull]) || isNull (_house getVariable ["light03",ObjNull]) || isNull (_house getVariable ["light04",ObjNull]) || isNull (_house getVariable ["light05",ObjNull]) || isNull (_house getVariable ["light06",ObjNull]) || isNull (_house getVariable ["light07",ObjNull]) || isNull (_house getVariable ["light08",ObjNull]) || isNull (_house getVariable ["light09",ObjNull]) || isNull (_house getVariable ["light10",ObjNull])) then 
{ 
	[[_house,true],"life_fnc_lightHouse",true,false] spawn life_fnc_MP;
} else {
	[[_house,false],"life_fnc_lightHouse",true,false] spawn life_fnc_MP;
};