#include <macro.h>
/*
	Author: Komodo
	FileName: fn_clientAcceptAllianceRequest.sqf

	Description: Accepts alliance. Client side.
*/
private ["_allianceId","_myGangId","_allianceToAccept","_allianceIndex","_action","_msg"];
disableSerialization;
//default value
_allianceID = 0;

if((lbCurSel 47002) == -1) exitWith {hint "Tu dois séléctionner une Alliance à supprimer."};
_allianceID = parseNumber(getSelData(47002));

_myGangId = (group player) getVariable ["gang_id",-1];
_allianceIndex = [_allianceId, 0, invo_alliances] call life_fnc_IndexInTable;
_allianceToAccept = invo_alliances select _allianceIndex;
if (_myGangId != _allianceToAccept select 2) exitWith {hint "Ton groupe est à l'origine de la demande d'Alliance, tu ne peux pas l'accepter.";};
if (_allianceToAccept select 3 == 1) exitWith {hint "Accepter une Alliance déjà Acceptée, concept intéressant...";};

{
	if (_allianceToAccept select 1 == _x getVariable ["gang_id",-1]) exitWith
	{
		_msg = format ["Alliance acceptée par le groupe %1", (group player) getVariable ["gang_name","No Name"]];
		{
			[[_msg,player,9],"INVO_fnc_clientReceiveMessage",_x,false] spawn life_fnc_MP;
		} forEach (units _x);
	};
} forEach allGroups;

_action =
[
	"Accepter cette Alliance?",
	"Alliances",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;
if (!_action) exitWith {hint "Action annulée";};

if ((_allianceID != 0)) then
{
	[[_allianceID], "INVO_fnc_acceptAllianceRequest",false,false] spawn life_fnc_MP;
	closeDialog 0;
	//[] spawn life_fnc_initAlliancesMenu;
}
else
{
	hint "Problème avec cette alliance, contactez un Admin.";
};