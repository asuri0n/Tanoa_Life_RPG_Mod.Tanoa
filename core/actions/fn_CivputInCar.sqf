/*
	File: fn_CivputInCar.sqf
	Author & Traduction : Skydred
	Description:
	GETTING SICK OF WRITING DESCRIPTIONS.
*/
//Ajout Sky StoreVehicle
private["_nearVehicles","_vehicle","_unit"];
if((_unit getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "civrestrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],10]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint "Tu n'es pas propriétaire du véhicule."};
if(isNull _vehicle) exitWith {};
//Fin Ajout Sky StoreVehicle
_unit = (_this select 0);
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
/*if(!(_unit getVariable "Escorting")) exitWith {}; //He's not being Escorted.
detach _unit;*/
detach _unit;
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",true,true];
[[_vehicle],"life_fnc_moveIn",_unit,false] spawn life_fnc_MP;
//_unit moveInCargo _nearestVehicle;