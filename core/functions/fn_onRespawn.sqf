#include <macro.h>
/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Execute various actions when the _unit respawns.
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!isNull _corpse) then{deleteVehicle _corpse;};

if (life_is_arrested && invo_canSuicide) then {life_is_arrested = false;};

hideBody _corpse;
deleteVehicle _corpse;
_handle = [] spawn life_fnc_setupActions;

//waitUntil {scriptDone _handle};

switch(playerSide) do
{
	case west:
	{
		[] spawn life_fnc_loadGear;
		player setVariable ["FAR_isUnconscious", 0, true];//added 04/26/2014
	};

	case civilian:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["ziptiesOwners",[],true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		_unit setVariable ["FAR_isUnconscious", 0, true];//added 04/26/2014
		_unit setVariable ["civrestrained",false,true];
// AJOUT SERRAT

		_unit setVariable ["playerSurrender", false, true];
		_unit setVariable ["FAR_isUnconscious", 0, true];

		_unit setVariable ["saveContact",ObjNull,true];
		_unit setVariable ["invisible",false,true];
		_unit setVariable ["isknocked",false,true];
		life_istazed = false;//added 04/26/2014
		if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};
		//if (license_civ_depanneur && (str player) in ["Depanneur_1","Depanneur_2","Depanneur_3","Depanneur_4","Depanneur_5"]) Then {[] execVM "core\initDepaneur.sqf"};
	};
	case independent:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable ["ziptiesOwners",[],true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		player setVariable ["FAR_isUnconscious", 0, true];//added 04/26/2014
		life_istazed = false;//added 04/26/2014
		switch(true) do
		{
			case (__GETC__(life_medicLevel) > 0) :
			{
				//player setVariable ["AGM_IsMedic", true, true]; //Komodo: nécessaire pour @AGM
				life_actions = life_actions + [player addAction["Voir les inconscient",life_fnc_med,"",0,false,false,"",' playerside == independent ']];
				[] spawn life_fnc_medicLoadout;
				3 radioChannelAdd [player];
			};
			case (__GETC__(life_depanLevel) > 0) :
			{
				[] spawn life_fnc_depanLoadout;
				[] call life_fnc_depanInitActions;
			};
		};

	};
};

if(life_is_arrested) then
{
	hint "Tu as tenté de te suicider dans ta cellule, tu sera emprisonné à nouveau et ta peine sera allongée.";
	life_is_arrested = false;
	[_unit,true] spawn life_fnc_jail;
}
	else
{
	titleText["","BLACK FADED"];
	titleFadeOut 9999999999;
	[] call life_fnc_spawnMenu;
	//waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	hint "C'est une nouvelle vie, il est interdit de revenir sur zone."
};

_unit addRating 100000;

[[_unit,life_sidechat,playerSide],"STS_fnc_managesc",false,false] spawn life_fnc_MP;
[] call life_fnc_hudUpdate;
cutText ["","BLACK IN"];

[] call life_fnc_civFetchGear;
[] execVM "admintools\activate.sqf";
[] execVM "core\functions\tm4_fuelUptake.sqf"
