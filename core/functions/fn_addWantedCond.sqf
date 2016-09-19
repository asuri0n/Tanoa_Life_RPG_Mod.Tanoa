#include <macro.h>

/*
	File: fn_addWantedCond.sqf
	Author: Ladislas Robin

	Description:
	Put somebody in wanted list with some conditions
	(replace [[_PUID,_nameSuspect,_str],"INVO_fnc_wantedAdd",false,false] spawn BIS_fnc_MP for example)
*/

private["_PUID", "_nameSuspect", "_str", "_listNearestPlayer", "_okForWanted", "_nbRand", "_nbTemoin", "_suspect"];

_PUID = _this select 0;
_nameSuspect = _this select 1;
_suspect = _this select 2;
_str = _this select 3;

if(isNull _suspect) exitWith {}; //Not valid
if(player == _suspect) exitWith {};
if(!isPlayer _suspect) exitWith {};
if((_suspect getVariable "restrained")) exitWith {};
if((player getVariable "restrained")) exitWith {};
if(playerSide == independent) exitwith{};
if(playerSide == west) exitwith{};

_listNearestPlayer = _suspect nearEntities ["Man", 200]; //liste de joueur dans les 200 m
_okForWanted = false;
_nbTemoin = 0;
_nbRand = 0;

{
	_nbRand = round random 2; //une chance sur x + 1
	if(((group _suspect) != (group _x)) && (player != _x) && (_nbRand == 1) && (_suspect != _x) && (isPlayer _x))
		then
		{
			_okForWanted = true;
			_nbTemoin = _nbTemoin +1;
		};
} forEach _listNearestPlayer;

if(_okForWanted)
	then
	{
		/* [[_PUID,_nameSuspect,_str],"INVO_fnc_wantedAdd",false,false] spawn BIS_fnc_MP; */
		[_PUID,_nameSuspect,_str] call INVO_fnc_wantedAdd;
		_msg = format["Vous avez été surpris en flagrant délit par %1 témoin(s), vous êtes par conséquent recherché sur Interpol !", _nbTemoin];
		[[2,_msg,true],"life_fnc_broadcast",_suspect,false] spawn life_fnc_MP;
	};