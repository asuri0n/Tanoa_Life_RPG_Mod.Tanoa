#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_answer"];

disableSerialization;

_answer =  false;
//Komodo: ajout message de confirmation vente/location

_answer = [
	format["Etes vous sur de vouloir VENDRE ce véhicule?"],
	"Vente Véhicule",
	true,
	true
] call BIS_fnc_guiMessage;
if (!_answer) exitWith {hint "Action annulée.";};

ctrlEnable [2844, false];
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
closeDialog 0;
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "ERREUR..."};
if (invo_last_sold_vehicle == _vid) exitWith {}; //Dans le cul les gros cheateurs.

// Get vehicle sell price
_price = [_className,__GETC__(life_garage_sell)] call life_fnc_index;
if(_price == -1) then {
	_price = round(_vehPrice * (call sellCoef));
} else {
	_price = (__GETC__(life_garage_sell) select _price) select 1;
};

[] call life_fnc_changeInVehicleGarage;
[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
invo_last_sold_vehicle = _vid;