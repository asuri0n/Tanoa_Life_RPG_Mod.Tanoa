/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Tu n'as rien sélectionné.";};
if(!([_value] call life_fnc_isnumber)) exitWith {hint "Tu n'as pas sélectionné un vrai nombre."};
if(parseNumber(_value) <= 0) exitWith {hint "Tu dois sélectionner un nombre d'objet a supprimer."};
_ind = [_data,life_illegal_items] call life_fnc_index;
if(_ind != -1 && ([west,getPos player,30] call life_fnc_nearUnits)) exitWith {};
if(player != vehicle player) exitWith {titleText["Impossible en véhicule.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Impossible de supprimer autant d'objets, surment car vous en avez pas assez?"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Tu as supprimé %1 %2 de ton inventaire.",(parseNumber _value), _type];

[] call life_fnc_p_updateMenu;