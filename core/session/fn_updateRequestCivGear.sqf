/*
	File: fn_updateRequestCivGear.sqf
	Author: Tonic

	Description: Handles sync data with server for civgear
*/
private["_packet","_mode"];
_mode = [_this,0,0,[0]] call BIS_fnc_param; //0 for usual update, 1 for update of variables only without query to DB.

//if (playerSide != civilian) exitWith {};

_packet = [getPlayerUID player,playerSide];

switch (playerSide) do
{
	case west:
	{
		_packet pushBack cop_gear;
	};
	case civilian:
	{
		[] call life_fnc_civFetchGear;
		_packet pushBack civ_gear;
		_packet pushBack life_is_arrested;
	};
};

if (_packet isEqualTo invo_last_update_request_civgear) exitWith {diag_log format["----- updateRequestCivGear NO UPDATE NEEDED. packet: %1", _packet];};

if (_mode == 0) then {[_packet,"DB_fnc_updateRequestCivGear",false,false] spawn life_fnc_MP;}; //Komodo: update to DB only if required.
invo_last_update_request_civgear = _packet;
player setVariable ["invo_last_update_request_civgear", _packet, true];