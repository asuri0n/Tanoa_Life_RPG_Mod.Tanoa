/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint "Recherche en cours...";
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Impossible de rechercher cette personne."};
[[player],"life_fnc_searchClient",_unit,false] spawn life_fnc_MP;
life_action_inUse = true;
player setVariable ["AGM_canTreat", false, true];