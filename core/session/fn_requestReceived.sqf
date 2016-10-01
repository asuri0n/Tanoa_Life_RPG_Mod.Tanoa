#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText["Erreur serveur.","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText ["Chargement des informations envoyées par le serveur... Validation...","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_liquide = parseNumber (_this select 2);
life_liquide_before = parseNumber (_this select 2);
life_dabliquide = parseNumber (_this select 3);
life_dabliquide_before = life_dabliquide;
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

//Parse side specific information.
switch(playerSide) do {
	case west: {
		//ProfLicences
		if(count (_this select 10) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),[_x select 1, _x select 2]];
			} foreach (_this select 10);
		};

		diag_log "------------- Request Received -------------";
		diag_log "----REQUETE RECU DE LA BASE DE DONNEE ------";
		diag_log format["1: %1",_this select 1]; //nom
		diag_log format["2: %1",_this select 2]; //cash
		diag_log format["3: %1",_this select 3]; //bank
		diag_log format["4: %1",_this select 4]; //adminlvl
		diag_log format["5: %1",_this select 5]; //donatorlvl
		diag_log format["6: %1",_this select 6]; //licences
		diag_log format["7: %1",_this select 7];
		diag_log format["8: %1",_this select 8]; //stuff
		diag_log format["9: %1",_this select 9]; //backlist
		diag_log format["10: %1",_this select 10]; //prof
		diag_log format["11: %1",_this select 11]; //position
		diag_log format["12: %1",_this select 12]; //isalive
		diag_log "------------------------------------------------";

		// Saving player position
		cop_position = _this select 11;
		life_is_alive = _this select 12;

		__CONST__(life_coplevel,parseNumber(_this select 7));
		cop_gear = _this select 8;
		[] spawn life_fnc_loadGear;
		life_blacklisted = _this select 9;

		__CONST__(life_medicLevel,0);
		__CONST__(life_depanLevel,0);
	};

	case civilian: {
		//ProfLicences
		if(count (_this select 15) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),[_x select 1, _x select 2]];
			} foreach (_this select 15);
		};

		diag_log "------------- Request Received -------------";
		diag_log "----REQUETE RECU DE LA BASE DE DONNEE ------";
		diag_log format["1: %1",_this select 1]; //nom
		diag_log format["2: %1",_this select 2]; //cash
		diag_log format["3: %1",_this select 3]; //bank
		diag_log format["4: %1",_this select 4]; //adminlvl
		diag_log format["5: %1",_this select 5]; //donatorlvl
		diag_log format["6: %1",_this select 6]; //licences
		diag_log format["7: %1",_this select 7]; //coplevel
		diag_log format["8: %1",_this select 8]; //stuff
		diag_log format["9: %1",_this select 9];
		diag_log format["10: %1",_this select 10]; //age
		diag_log format["11: %1",_this select 11]; //sexe
		diag_log format["12: %1",_this select 12]; //nationalite
		diag_log format["13: %1",_this select 13]; //position
		diag_log format["14: %1",_this select 14]; //
		diag_log format["15: %1",_this select 15]; //licences
		diag_log format["16: %1",_this select 16]; //keys
		diag_log format["17: %1",_this select 17]; //gangs
		diag_log "------------------------------------------------";

		life_is_arrested = _this select 7;
		//life_is_arrested = call compile format["%1", _this select 7];
		civ_gear = _this select 8;

		// Role Play informations about player
		player setVariable ["playerAge",_this select 10];
		player setVariable ["playerSexe",_this select 11];
		player setVariable ["playerNationalite",_this select 12];

		// Saving player position
		civ_position = _this select 13;
		life_is_alive = _this select 14;

		//Komodo: Wanted List retrieval
		if (!((_this select 9) isEqualTo [])) then
		{
			if (([getPlayerUID player, 0, invo_wanted_list] call life_fnc_indexInTable) == -1) then
			{
				invo_wanted_list pushBack [getPlayerUID player, (_this select 9)];
				publicVariable "invo_wanted_list";
			};
		};

		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		__CONST__(life_depanLevel,0);
		life_houses = _this select 16;
		[] spawn life_fnc_civLoadGear;

		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = _This select 17;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {

		//ProfLicences
		if(count (_this select 10) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),[_x select 1, _x select 2]];
			} foreach (_this select 10);
		};

		diag_log "------------- Request Received -------------";
		diag_log "----REQUETE RECU DE LA BASE DE DONNEE ------";
		diag_log format["1: %1",_this select 1]; //nom
		diag_log format["2: %1",_this select 2]; //cash
		diag_log format["3: %1",_this select 3]; //bank
		diag_log format["4: %1",_this select 4]; //adminlvl
		diag_log format["5: %1",_this select 5]; //donatorlvl
		diag_log format["6: %1",_this select 6]; //licences
		diag_log format["7: %1",_this select 7]; //medlvl
		diag_log format["8: %1",_this select 8]; //depanlvl
		diag_log format["9: %1",_this select 9]; //stuff
		diag_log format["10: %1",_this select 10]; //prof
		diag_log format["11: %1",_this select 11]; //position
		diag_log format["12: %1",_this select 12]; //isalive
		diag_log "------------------------------------------------";

		// Saving player position
		med_position = _this select 11;
		life_is_alive = _this select 12;

		__CONST__(life_medicLevel,parseNumber(_this select 7));
		player setVariable ["life_mediclevel", parseNumber(_this select 7), true];
		__CONST__(life_depanLevel,parseNumber(_this select 8));
		__CONST__(life_copLevel,0);
		indep_gear = _this select 9;
	};

	case east: {
		//ProfLicences
		if(count (_this select 15) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),[_x select 1, _x select 2]];
			} foreach (_this select 15);
		};

		diag_log "------------- Request Received -------------";
		diag_log "----REQUETE RECU DE LA BASE DE DONNEE ------";
		diag_log format["1: %1",_this select 1]; //nom
		diag_log format["2: %1",_this select 2]; //cash
		diag_log format["3: %1",_this select 3]; //bank
		diag_log format["4: %1",_this select 4]; //adminlvl
		diag_log format["5: %1",_this select 5]; //donatorlvl
		diag_log format["6: %1",_this select 6]; //licences
		diag_log format["7: %1",_this select 7]; //coplevel
		diag_log format["8: %1",_this select 8]; //stuff
		diag_log format["9: %1",_this select 9];
		diag_log format["10: %1",_this select 10]; //age
		diag_log format["11: %1",_this select 11]; //sexe
		diag_log format["12: %1",_this select 12]; //nationalite
		diag_log format["13: %1",_this select 13]; //position
		diag_log format["14: %1",_this select 14]; //
		diag_log format["15: %1",_this select 15]; //licences
		diag_log format["16: %1",_this select 16]; //keys
		diag_log format["17: %1",_this select 17]; //gangs
		diag_log "------------------------------------------------";

		life_is_arrested = _this select 7;
		//life_is_arrested = call compile format["%1", _this select 7];
		civ_gear = _this select 8;

		// Role Play informations about player
		player setVariable ["playerAge",_this select 10];
		player setVariable ["playerSexe",_this select 11];
		player setVariable ["playerNationalite",_this select 12];

		// Saving player position
		civ_position = _this select 13;
		life_is_alive = _this select 14;

		//Komodo: Wanted List retrieval
		if (!((_this select 9) isEqualTo [])) then
		{
			if (([getPlayerUID player, 0, invo_wanted_list] call life_fnc_indexInTable) == -1) then
			{
				invo_wanted_list pushBack [getPlayerUID player, (_this select 9)];
				publicVariable "invo_wanted_list";
			};
		};

		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		__CONST__(life_depanLevel,0);
		life_houses = _this select 16;
		[] spawn life_fnc_civLoadGear;

		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = _This select 17;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};
};

