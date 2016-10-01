/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint "Tu as déjà utilisé la sauvegarde du joueur il y a moins de 5 minutes.";};

switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};

	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint "Un cheater a stopé le chargement de la mission.\n\nEssayer dans quelques minutes.";};

[] call SOCK_fnc_updateRequest;
hint parseText format["<t size='1.1px'>Sauvegarde du joueur dans la base de données.\n\nAttendez minimum 20 secondes.<br><t color='#FF0000' size='1.3px' align='center'>Attention</t><br><t size='1.3px'>L'argent liquide ne se sauvegarde pas après votre déconnection"];
[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};
