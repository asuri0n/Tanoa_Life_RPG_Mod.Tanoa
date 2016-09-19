#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

//diag_log "House Owner:";
//diag_log (_house getVariable "house_owner");

if(((_house getVariable "house_owner") select 0) != _uid) exitWith {hint "Vous ne pouvez vendre la maison de quelqu'un d'autre.";};
_isSold = _house getVariable ["house_sold",false];

//diag_log "Sell House : isSold";
//diag_log _isSold;

if(_isSold) exitWith
{
	hint "Cette maison à déja été vendue, votre tentative de glitch est actuellement loguée par le serveur.";
	[[format["/!\ TENTATIVE GLITCH MAISON DETECTEE: %1 (uid : %2 ) a tenté de vendre une maison déja vendue",name player, getPlayerUID player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format["Etes-vous sûr de vouloir vendre votre maison? Elle se vendra pour: <t color='#8cff9b'>$%1 divisé par deux</t>",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],"Vendre Maison","Vendre","Annuler"
] call BIS_fnc_guiMessage;

if(_action) then {
	_house setVariable["house_owner",["0000","Vendue"],true];
	_house setVariable["house_sold",true,true];
	[[_house],"TON_fnc_sellHouse",false,false] spawn life_fnc_MP;
	_house setVariable["locked",false,true];
	_house setVariable["Trunk",nil,true];
	_house setVariable["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable["uid",nil,true];

	life_dabliquide = life_dabliquide + (round((_houseCfg select 0)/2));
	["raidHouse", true, (round((_houseCfg select 0)/2))] call life_fnc_antiCheatCash;
	_index = life_vehicles find _house;
	if(_index != -1) then {
		life_vehicles deleteAt _index;
	};

	_index = [str(getPosATL _house),life_houses] call life_fnc_index;
	if(_index != -1) then {
		life_houses deleteAt _index;
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};

	[] spawn SOCK_fnc_updateRequestMoney; //Komodo: added to ensure no one disconnects and looses the money
};
