#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Filename: fn_captureHideout.sqf

	Description:
	Blah blah.
*/
private["_gangOwner","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_markername","_gangname2","_ownerUnits","_gangNamePlayer","_data","_gangPlayerID","_posBefore","_lastPlayMove"];

_hideout = (nearestObjects[getPosATL player,["FlagPole_F"],25]) select 0;
_gangOwner= _hideout getVariable ["gangOwner","none"];
_areaID = _hideout getVariable ["areaID",-500];
_nameArea = _hideout getVariable ["nameArea","Capture de zone"];
_playerGroup = group player;

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["Tu dois déjà créer un gang avant de pouvoir capturer une planque!","PLAIN"];};
if(_gangOwner == (grpPlayer getVariable ["gang_name",""])) exitWith {titleText["Ton gang a déjà capturé la zone!","PLAIN"]};
	//ajout asurion
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint"Une personne seulement peut capturer la zone !";};

_posBefore = getPosATL player; //Komodo: ajouté pour enfumer ces connards de glitcheurs.

_ownerUnits = [];

if(_gangOwner != "none") then {
	_action = [
		format["Cette planque est prise par %1<br/>Êtes-vous sûr de vouloir essayer de la capturer quand même ??",_gangOwner],
		"Territoire déja sous contrôle",
		"Oui",
		"Non"
	] call BIS_fnc_guiMessage;

	
	/*if((_hideout == gang_flag_7) OR (_hideout == gang_flag_8) OR (_hideout == gang_flag_9) OR (_hideout == gang_flag_10) OR (_hideout == gang_flag_11) OR (_hideout == gang_flag_12) OR (_hideout == gang_flag_13) OR (_hideout == gang_flag_14) OR (_hideout == gang_flag_15) OR (_hideout == gang_flag_16) OR (_hideout == gang_flag_17) OR (_hideout == gang_flag_18)) then {
		_cpRate = 0.04;
	} else {*/
		_cpRate = 0.0045;
	//};

	/*
		Search for the owner group to send them a notification
	*/
	{
		_groupName = _x getVariable ["gang_name",""];
		if (_groupName == _gangOwner) exitWith {_ownerUnits = units _x;};
	} foreach allGroups;

} else {
	_cpRate = 0.0075;
};

if ((_posBefore distance (getPosATL player)) > 2) exitWith {hint "Arrête de glitcher connard.";};

if(!isNil "_action" && {!_action}) exitWith {titleText["Capture annulée","PLAIN"];};
life_action_inUse = true;
/*player setVariable ["AGM_canTreat", false, true];*/

/* ça ne semble pas marcher... on verra ça plus tard, je (Komodo) simplifie en attendant.
_msg = format["<t font='puristaMedium'><t size='1.30' align='center' color='#0D82DF'>Système de capture</t><br/>
<br/>
<t size='1.30' color='#0D82DF' align='left'>%1</t> et son gang <t size='1.30' font='puristaMedium' color='#b67e2a'>%2</t> sont en train de capturer : <t size='1.30' font='puristaMedium' color='#b67e2a'>%3</t>
 </t>",
name player,(group player) getVariable "gang_name" ,_nameArea ];
*/
_msg = format["Système de capture -
%1 et son groupe %2 sont en train de capturer : %3",
name player,(group player) getVariable "gang_name" ,_nameArea ];

if (count (_ownerUnits) != 0) then
{
	/* Envoi du message à tous les joueurs connectés du groupe actuellement proriétaire de la zone */
	[[1,_msg,true],"life_fnc_broadcast",_ownerUnits,false] spawn life_fnc_MP;
};

/* Envoi du message à tous les joueurs du groupe qui souhaite capturer la zone */
[[1,_msg,true],"life_fnc_broadcast",units _playerGroup,false] spawn life_fnc_MP;

//Setup the progress bar
disableSerialization;
_title = "Capture de la zone...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_lastPlayMove = 0;

while {true} do
{
	if((_lastPlayMove - time) < 0) then {
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		_lastPlayMove = time + 5.8;
	};
	sleep 1.80;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if(player != vehicle player) exitWith {titleText["Tu dois être à l'exterieur du véhicule pour capturer la zone!.","PLAIN"]; life_interrupted = true;};
	if(!alive player) exitWith {hint "Tu as abandonné la capture de zone car tu es blessé.";};
	if(player getvariable["FAR_isUnconscious",0] == 1) exitWith {hint "Tu as abandonné la capture de zone car tu es blessé.";};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false; /*player setVariable ["AGM_canTreat", true, true];*/};
life_action_inUse = false;
/*player setVariable ["AGM_canTreat", true, true];*/
if(player getvariable["FAR_isUnconscious",0] == 1) exitWith {hint "Tu as abandonné la capture de zone car tu es blessé.";};

titleText["La zone a été capturé avec succes.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;

_msg = format["Système de capture - %1 et son groupe %2 ont capturé %3",name player,(group player) getVariable "gang_name" ,_nameArea ];

[[1,_msg,true],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

/*
_notifMsg = format["%1 du gang %2 est en train de capturer votre possession : %3",name player,(group player) getVariable "gang_name" ,_nameArea ];
[["CaptureSystem",["Une zone de capture a changé d'appartenance!"]],"BIS_fnc_showNotification",true,false] spawn life_fnc_MP; */

_markername = str(getPos _hideout);

_gangNamePlayer = (group player) getVariable ["gang_name","GangInconnu"];
_gangname2 = formatText["Capturé par: %1",_gangNamePlayer ];
if (getMarkerColor _markername == "") then
{
	gang_owner_marker = createMarker [_markername, position _hideout];
	_markername setMarkerShape "ICON";
	_markername setMarkerType "hd_warning";
	_markername setMarkerColor "ColorBlue";
	_markername setMarkerText str(_gangname2);
	gang_owner_marker = "";
}
else
{
	_markername setMarkerText str(_gangname2);
};
_hideout setVariable["gangOwner",_gangNamePlayer,true];

// Update database if data is correct
_gangPlayerID = (group player) getVariable ["gang_id",-500];
_hideout setVariable["ownerId",_gangPlayerID,true];
_hideout setVariable["lastChange", time, true]; //dernier changement de propriétaire
_hideout setVariable["disputeGangId", -1, true]; //reset
_hideout setVariable["disputeGangName", "none", true]; //reset
_hideout setVariable["disputeTime", -2500, true]; //reset
_hideout setVariable["spawnAuthorized", true, true];
[[_hideout],"INVO_fnc_disputeAreaResetZone",false,false] spawn life_fnc_MP;
if ((_gangPlayerID != -500) && (_gangNamePlayer != "GangInconnu") ) then
{
	_data = [
			_areaID,
			_gangPlayerID,
			_gangNamePlayer
		];
	[[0,_data],"INVO_fnc_updateCaptureArea",false,false] spawn life_fnc_MP;	//UPDATE DATABASE
	diag_log format["###DEBUG CAPTURE### Capture terminée et envoie de %1 au serveur pour MAJ", _data];
};

