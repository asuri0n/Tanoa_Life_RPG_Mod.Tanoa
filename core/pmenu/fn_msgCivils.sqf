/*
	File: fn_msgCivils.sqf
	Author: Bloopis
	Date : 07/11/2014

	Description:
	Send commercial message to all players

	Parameter(s) :
		N/A

	Returns :
		N/A
*/
private["_display","_fastReply"];

disableSerialization;
waitUntil {!isNull findDisplay 70000};
_display = findDisplay 70000;
_msg = _display displayCtrl 70004;

ctrlSetText [70003, ""];
_msg buttonSetAction "[] spawn life_fnc_sendCommercialMsg;";