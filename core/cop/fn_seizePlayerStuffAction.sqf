/*
	File: fn_seizePlayerStuffAction.sqf
	Author: Bloopis edited by S.Lambert ( put arrays in configuration.sqf)
	Date : 05/02/2014 edit 03/09/2014

	Description:
	Delete target stuff (clothes)

	Parameter(s) :
		NULL

	Returns:
		NULL
*/
private["_onceDelete"];
_onceDelete = false;

//we check uniform
if ((uniform player) in life_illegalUniform) then
{
	removeUniform player; _onceDelete = true;
};

if ((vest player) in life_illegalVest) then
{
	removeVest player;_onceDelete = true;
};

if ((headgear player) in life_illegalHeadgears) then
{
	removeHeadgear player;_onceDelete = true;
};


if ((goggles player) in life_illegalGoggles) then
{
	removeGoggles player;_onceDelete = true;
};


//we refresh the player
//[] call life_fnc_sessionUpdate;
[] call life_fnc_civFetchGear;
[] call life_fnc_civLoadGear;
//[] call SOCK_fnc_updateRequest; //call our silent sync.
[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)

if(_onceDelete) then {titleText["Vos habits et objets ont été saisies par la milice comme pièces à convictions.","PLAIN"];};