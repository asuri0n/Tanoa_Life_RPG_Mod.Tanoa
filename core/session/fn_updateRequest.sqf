/*
	File: fn_updateRequest.sqf
	Author: Tonic

	Description: Handles sync data with server.
*/
private["_packet","_array","_flag","_crimes","_position","_profs"];
_position = getPos player;
diag_log format ["%1",_position];
_packet = [getPlayerUID player,(profileName),playerSide,life_liquide,life_dabliquide];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case east: {"civ"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;

_packet pushBack _array;

switch (playerSide) do {
	case west: {
		_packet pushBack cop_gear;
		// cop pos saving
		_packet set[9,life_is_alive];
		_packet set[10,_position];
	};
	case civilian: {
		[] call life_fnc_civFetchGear;
		_packet pushBack civ_gear;
		_packet pushBack life_is_arrested;

		//Komodo: let's handle the wanted list here (computed on sync data and stored on player's entry in DB)
		_crimes = [] call life_fnc_computeOwnCrimes;
		_packet pushBack _crimes;

		// civ pos saving
		_packet set[9,life_is_alive];
		_packet set[10,_position];

		//XP system
		_profs = [];
		{
			if(_x select 1 == _flag) then{
				_data = missionNamespace getVariable (_x select 0);
				_profs pushBack [_x select 0,_data select 0,_data select 1];
			};
		} foreach life_prof;
		_packet pushBack _profs;

		//age/sexe/nationalite
		_packet pushBack (player getVariable ["playerAge",nil]);
		_packet pushBack (player getVariable ["playerSexe",nil]);
		_packet pushBack (player getVariable ["playerNationalite",nil]);


		diag_log "------------- update request client -------------";
		diag_log format["life_is_alive: %1",life_is_alive];
		diag_log format["_position: %1",_position];
		diag_log format["_profs: %1",_profs];
		diag_log format["playerAge: %1",(player getVariable ["playerAge",nil])];
		diag_log format["playerSexe: %1",(player getVariable ["playerSexe",nil])];
		diag_log format["playerNationalite: %1",(player getVariable ["playerNationalite",nil])];
		diag_log "------------------------------------------------";

	};
	case independent:
	{
		[] call life_fnc_civFetchGear;
		_packet pushBack indep_gear;

		// med pos saving
		_packet set[9,life_is_alive];
		_packet set[10,_position];
		diag_log format["_packet_packet: %1",_packet];
	};
	case east: {
		[] call life_fnc_civFetchGear;
		_packet pushBack civ_gear;
		_packet pushBack life_is_arrested;

		//Komodo: let's handle the wanted list here (computed on sync data and stored on player's entry in DB)
		_crimes = [] call life_fnc_computeOwnCrimes;
		_packet pushBack _crimes;

		// civ pos saving
		_packet set[9,life_is_alive];
		_packet set[10,_position];

		//XP system
		_profs = [];
		{
			if(_x select 1 == _flag) then{
				_data = missionNamespace getVariable (_x select 0);
				_profs pushBack [_x select 0,_data select 0,_data select 1];
			};
		} foreach life_prof;
		_packet pushBack _profs;

		//age/sexe/nationalite
		_packet pushBack (player getVariable ["playerAge",nil]);
		_packet pushBack (player getVariable ["playerSexe",nil]);
		_packet pushBack (player getVariable ["playerNationalite",nil]);


		diag_log "------------- update request client -------------";
		diag_log format["life_is_alive: %1",life_is_alive];
		diag_log format["_position: %1",_position];
		diag_log format["_profs: %1",_profs];
		diag_log format["playerAge: %1",(player getVariable ["playerAge",nil])];
		diag_log format["playerSexe: %1",(player getVariable ["playerSexe",nil])];
		diag_log format["playerNationalite: %1",(player getVariable ["playerNationalite",nil])];
		diag_log "------------------------------------------------";

	};
};


if (_packet isEqualTo invo_last_update_request) exitWith { diag_log format["----- updateRequest NO UPDATE NEEDED. packet: %1", _packet]; };

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;
["updateRequest", false, 0] call life_fnc_antiCheatCash;
["updateRequest", true, 0] call life_fnc_antiCheatCash;
invo_last_update_request = _packet;

[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)