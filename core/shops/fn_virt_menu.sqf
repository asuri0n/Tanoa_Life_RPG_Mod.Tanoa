/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint "Tu n'es pas un gendarme."};
if(_shop == "med" && playerSide != independent) exitWith {hint "Tu n'es pas medecin."};
if(_shop == "dep" && playerSide != independent) exitWith {hint "Tu n'es pas un depanneur."};
createDialog "shops_menu";

//[_shop] spawn life_fnc_spotShop;
[] call life_fnc_virt_update;