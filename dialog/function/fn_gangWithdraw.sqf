#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Filname: fn_gangWithdraw.sqf

	Description:
	Deposits money into the players gang bank.
*/
private["_value","_gFund"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if((playerSide == west) OR (playerSide == independent)) exitWith {hint "Arrête de glitcher bordel!";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if ( ((grpPlayer getVariable "gang_owner") != steamid) && ((player getVariable "gang_rank") < 2) ) exitWith {hint parseText "Tu n'est pas l'un des cadres du groupe. <br/><br/> Il faut être un <t color='#d16428'>officier</t> ou le <t color='#d16428'>leader du clan</t> pour retirer de l'argent."};
if(_value > grpPlayer getVariable "gang_bank") exitWith {hint "Il n'y as pas assez d'argent sur le compte du gang"};
if(life_dab_last_withdraw + 5 > time) exitWith {hint "Pas si vite! Tu dois attendre 5 secondes avant de retirer/déposer à nouveau.";};

if(grpPlayer getVariable["gang_bank_inUse",true]) exitWith {hint "Quelqu'un utilise déjà le compte du Gang.";};
grpPlayer setVariable["gang_bank_inUse",true,true];

//Komodo: anti glitch: attente d'une durée au hasard entre 0 et 2 secondes
[_value] spawn
{
	private ["_value"];
	_value = _this select 0;
	if(_value < 0) exitWith {};
	sleep(random(2));
	if(_value > grpPlayer getVariable "gang_bank") exitWith {hint "Il n'y as pas assez d'argent sur le compte du gang"};
	__ADD__(life_dabliquide,_value);
	["gangWithdraw", true, _value] call life_fnc_antiCheatCash;
	_gFund = (group player) getVariable ["gang_bank",0];
	_gFund = _gFund - _value;
	(group player) setVariable ["gang_bank",_gFund,true];

	hint parseText format["Tu as retiré <t color='#d16428'>$%1</t> sur le compte en banque du gang",[_value] call life_fnc_numberText];
	[] call life_fnc_atmMenu;
	[] call SOCK_fnc_updateRequestMoney; //Silent Sync
	[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	life_dab_last_withdraw = time;
	grpPlayer setVariable["gang_bank_inUse",false,true];
};