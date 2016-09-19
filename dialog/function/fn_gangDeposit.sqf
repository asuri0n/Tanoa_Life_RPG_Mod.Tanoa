#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if((playerSide == west) OR (playerSide == independent)) exitWith {hint "Arrête de glitcher bordel!";};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > life_dabliquide) exitWith {hint "Tu n'as pas assez d'argent sur ton compte en banque"};
if(life_dab_last_withdraw + 5 > time) exitWith {hint "Pas si vite! Tu dois attendre 5 secondes avant de retirer/déposer à nouveau.";};
if((life_dabliquide + _value) > 50000000) exitWith {hint "Chère client, vous avez atteint votre plafond. Bonne journée de me***"};

__SUB__(life_dabliquide,_value);
["gangDeposit", true, -1 * _value] call life_fnc_antiCheatCash;
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint parseText format["Tu as déposé <t color='#78cf1f'>$%1</t> sur le compte en banque du gang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequestMoney; //Silent Sync
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
life_dab_last_withdraw = time;
