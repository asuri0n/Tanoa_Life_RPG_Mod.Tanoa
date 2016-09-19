/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {hint "Impossible d'ouvrir l'interface"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
if(_unit getVariable["AGM_isUnconscious",false]) exitWith {hint "Il va payer comment dans le coma??";};
ctrlSetText[2651,format["%1 a reçu une amende",_unit getVariable["realname",name _unit]]];
life_ticket_unit = _unit;