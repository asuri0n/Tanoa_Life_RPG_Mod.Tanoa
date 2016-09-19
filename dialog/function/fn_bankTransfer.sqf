/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint "Tu dois sélectionner une personne"};
if(isNil "_unit") exitWith {hint "Le joueur a déconnecté"};
if(_val > 999999) exitWith {hint "Tu ne peux pas transferer plus de 999.999€";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "Mauvais format."};
if(_val > life_dabliquide) exitWith {hint "Tu n'as pas assez sur ton compte bancaire"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > life_dabliquide) exitWith {hint format["Tu n'as pas assez sur ton compte bancaire, pour transférer $%1 tu as besoin de $%2 de taxes.",_val,_tax]};

life_dabliquide = life_dabliquide - (_val + _tax);
["bankTransfer", true, -1 * (_val + _tax)] call life_fnc_antiCheatCash;

[[_val,profileName],"life_fnc_clientWireTransfer",_unit,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
hint format["Tu as transféré $%1 a %2.\n\nUn taxe de $%3 a été déduite pour le transfert.",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[[format["%1 a envoye %2 a %3 en transaction dab",name player,[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit]]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
[] call SOCK_fnc_updateRequestMoney; //Silent Sync
