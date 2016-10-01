#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Chargement des données joueur en cours...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;

diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

//Komodo: nettoyage EmptyDetectors
{
	if (local _x) then {deleteVehicle _x;};
} forEach allMissionObjects "EmptyDetector";

diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {fnc_setupFuncs})};
_handle = [] spawn fnc_setupFuncs;
waitUntil {scriptDone _handle;};
diag_log "::Life Client:: Received server functions.";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
0 cutText ["Attendez quelques secondes que le serveur termine de s'initialiser. Lors d'un restart, le serveur a besoin de 20 à 30 secondes.","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["Le chargement de la base de données ne s'est pas effectué correctement, veuillez contacter un administrateur s'il vous plait'","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
if (__GETC__(life_adminlevel) < 2) then {
	[] spawn life_fnc_escInterupt;
};

switch (playerSide) do
{
	case west:
	{
		if (__GETC__(life_copLevel) > 0) then
		{
			_handle = [] spawn life_fnc_initCop;
			waitUntil {scriptDone _handle};
		}
		else
		{
			["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
			sleep 35;
		};
	};

	case civilian:
	{
		diag_log "Initialize Civilian Settings";
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		//Initialize Medics and blah
		//_handle = [] spawn life_fnc_initMedic;
		//waitUntil {scriptDone _handle};

		switch(true) do
		{
			case (__GETC__(life_medicLevel) > 0) :
			{
				_handle = [] spawn life_fnc_initMedic;
				waitUntil {scriptDone _handle};
			};
			case (__GETC__(life_depanLevel) > 0) :
			{
				_handle = [] spawn life_fnc_initDepan;
				waitUntil {scriptDone _handle};
			};

			default
			{
				["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
				sleep 35;
			};
		};

	};

	case east:
	{
		diag_log "Initialize Rebel Settings";
		_handle = [] spawn life_fnc_initRebel;
		waitUntil {scriptDone _handle};
	};
/* ZEUS? Désactivé pour tester...
	case sideLogic:

    {

        _handle = [] spawn life_fnc_initZeus;

        waitUntil {scriptDone _handle};

    };
*/
};

enableRadio false;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
//player setVariable ["civrestrained",false,true];

// AJOUT SERRAT
player setVariable ["restrained",false,true];
player setVariable ["ziptiesOwners",[],true]; //Komodo: système de clefs menottes
player setVariable ["playerSurrender", false, true];
player setVariable ["FAR_isUnconscious", 0, true];
player setVariable ["lastestContact",ObjNull,true];
player setVariable ["saveContact",ObjNull,true];
player setVariable ["invisible",false,true];
player setVariable ["isknocked",false,true];
// FIN AJOUT SERRAT

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

[] call life_fnc_settingsInit;

LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
if (life_revealObjects) then
{
	LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
};

player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];

//Komodo: intégration AGM - modifications touches par défaut
/*if (profileNamespace getVariable "AGM_Key_ModifierKey" != 0) then
{
	profileNamespace setVariable ["AGM_Key_ModifierKey",0];
};
if (profileNamespace getVariable "AGM_Key_openInteractionMenuNew" == 219) then
{
	profileNamespace setVariable ["AGM_Key_openInteractionMenuNew",18.2];
};
if (profileNamespace getVariable "AGM_Key_openInteractionMenuSelfNew" == 219.2) then
{
	profileNamespace setVariable ["AGM_Key_openInteractionMenuSelfNew",18.1];
};*/
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

_handle = [] execVM "core\init_survival.sqf";
waitUntil {scriptDone _handle}; //Komodo: waiting for weight to be set
__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.

/*
switch (playerSide) do {
    case civilian:
    {
    	sleep(1);
    	[] call life_fnc_civLoadLifeGear;
    };
};
*/

//Mise a 0 des PV car quand spawn, dégat AGM
player setDamage 0;
//player setVariable ["AGM_Blood", 1, True];
//player setVariable ["AGM_isBleeding", False, True];
//player setVariable ["AGM_Painkiller", 1, True];
//player setVariable ["AGM_Pain", 0, True];
//player setVariable ["AGM_isUnconscious", False, True];

if(life_firstSpawn AND invo_play_intro) then
{
	INVO_introEnded = false;

	PO3_a3 = true;
	PlaySound "Intro";
	0 fadeMusic 1;
	[5,""] spawn INVO_fnc_cameraFadeIn;
	[270,900,150] call INVO_fnc_sequenceIntro;
	waitUntil {INVO_introEnded};
	life_firstSpawn = false;
};

[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)

//Launch Tip system
[] spawn INVO_fnc_tipsLoop;

//Launch VRChop system
//[] spawn INVO_fnc_initVRShop;

//Initialise Radio system
[] spawn INVO_fnc_radioInit;

//Launch Notification system
[] spawn INVO_fnc_initNotificationSystem;

//Launch commander view restriction
[] spawn INVO_fnc_commanderViewRestriction;

//No Voice!
//player setSpeaker "AGM_NoVoice";

//test blackjack
//player addAction["Test jeu de blackjack",life_fnc_jeuBlackJack];

//test add notif
//player addAction ["<t color='#d06228'>Ajouter notifications</t>", "test.sqf", "", 1, false, false];

//Test wall
//player addAction ["<t color='#d06228'>Remettre le mur</t>", "test2.sqf", "", 1, false, false];

//player setVariable ["AGM_Name","Inconnu",true]; //Komodo: anti meta gaming

// NO FATIGUE
if(local player) then
{
    player enableFatigue false;
	1 fadeSound 1;
};

life_vehicleList =
(["kart_shop"] call life_fnc_vehicleListCfg) +
(["civ_car"] call life_fnc_vehicleListCfg) +
(["civ_air"] call life_fnc_vehicleListCfg) +
(["civ_truck"] call life_fnc_vehicleListCfg) +
(["civ_ship"] call life_fnc_vehicleListCfg) +
(["civ_luxe"] call life_fnc_vehicleListCfg) +
(["reb_car"] call life_fnc_vehicleListCfg) +
(["reb_air"] call life_fnc_vehicleListCfg) +
(["donateur"] call life_fnc_vehicleListCfg) +
(["cop_car"] call life_fnc_vehicleListCfg) +
(["cop_air"] call life_fnc_vehicleListCfg) +
(["cop_ship"] call life_fnc_vehicleListCfg) +
(["depan_car"] call life_fnc_vehicleListCfg) +
(["med_shop"] call life_fnc_vehicleListCfg) +
(["med_air_hs"] call life_fnc_vehicleListCfg);