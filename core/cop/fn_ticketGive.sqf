/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint "Joueur nul"};
if(isNull life_ticket_unit) exitWith {hint "Joueur n'existe pas"};
_val = ctrlText 2652;
if(!([_val] call life_fnc_isnumber)) exitWith {hint "Vous n'avez pas saisi format nombre réel."};
if((parseNumber _val) > 10000000) exitWith {hint "Les amendes ne peuvent pas être supérieur a $10,000,000!"};
[[0,format["%1 a donné une amende de $%2 a %3",profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;