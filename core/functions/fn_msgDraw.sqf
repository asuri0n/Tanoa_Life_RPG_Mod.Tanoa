/*
	File: fn_msgDraw.sqf
	Author: Bloopis
	Date : 05/11/2014
	
	Description:
	Draw for each client news message

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
//we test player initialisation
if(alive player) then {
	if(!life_drawingMessage) then {
		life_redCode = true;
		life_drawingMessage = true;
		[_this select 0,_this select 1] spawn BIS_fnc_AAN;
		player say3D "News";
	};
};

/*if(alive player) then {
	if(!(player getVariable["drawingMessage",false])) then {
		player setVariable["redCode",true,true];
		player setVariable["drawingMessage",true,true];
		[_this select 0,_this select 1] spawn BIS_fnc_AAN;
		player say3D "News";
	};
};*/