/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint "Tu dois attendre 3 minutes pour payer la caution."};
if(life_dabliquide < life_bail_amount) exitWith {hint format["Tu n'as pas $%1 dans ta banque pour payer l'amende.",life_bail_amount];};

life_dabliquide = life_dabliquide - life_bail_amount;
["postBail", true, -1 * life_bail_amount] call life_fnc_antiCheatCash;
life_bail_paid = true;
[[0,format["%1 a été envoyé en prison!", _unit getVariable ["realname",name _unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
