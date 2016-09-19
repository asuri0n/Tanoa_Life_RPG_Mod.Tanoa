/*
	File: fn_busDriverServiceStart
	Author: Komodo with Ladis

	Description:
	Start service of bus driver.
	Fills in a global public list
	Will make this better later :)
*/

if (player in invo_busDrivers) exitWith {hint "Tu as déjà prit ton service!";};

hint "Tu as prit ton service, tiens toi prêt!";
invo_busDrivers pushBack (player);
publicVariable "invo_busDrivers";