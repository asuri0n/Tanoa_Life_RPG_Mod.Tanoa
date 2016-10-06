/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Doesn't matter, will be revised later.
*/
private["_nearPlayers","_medics","_action","_title","_duration","_handle"];

_independent = playersNumber independent;
if(_independent > 0) exitWith {hint "Il y a des EMT sur l'île qui peuvent te soigner ! Action annulé";};
if(life_liquide < 500) exitWith {hint format[localize "STR_NOTF_HS_NoCash",500];};

_action =
[
	"Tu es sur de vouloir demander de l'aide ? Ca va te couter 500 euros",
	"Se faire soigner ?",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {};

_title = "Diagnostique en cours ...";
_duration = 10;
_handle = [_duration,_title] spawn life_fnc_progressBar;
waitUntil {scriptDone _handle};

_title = "Application du gros pencement ...";
_duration = 10;
_handle = [_duration,_title] spawn life_fnc_progressBar;
waitUntil {scriptDone _handle};

if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
hint "Tu est maintenant soigné!";

//Komodo: @AGM complete healing.
player setDamage 0;
//player setVariable ["AGM_Blood", 1, True];
//player setVariable ["AGM_isBleeding", False, True];
//player setVariable ["AGM_Painkiller", 1, True];
//player setVariable ["AGM_Pain", 0, True];

life_liquide = life_liquide - 500;
["Heal Hospital", false, -500] call life_fnc_antiCheatCash;

sleep 3;

hint "Cet hopital va aussi rechercher autour de toi s'il y a des blessés. Cela ne fonctionnera pas si un ou plusieurs médecins sont actuellement en service sur l'île.";

//Komodo: now healing units in 5m radius if no medic connected.
_medics = {(side _x == independent) && {_x getVariable ["invo_faction",""] == "medic"};} count allUnits;
if (_medics > 0) exitWith {};
hint "Pas de médecins sur l'île, on va regarder si tu nous as amené des blessés.";

_title = "Recherche de bléssés  ...";
_duration = 10;
_handle = [_duration,_title] spawn life_fnc_progressBar;
waitUntil {scriptDone _handle};

_nearPlayers = player nearEntities ["Man", 3];
if (count _nearPlayers > 0) then {
	hint "Ok, on va s'occuper de ce(s) blessé(s)!";
} else {
	hint "Pas de blessé autour de toi.";
};

{
	if (_x getvariable["FAR_isUnconscious",0] == 1/* && {!(_x getVariable["AGM_isBleeding",false])}*/) then
	{
		//revive
		//_x setVariable ["AGM_isUnconscious", False, True];
		//_x setVariable ["AGM_Blood", 1, True];
		//_x setVariable ["AGM_isBleeding", False, True];
		//_x setVariable ["AGM_Painkiller", 1, True];
		//_x setVariable ["AGM_Pain", 0, True];
		//[_x] call AGM_Medical_fnc_wakeUp;
		[_x] spawn FAR_HandleRevive;
	};
	_x setDamage 0;
} forEach _nearPlayers;