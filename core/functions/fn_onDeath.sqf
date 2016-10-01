#include <macro.h>
/*
	File: fn_onDeath.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does whatever it needs to when a player dies.
*/
private["_unit","_killer","_weapons","_handle"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_source = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

//if(playerSide != civilian) then //Ancienne ligne
if(playerSide != west) then //ajout serrat pour ambu
{
	removeAllContainers _unit;
	removeAllWeapons _unit;
	removeHeadgear _unit;
};

life_is_arrested = false;
[1] call SOCK_fnc_updateRequestCivGear;
invo_cheating = true;
cutText["Vous êtes mort. En attente pour réapparaître....","BLACK FADED"];


/*if((side _source == west) && license_civ_rebel) then {
	[[format["%1 est mort. Perdu sa licence rebelle DEBUT SCRIPT",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
	license_civ_rebel = false;
};*/

[[format["%1 est mort. Il a ete tue par: %2 DEBUT SCRIPT",name player, name _killer]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
0 cutFadeOut 9999999;

hideBody _unit;
//Make my killer wanted!
if(side _source != west && alive _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then
	{
		if(alive _source) then
		{
			[getPlayerUID _source,name _source,_source,"187V"] call life_fnc_addWantedCond;
		};
	}
		else
	{
		[getPlayerUID _source,name _source,_source,"187"] call life_fnc_addWantedCond;
	};
};

if(side _source == west && !life_use_atm) then
{
	if(life_liquide != 0) then
	{
		[format["%1€ ont été retournés à la Banque d'Altis suite à l'élimination du braqueur.",[life_liquide] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_liquide = 0;
		life_liquide_before = 0;
	};
};

//New addition for idiots.
if(side _source == civilian && _source != _unit && !local _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then {
		[[2],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	} else {
		[[3],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	};
};

if(side _source == west && vehicle _source == _source && playerSide == civilian) then
{
	[player,_source,true] call INVO_fnc_wantedBounty;
	[getPlayerUID player] call INVO_fnc_wantedRemove;
}
	else
{
	if((playerSide == civilian) OR (playerSide == east)) then
	{
		[getPlayerUID _unit] call INVO_fnc_wantedRemove;
	};
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_carryWeight = 0;
life_thirst = 100;
life_hunger = 100;
life_use_atm = true;
life_liquide = 0;
life_liquide_before=0;

//Komodo: retrait de 2 x salaire pour les gendarmes en cas de mort - frais d'enterrement.
if (playerSide == west) then {
	/*life_dabliquide = life_dabliquide - __GETC__(life_paycheck)*2;
	if (life_dabliquide < 0) then {life_dabliquide = 0;};
	["onDeath", true, -2 * __GETC__(life_paycheck)] call life_fnc_antiCheatCash;*/

	//SYSTEME DE SPAWN COP DEFAUT QUAND IL MEURT ?
	_handle = [] spawn life_fnc_stripDownPlayer;
	waitUntil {scriptDone _handle};
	[] call life_fnc_copDefault;

};

life_is_arrested = false; //Komodo: on répète pour éviter que certains se retrouvent en taule pour rien.
[] call SOCK_fnc_updateRequest;
invo_cheating = false;

[[format["%1 est mort. FIN SCRIPT",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
