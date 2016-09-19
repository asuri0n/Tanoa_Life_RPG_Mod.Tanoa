#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];
if((lbCurSel 2401) == -1) exitWith {hint "Tu dois sélectionner un objet a acheter."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
////On appel le prix du marché actuelle en cas d'achat////
_marketprice = [_type] call life_fnc_marketGetBuyPrice;
/*
if(_marketprice != -1) then
{
	_price = _marketprice;
};
		////Fin marché////
		*/
if(!([_amount] call life_fnc_isnumber)) exitWith {hint "Mauvais nombre";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Tu n'as pas assez de places"};
_amount = _diff;

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if((_price * _amount) > life_liquide) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Tu n'as pas assez d'argent!";};
	hint format["Tu as acheté %1 %2 pour $%3",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
	playSound "caching";
	if(_marketprice != -1) then
	{
		//##94
		[_type, _amount] spawn
		{
			sleep 300;
			[_this select 0,_this select 1] call life_fnc_marketBuy;
		};
	};

	__SUB__(life_liquide,(_price * _amount));
	["virt_buy", false, -1 * _price * _amount] call life_fnc_antiCheatCash;


	[] call life_fnc_virt_update;
};
[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)