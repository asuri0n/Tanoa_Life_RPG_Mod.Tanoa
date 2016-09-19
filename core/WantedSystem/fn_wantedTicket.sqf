/*
	File: fn_wantedTicket.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks the price of the ticket against the bounty, if => then bounty remove them from the wanted list.
	OBSOLETE ?
*/
private["_price","_uid","_ind","_entry"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_price = [_this,1,0,[0]] call BIS_fnc_param;
if(_uid == "" OR _price == 0) exitWith {};

_ind = [_uid,invo_wanted_list] call life_fnc_index;
if(_ind == -1) exitWith {};
invo_wanted_list deleteAt _ind;


publicVariable "invo_wanted_list";