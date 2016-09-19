/*
	FileName: fn_updateAreaBank.sqf
	Author: Komodo
	Description
	Updates the bank account of a capturable area when something is sold. the global variable "invo_shop_area" holds the zone id (0 for zone 1, ...)
*/
private ["_money","_hideout","_bank"];

_money = [_this,0,0,[0]] call BIS_fnc_param;

if (invo_shop_area < 0) exitWith {};
if (_money <= 0) exitWith {};

{
	if (_x select 0 == invo_shop_area) exitWith
	{
		_hideout = missionNamespace getVariable [_x select 1, objNull];
		_bank = _hideout getVariable ["bank",0];
		_bank = _bank + _money;
		_hideout setVariable ["bank", _bank, true];
	};
} count INVO_listCaptureArea;
