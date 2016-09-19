/*
	File: fn_CivpullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred	
*/
if(player getVariable "civrestrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
titleText["Tu as été éjecté du véhicule","PLAIN"];
titleFadeOut 4;