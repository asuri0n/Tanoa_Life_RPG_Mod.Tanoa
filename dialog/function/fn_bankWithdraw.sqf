/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint "Tu ne peux pas retirer plus de $999,999";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "Mauvais format."};
if(_val > life_dabliquide) exitWith {hint "Tu n'as pas assez sur ton compte en banque!"};
if(_val < 100 && life_dabliquide > 20000000) exitWith {hint "Tu ne peux pas retirer moins de $100"}; //Temp fix for something.
if(life_dab_last_withdraw + 5 > time) exitWith {hint "Pas si vite! Tu dois attendre 5 secondes avant de retirer/déposer à nouveau.";};

life_liquide = life_liquide + _val;
["bankWithdraw", false, _val] call life_fnc_antiCheatCash;
life_dabliquide = life_dabliquide - _val;
["bankWithdraw", true, -1 * _val] call life_fnc_antiCheatCash;
hint format ["Tu as retiré $%1 de ton compte en banque",[_val] call life_fnc_numberText];
[[format["%1 a retire %2 sur son compte",name player,_val]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequestMoney; //Silent Sync
life_dab_last_withdraw = time;