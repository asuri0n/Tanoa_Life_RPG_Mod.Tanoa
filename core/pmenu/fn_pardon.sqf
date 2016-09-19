/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pardons the selected player.
*/
private["_display","_list","_uid","_data","_answer"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_answer = [
	format["<t color='#8cff9b'>Voulez-vous vraiment supprimer tous les crimes associés à cette personne? Cette action est irréversible et est passible de ban si utilisée hors contexte RP.</t>"],
	"Enlever les crimes de cette personne?",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;
if (!_answer) exitWith {};

_uid = _data select 0;
[_uid] call INVO_fnc_wantedPardon;

closeDialog 0;