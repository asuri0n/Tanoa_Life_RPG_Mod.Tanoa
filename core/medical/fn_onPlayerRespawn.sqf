/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

//Comment this code out if you want them to keep the weapon on the ground.
private["_containers"];
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers; //Delete the containers.

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["ziptiesOwners",[],true];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
life_is_arrested = false; // ajout
//Load our gear as a cop incase something horrible happens

/*if(playerSide == west) then {
	[] spawn life_fnc_loadGear;
};*/
switch(playerSide) do
{
	case west:
	{
		[] spawn life_fnc_loadGear;
		//player setVariable ["FAR_isUnconscious", 0, true];
	};

	case civilian:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["ziptiesOwners",[],true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		//_unit setVariable ["FAR_isUnconscious", 0, true];
		life_istazed = false;//added 04/26/2014
		if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};
	};
	case independent:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["ziptiesOwners",[],true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		//player setVariable ["FAR_isUnconscious", 0, true];
		life_istazed = false;//added 04/26/2014
	};
};

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[] execVM "admintools\tools.sqf";
