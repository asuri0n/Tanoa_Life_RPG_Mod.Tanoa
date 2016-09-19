/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item","_container","_closePlayers"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

[1] call SOCK_fnc_updateRequestCivGear;
if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

_closePlayers = count (player nearEntities ["Man", 10]);
if (_closePlayers > 1) then
{
	[[format["%1 a prit %2 dans %3 aux coordonnees %4",name player, _item, typeOf _container, getPosATL player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {[_unit, _container] spawn life_fnc_inventoryClosed;};

switch(playerSide) do
{
	case west: {}; //Blah
	case civilian: {
		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in ["U_Dep"]) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
	case independent: {};
};
