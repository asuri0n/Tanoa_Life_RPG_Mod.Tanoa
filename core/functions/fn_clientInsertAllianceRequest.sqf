#include <macro.h>
/*
	Author: Komodo
	FileName: fn_clientInsertAllianceRequest.sqf

	Description: Creates alliance request
*/
private ["_permanent","_idFrom","_idTo","_cost","_action","_groupTo"];
disableSerialization;
//default value
_idFrom = (group player) getVariable ["gang_id",-1];
_idTo = 0;
_permanent = false;
if((lbCurSel 47009) == -1) exitWith {hint "Tu dois séléctionner un groupe auquel demander une Alliance."};
_idTo = parseNumber(getSelData(47009));

_permanent =
[
	"Une alliance temporaire sera valable jusqu'au prochain restart serveur, et coute 100.000, une alliance permanente coute 2.000.000",
	"Alliance Permanente ?",
	"Permanente",
	"Temporaire"
] call BIS_fnc_guiMessage;

if (_permanent) then
{
	_cost = 2000000;
	_action =
	[
		"Tu dois payer 2.000.000 de ton compte pour créer cette alliance, es-tu certain ?",
		"Alliance Permanente ?",
		"Oui",
		"Non"
	] call BIS_fnc_guiMessage;
}
else
{
	_cost = 100000;
	_action =
	[
		"Tu dois payer 100.000 de ton compte pour créer cette alliance, es-tu certain ?",
		"Alliance Temporaire ?",
		"Oui",
		"Non"
	] call BIS_fnc_guiMessage;
};

if (!_action) exitWith {hint "Action annulée.";};
if (life_dabliquide < _cost) exitWith {hint "Tu n'as pas assez dans ton compte en banque pour payer les frais de mise en place.";};

_groupTo = grpNull;
{
	if (_x getVariable ["gang_id",-1] == _idTo) exitWith
	{
		_groupTo = _x;
		_msg = format ["Alliance demandée par le groupe %1", (group player) getVariable ["gang_name","No Name"]];
		{
			[[_msg,player,9],"INVO_fnc_clientReceiveMessage",_x,false] spawn life_fnc_MP;
		} forEach (units _x);
	};
} forEach allGroups;


if (_idFrom > 0 && _idTo > 0) then
{
	[[_idFrom,_idTo,(group player),_groupTo,_permanent], "INVO_fnc_insertAllianceRequest",false,false] spawn life_fnc_MP;
	diag_log format ["INVO_DEBUG - clientInsertAllianceRequest - From: %1; To: %2; Perm: %3",_idFrom, _idTo, _permanent];
	life_dabliquide = life_dabliquide - _cost;
	["clientInsertAllianceRequest", true, -1 * _cost] call life_fnc_antiCheatCash;
	closeDialog 0;
	//[] spawn life_fnc_initAlliancesMenu;
}
else
{
	hint "Impossible de créer cette alliance, contacte un Admin.";
};