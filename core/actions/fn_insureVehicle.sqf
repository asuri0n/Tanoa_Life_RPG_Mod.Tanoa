#include <macro.h>
/*
	File: fn_insureVehicle.sqf
	Author: Bloopis

	Description:
	Insures the vehicle
*/
private["_vehicle","_time","_price","_price","_display","_control"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(player distance cursorTarget > 6) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air")) || ((typeOf _vehicle) == "O_MRAP_02_hmg_F") || ((typeOf _vehicle) == "O_MRAP_02_gmg_F")|| ((typeOf _vehicle) == "I_G_Offroad_01_armed_F")|| ((typeOf _vehicle) == "B_G_Offroad_01_armed_F")|| ((typeOf _vehicle) == "O_G_Offroad_01_armed_F") || ((typeOf _vehicle) == "C_Kart_01_F") || ((typeOf _vehicle) == "C_Kart_01_Fuel_F") || ((typeOf _vehicle) == "C_Kart_01_Blu_F") || ((typeOf _vehicle) == "C_Kart_01_Red_F") || ((typeOf _vehicle) == "C_Kart_01_Vrana_F")) exitWith {hint "Pas d'assurance pour ce type de véhicule !"};

	if( ([(getPlayerUID player),(_vehicle getVariable["vehicle_info_owners", []])] call life_fnc_index) == -1) exitWith {hint "Ce véhicule ne vous appartient pas, vous ne pouvez pas l'assurer !";};

	/*_vInfo = _vehicle getVariable["dbInfo",[]];
	if(count _vInfo == 0) exitWith {hint "Votre véhicule n'est pas permanent, vous ne pouvez donc pas l'assurer.";};*/

	_price = ([(typeOf _vehicle),__GETC__(life_price_insurance)] call life_fnc_index);
	if((__GETC__(life_donator) < 1)) then
		if(_price == -1) then {
			_price = 500000;
		} else {
			_price = (((__GETC__(life_price_insurance)) select _price) select 1);
		};	
	} else {
		_price = 0;
	};

	createDialog "life_insure_confirm";
	disableSerialization;
	waitUntil {!isnull (findDisplay 3310)};
	_display = findDisplay 3310;
	_control = _display displayCtrl 3311;

	life_insure_veh = _vehicle;
	life_insure_val = _price;
		_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>L'assurance n'est pas disponible. Si vous cliquez sur le bouton, vous serez débité automatiquement de %1€ de votre compte en banque.",_price];

	//_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>Vous souhaitez assurer le véhicule contre l'explosion en payant %1€, vous confirmez ?<br /><br />Attention, l'assurance n'est valide que jusqu'à la disparition du véhicule (restart/rangement garage/mise en fourrière).",_price];
	waitUntil {isnull (findDisplay 3310)};
	life_insure_veh = ObjNull;
	life_insure_val = 0;
};