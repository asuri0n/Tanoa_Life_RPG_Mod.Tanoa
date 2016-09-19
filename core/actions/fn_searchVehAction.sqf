/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint "Ce véhicule ne dispose d'aucune information, sûrement un cheater. Merci d'en informer les administrateurs par SMS. \n\nVéhicule supprimé."; deleteVehicle _vehicle;};
	life_action_inUse = true;
	player setVariable ["AGM_canTreat", false, true];
	hint "Recherche du véhicule....";
	sleep 3;
	life_action_inUse = false;
	player setVariable ["AGM_canTreat", true, true];
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint "Impossible de chercher ce véhicule";};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;

	if(_owners == "Personne<br/>") then
	{
		_owners = "Pas de propriétaires, mets le en fourrière<br/>";
	};
	hint parseText format["<t color='#FF0000'><t size='2'>Informations</t></t><br/><t color='#FFD700'><t size='1.5'>Propriétaires</t></t><br/> %1",_owners];
};