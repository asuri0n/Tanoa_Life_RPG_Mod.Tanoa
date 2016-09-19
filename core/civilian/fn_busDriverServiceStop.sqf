/*
	File: fn_busDriverServiceStop.sqf
	Author: Komodo with Ladis

	Description:
	Stop service of bus driver.
	Fills in a global public list
	Will make this better later :)
*/
private ["_found"];

_found = false;
{
	if (_x == player) exitWith
	{
		invo_busDrivers deleteAt _foreachIndex;
		_found = true;
	};
} forEach invo_busDrivers;

if (_found) then
{
	publicVariable "invo_busDrivers";
	hint "Tu as bien été retiré de la liste des chauffeurs en service";
};