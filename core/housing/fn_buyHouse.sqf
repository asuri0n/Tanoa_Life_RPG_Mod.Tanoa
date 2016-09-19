#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if(!(_house isKindOf "House_F")) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if((_house getVariable["house_owned",false])) exitWith {hint "Cette maison n'est pas a vendre, pour l'instant"; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};

if((count life_houses == 1) && (__GETC__(life_donator) < 1)) exitWith {hint format["Tu ne peux avoir que seulement 1 maison en non donateur."]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if((count life_houses == 3) && (__GETC__(life_donator) == 1)) exitWith {hint format["Tu ne peux avoir que seulement 3 maison en donateur 1."]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if((count life_houses == 4) && (__GETC__(life_donator) == 2)) exitWith {hint format["Tu ne peux avoir que seulement 4 maison en donateur 2."]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if((count life_houses == 5) && (__GETC__(life_donator) == 3)) exitWith {hint format["Tu ne peux avoir que seulement 5 maison en donateur 3."]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};

if((count life_houses >= (__GETC__(life_houseLimit)))&& (__GETC__(life_donator) > 0)) exitWith {hint format["Tu ne peux avoir que seulement %1 maisons et garages à la fois.",__GETC__(life_houseLimit)]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};


if(!isNil {(_house getVariable "house_sold")}) exitWith {hint "Cette maison à été vendu, mais n'est pas encore disponible à l'achat"; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if(!license_civ_home) exitWith {hint "Tu n'as pas la licence de propriétaire!"};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};


_action = [
	format["Cette maison est disponible pour <t color='#8cff9b'>$%1</t><br/>La maison peut contenir jusqu'a %2 storage containers",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],"Agence","Acheter","Annuler"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_dabliquide < (_houseCfg select 0)) exitWith {hint "Vous n'avez pas assez d'argent sur votre compte pour acheter cette maison!"; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
	[[_uid,_house],"TON_fnc_addHouse",false,false] spawn life_fnc_MP;
	_house setVariable ["house_owner",[_uid,profileName],true];
	_house setVariable ["locked",true,true];
	_house setVariable ["Trunk",[[],0],true];
	_house setVariable ["containers",[],true];
	_house setVariable ["uid",round(random 99999),true];
	_house setVariable ["contentInit", true, true];
	_house setVariable ["syncInProgressTrunk", false, true];
	_house setVariable ["syncInProgressContainers", false, true];
	_house setVariable ["slots",[],true];
	life_dabliquide = life_dabliquide - (_houseCfg select 0);
	["buyHouse", true, -1 * (_houseCfg select 0)] call life_fnc_antiCheatCash;
	life_vehicles pushBack _house;
	life_houses pushBack [(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
	[] spawn SOCK_fnc_updateRequestMoney; //Komodo: added to ensure no one disconnects after to get money back...
};
life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];