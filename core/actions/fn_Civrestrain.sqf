/*
	File: fn_Civrestrain.sqf
	Author & Traduction : Skydre
	Description:
	Retrains the client.
*/
private["_cop"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

[] spawn

titleText[format["Tu as été ligoté par %1",name _cop],"PLAIN"];

while {player getVariable "civrestrained"} do
{
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "civrestrained") || vehicle player != _state};
	if(!alive player) exitWith
	{
		player setVariable ["civrestrained",false,true];
		player setVariable ["playerSurrender",false,true];
	};

	if(vehicle player != player) then
	{
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

if(alive player) then
{
	titleText["Tu as été libéré, tu viens de te défaire de tes liens.","PLAIN"];
};