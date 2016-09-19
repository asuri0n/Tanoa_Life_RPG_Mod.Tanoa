#include <macro.h>
/*
	Author: Komodo
	FileName: fn_clientDeleteAlliance.sqf

	Description: Delete alliance. Client side.
*/
private ["_allianceId","_action"];
disableSerialization;
//default value
_allianceID = 0;

if((lbCurSel 47002) == -1) exitWith {hint "Tu dois séléctionner une Alliance à supprimer."};
_allianceID = parseNumber(getSelData(47002));

_action =
[
	"Supprimer cette Alliance?",
	"Alliances",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if (!_action) exitWith {hint "Action annulée";};

if (_allianceID != 0) then
{
	[[_allianceID], "INVO_fnc_deleteAlliance",false,false] spawn life_fnc_MP;
	closeDialog 0;
	//[] spawn life_fnc_initAlliancesMenu;
}
else
{
	hint "Problème avec cette Alliance";
};