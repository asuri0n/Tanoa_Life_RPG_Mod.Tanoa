/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens & initializes the chop shop menu.
*/

private["_nearVehicles","_control","_nearHumans","_className","_displayName","_picture","_ind","_price"];

if (life_action_inUse) exitWith {hint "Action déjà en cours..."};
disableSerialization;

_nearHumans = {((_x distance player) < 20)} count playableUnits;
if ( _nearHumans > 1 ) exitWith {titleText["Il y a d'autres personnes à proximité du vendeur, cette transaction doit se faire à l'abri des regards indiscrets","PLAIN"];};

_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car"],25];

life_chopShop = (_this select 3);
//Error check
if(count _nearVehicles == 0) exitWith {titleText["Aucun véhicule a vendre.","PLAIN"];};
if(!(createDialog "Chop_Shop")) exitWith {hint "Problème d'ouverture du dialog."};

_control = ((findDisplay 39400) displayCtrl 39402);
{
	if(alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		_ind = [_className,(call life_vehicle_resell)] call life_fnc_index;

		if(_ind != -1 && count crew _x == 0) then {
			_price = ((call life_vehicle_resell) select _ind) select 1;
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} foreach _nearVehicles;