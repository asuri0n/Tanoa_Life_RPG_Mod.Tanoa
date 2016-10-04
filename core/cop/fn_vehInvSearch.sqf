#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint "Véhicule vide"};

hint "Fouille en cours ...";

_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;

	// Si l'item est ilélgale
	_index = [_var,life_illegal_items] call life_fnc_index;
	if(_index != -1) then
	{
		// Si il le prix est dispo sur le marché
		_vIndex = [_var] call life_fnc_marketGetSellPrice;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * _vIndex);
			hint format["firstif _val : %1 ; _vIndex : %2 ; _value %3",_val, _vIndex, _value];
		} else
		{
			// Sinon, si le prix est dans la liste sell_array
			_vIndex = [_var,__GETC__(sell_array)] call life_fnc_index;
			if(_vIndex != -1) then {
				hint format["firstif _val : %1 ; _vIndex : %2 ; _value %3",_val, _vIndex, _value];
				_value = _value + (_val * _vIndex);
			};
		};
	};
} foreach (_vehicleInfo select 0);

sleep 5;

if(_value > 0) then
{
	[[0,format["Le véhicule a été fouillé et %1€ de kilos de drogues ont été perquisitionnés.",[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	life_dabliquide = life_dabliquide + (_value*(call coefPerquisition));
	["vehInventorySearch", true, _value] call life_fnc_antiCheatCash;
	_vehicle setVariable["Trunk",[],true];
}
	else
{
	hint "Rien d'illégal dans le véhicule.";
};
