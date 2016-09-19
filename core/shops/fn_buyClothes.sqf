/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText["Tu n'as pas choisi de vêtements.","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > life_liquide) exitWith {titleText["Tu n'as pas assez d'argent !","PLAIN"];};
life_liquide = life_liquide - _price;
["receiveMoney", false, -1 * _price] call life_fnc_antiCheatCash;

life_clothesPurchased = true;
closeDialog 0;
[1] call SOCK_fnc_updateRequestCivGear; //Silent Sync to avoid duplication. We only fill in variables, sync to db will either be handled by next sync data or during disconnection (by any means, even a crash!)
