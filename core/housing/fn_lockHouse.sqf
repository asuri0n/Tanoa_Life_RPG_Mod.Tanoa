#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	fileName: fn_lockHouse.sqf
	Description:
	Unlocks / locks the house.
*/
private["_house","_state"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//if((__GETC__(life_donator) == 0)) exitWith {hint "Vous n'etes pas donateur";};
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {hint "Objet Maison NULL, contactez un admin, prenez un screen.";};

/*
Komodo: ajouter un check pour que seul un propriétaire ou un gendarme puisse déverouiller la maison
Il faudrait mettre un timeout pour éviter le spam... et stocker l'infos sur la maison en tant que "cache"
*/

if (_house getVariable ["syncInProgressTrunk", true]) exitWith {hint "Synchro en cours des données de la maison. Cela prend jusqu'à 10 secondes.";};
if (_house getVariable ["syncInProgressContainers", true]) exitWith {hint "Synchro en cours des données de la maison. Cela prend jusqu'à 10 secondes.";};
//[] spawn {sleep 12; _house setVariable ["syncInProgress", false, true];}; désactivé pour l'instant, doit jouer le rôle de failsafe.
_state = _house getVariable["locked",true];
if(_state) then {
	titleText["Containers déverrouillés","PLAIN"];
	[[_house],"TON_fnc_showContainers",false,false] spawn life_fnc_MP;
} else {
	titleText["Containers verrouillés","PLAIN"];
	[_house getVariable ["house_id",-1],"TON_fnc_houseCleanup",false,false] spawn life_fnc_MP;
};