/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(playerSide == west) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
titleText["Tu as été éjecté du véhicule","PLAIN"];
titleFadeOut 4;