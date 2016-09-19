/*
	Pulls civilians out of a car if it's stopped.
	Author & Traduction : Skydred
*/
//Ajout Sky StoreVehicle
private["_nearVehicles","_vehicle","_crew","_cP"];
//if((_unit getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "restrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if((player getVariable "civrestrained")) exitWith {hint "Cette action est impossible ou non autorisée."};
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
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
_crew = crew _vehicle;
_cP = 0;
{
	if(_x getVariable["civrestrained",false]) then
	{
		//hint format["%1",_x];
		_cP = _cP + 1;
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_CivpulloutVeh",_x,false] spawn life_fnc_MP;
	};
} foreach _crew;

if(_cP < 1) exitWith { hint "Action impossible. Il n'y a aucun otage dans ce véhicule." };