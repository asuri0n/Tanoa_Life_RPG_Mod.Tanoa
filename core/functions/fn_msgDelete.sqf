/*
	File: fn_msgDelete.sqf
	Author: Bloopis edited by S.lambert
	Date : 05/11/2014

	Description:
	Delete foreach client alert messages

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
life_stopRedCode = true;
life_redCode = false;
life_drawingMessage = false;
sleep 2;
[[0],"life_fnc_displayCode",true,false] spawn BIS_fnc_mp;	// delete all messages
/*player setVariable["redCode",false,true];
player setVariable["stopRedCode",true,true];
player setVariable["drawingMessage",false,true];*/
(uinamespace getvariable "BIS_AAN") closedisplay 1;