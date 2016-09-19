/*
	Author: Komodo
	FileName: fn_updateInvoAllies.sqf

	Description: updates invo_allies variables depending on invo_alliances
*/
private["_idFrom","_idTo","_myGangId","_accepted","_index"];

_myGangId = (group player) getVariable["gang_id",-1];
if (_myGangId < 0) exitWith {}; //prevents unnecessary computation

sleep(1); //Might help avoiding lost alliance icons (invo_allies gets empty for no reason...)

//Handles "add" & "remove"
invo_allies = [];

{
	_idFrom = _x select 1;
	_idTo = _x select 2;
	_accepted = false;
	if (_x select 3 == 1) then {_accepted = true;};

	if (_accepted) then
	{
		diag_log format ["INVO_DEBUG - updateInvoAllies - %1","accepted"];
		if (_idFrom == _myGangId) then
		{
			diag_log format ["INVO_DEBUG - updateInvoAllies - %1","mygang"];
			invo_allies pushBack [_idTo, grpNull];
		}
		else
		{
			if (_idTo == _myGangId) then
			{
				diag_log format ["INVO_DEBUG - updateInvoAllies - %1","his gang"];
				invo_allies pushBack [_idFrom, grpNull];
			};
		};
	};
} forEach invo_alliances;

diag_log format ["INVO_DEBUG - updateInvoAllies - %1",invo_allies];