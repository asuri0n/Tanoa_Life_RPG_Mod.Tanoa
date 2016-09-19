/*
	File: fn_disputeArea.sqf
	Author: Komodo

	Description:
	set variables to allow area dispute with following lifecycle:
	1. someone disputes an area, we store time and gang name.
	2. after 10 minutes, spawn point, vehicles and vendors gets deactivated on the zone (fight allowed)
	3. Once combat started, spawn, garage and vendors are deactivated until first event: area captured, or time elapsed over 15 minutes
*/
private["_hideout","_disputeGangId","_disputeGangName","_disputeTime","_gangNamePlayer","_gangPlayerID","_timeLeft","_ownerGroupName", "_gangName","_ownerUnits","_nameArea","_msg","_playerGroup","_timeLeftMinutes","_timeLeftSeconds","_disputeAuthorized","_date"];

_hideout = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Komodo: allowing cops to capture zone
_playerGroup = group player;
if (side player == west) then
{
	_playerGroup setVariable ["gang_name", "Gendarmes", true];
	_playerGroup setVariable ["gang_id", 0, true];
};

if (isNull _hideout) exitWith {hint "Problème avec le système de contestation, veuillez avertir un administrateur.";};

_disputeGangId = _hideout getVariable ["disputeGangId",-1];
_disputeGangName = _hideout getVariable ["disputeGangName","none"];
_disputeTime = _hideout getVariable ["disputeTime", 0];
_ownerGroupName = _hideout getVariable ["gangOwner", "none"];
_nameArea = _hideout getVariable ["nameArea","Error No Area"];
_disputeAuthorized = _hideout getVariable ["disputeAuthorized", false];

/*if((_hideout == gang_flag_7) OR (_hideout == gang_flag_9) OR (_hideout == gang_flag_10) OR (_hideout == gang_flag_11) OR (_hideout == gang_flag_12) OR (_hideout == gang_flag_13) OR (_hideout == gang_flag_15) OR (_hideout == gang_flag_16) OR (_hideout == gang_flag_17) OR (_hideout == gang_flag_18)) then {
	_timeLeft = _disputeTime + (15 * 60) - time;
} else {*/
	_timeLeft = _disputeTime + (35 * 60) - time;
//};

_timeLeftMinutes = round (_timeLeft / 60);
_timeLeftSeconds = round (_timeLeft - _timeLeftMinutes * 60);

if (_disputeGangName != "none") exitWith {hint format["Cette zone est déjà contestée par le groupe: %1. Un seul groupe à la fois peut contester une zone! Tu pourras réessayer dans %2 minutes et %3 secondes", _disputeGangName, _timeLeftMinutes, _timeLeftSeconds];};

_gangNamePlayer = (group player) getVariable ["gang_name","GangInconnu"];
_gangPlayerID = (group player) getVariable ["gang_id",-1];

if (_gangNamePlayer == _ownerGroupName) exitWith {hint "Nous avons appelé l'hopital psychatrique, car vous voulez contester votre propre zone...";};

//On va mettre en place certaines variables
_hideout setVariable["disputeGangId", _gangPlayerID, true];
_hideout setVariable["disputeGangName", _gangNamePlayer, true];
_hideout setVariable["disputeTime", time, true];
_hideout setVariable["disputeAuthorized", false, true];

hint "Le système de contestation est en cours d'initialisation, cela prend 10 secondes. Veuillez patienter...";

diag_log format ["---- AREA SYSTEM: Gig: %1, Gname:%2, time:%3",_gangPlayerID, _gangNamePlayer,time];

//On lance la contestation de zone côté serveur
[[_hideout],"INVO_fnc_disputeAreaInit",false,false] spawn life_fnc_MP;