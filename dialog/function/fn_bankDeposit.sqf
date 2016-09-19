/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > life_liquide) exitWith {hint "Tu n'as pas assez d'argent sur toi."};
if(life_dab_last_withdraw + 3 > time) exitWith {hint "Pas si vite! Tu dois attendre 3 secondes avant de retirer/déposer à nouveau.";};
if((life_dabliquide + _value) > 20000000) exitWith {hint "Chère client, vous avez atteint votre plafond. Bonne journée de me***"};

life_liquide = life_liquide - _value;
["banDeposit", false, -1 * _value] call life_fnc_antiCheatCash;
life_dabliquide = life_dabliquide + _value;
["bankDepost", true, _value] call life_fnc_antiCheatCash;

hint format["Tu as déposé $%1 sur ton compte en banque",[_value] call life_fnc_numberText];
[[format["%1 a depose %2 sur son compte",name player,[_value] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequestMoney; //Silent Sync
life_dab_last_withdraw = time;