/* késako ??
if(count (_this select 16) > 0) then
{
	{
		life_vehicles pushBack _x;
	} foreach (_this select 16);
};
*/


switch (playerSide) do
{
	case west:
	{
		if (__GETC__(life_coplevel) == 1) then
		{
			life_paycheck = life_paycheck + 2500;
		};
		if (__GETC__(life_coplevel) == 2) then
		{
			life_paycheck = life_paycheck + 3000;
		};
		if (__GETC__(life_coplevel) == 3) then
		{
			life_paycheck = life_paycheck + 3500;
		};
		if (__GETC__(life_coplevel) == 4) then
		{
			life_paycheck = life_paycheck + 4000;
		};
		if (__GETC__(life_coplevel) == 5) then
		{
			life_paycheck = life_paycheck + 4500;
		};
		if (__GETC__(life_coplevel) == 6) then
		{
			life_paycheck = life_paycheck + 5000;
		};
		if (__GETC__(life_coplevel) == 7) then
		{
			life_paycheck = life_paycheck + 5500;
		};
	};

	case civilian:
	{
		life_paycheck = life_paycheck + 1500;
	};

	case east:
	{
		life_paycheck = life_paycheck + 1500;
	};

	case independent:
	{
		if (__GETC__(life_medicLevel) == 1) then
		{
			life_paycheck = life_paycheck + 2000;
		};
		if (__GETC__(life_medicLevel) == 2) then
		{
			life_paycheck = life_paycheck + 2500;
		};
		if (__GETC__(life_medicLevel) == 3) then
		{
			life_paycheck = life_paycheck + 3000;
		};
		if (__GETC__(life_medicLevel) == 4) then
		{
			life_paycheck = life_paycheck + 3500;
		};
	};
};

switch(__GETC__(life_donator)) do
{
//DONATEUR 1
	case 1:
	{
		life_paycheck = life_paycheck + 1000;
	};
//DONATEUR 2
	case 2:
	{
		life_paycheck = life_paycheck + 1500;
	};
//DONATEUR 3
	case 3:
	{
		life_paycheck = life_paycheck + 2000;
	};
};

life_session_completed = true;