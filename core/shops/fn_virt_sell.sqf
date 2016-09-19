#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name","_marketprice","_tax","_gainXp","_profName"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call life_fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;
////Init des variable du marché////
_marketprice = [_type] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Fin de l'init marché////
_amount = ctrlText 2405;
if(!([_amount] call life_fnc_isnumber)) exitWith {hint "Format incorrect";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint "Tu n'as pas assez d'objets a vendre!"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{

	_profName = [_type] call life_fnc_profType;
	
	// Nombre d'XP gagné = nombre d'items récupérés * 2 
	_gainXp = _amount*2;
	diag_log format["_profName %1",_profName];
	titleText[format["Tu as vendu %1 %2 pour $%3 et gagné %4 point(s) d'expérience",_amount,_name,[_price] call life_fnc_numberText, _gainXp],"PLAIN"];
	if( _profName != "" ) then {
		[_profName,_gainXp] call life_fnc_addExp;
	};	
	life_liquide = life_liquide + _price;
	["virt_sell", false, _price] call life_fnc_antiCheatCash;
	_tax = round (_price * 0.1);
	//[_tax] call life_fnc_updateAreaBank;

	[] call life_fnc_virt_update;
	playSound "caching";
////Rentrée marché////
	if(_marketprice != -1) then
	{
		[_type, _amount] spawn
		{
			sleep 300;
			[_this select 0,_this select 1] call life_fnc_marketSell;
		};
	////Fin du script////
		[] call life_fnc_virt_update;
	};

};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call life_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};
