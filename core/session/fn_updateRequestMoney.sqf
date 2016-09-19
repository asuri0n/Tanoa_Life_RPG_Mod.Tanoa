/*
	File: fn_updateRequestMoney.sqf
	Author: Tonic, modified by Komodo

	Description:
	Handles sync of player money data with server.
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,life_liquide,life_dabliquide];

if (_packet isEqualTo invo_last_update_request_money) exitWith {diag_log format["----- updateRequestMoney NO UPDATE NEEDED. packet: %1", _packet];};

[_packet,"DB_fnc_updateRequestMoney",false,false] spawn life_fnc_MP;
["updateRequest", false, 0] call life_fnc_antiCheatCash;
["updateRequest", true, 0] call life_fnc_antiCheatCash;
invo_last_update_request_money = _packet;