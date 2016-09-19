/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

hint "Vente du véhicule....";
//life_action_inUse = true;
_price2 = life_liquide + _price;
[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] spawn life_fnc_MP;
[[format["%1 a vendu un %2 pour %3",name player,_vehicle,[_price] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;

closeDialog 0;
