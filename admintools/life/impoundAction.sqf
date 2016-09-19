
private["_vehicle","_vehicleData","_vehicleName"];
_vehicle = cursorTarget;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith { hint "Ce véhicule est l'oeuvre d'un tricheur ou d'un admin" }; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[[0,format["%1 ton %2 à été mis en fourrière par un administrateur",(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

	if((count crew _vehicle) == 0) then
	{
		[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
		hint "Véhicule mis en fourrière";
	}
		else
	{
		hint "Il y a un joueur dans le véhicule";
	};
};
[[format["%1 a mis un vehicule en fourriere",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;