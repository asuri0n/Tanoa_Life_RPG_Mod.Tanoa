/*
	File: fn_serviceTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for the service truck.
	*Needs to be revised for new system and flow*
*/
private["_nearby"];
_nearby = nearestObjects[(vehicle player),["Car","Ship","Air"],10];
if(count (_nearby) > 1) then
{
	_vehicle = _nearby select 1;
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	titleText[format["Réparation de %1 ne bouger pas...",_name],"PLAIN"];
	titleFadeOut 12;
	sleep 10;
	if((vehicle player) distance _vehicle > 10) exitWith {titleText["Impossible de faire le plein / réparer ce véhicule parce que vous êtes a plus de 10m","PLAIN"];};
	titleText[format["Tu as réparé et ravitaillé %1",_name],"PLAIN"];
	if(!local _vehicle) then
	{
		[{_vehicle setFuel 1;},"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
	}
		else
	{
		_vehicle setFuel 1;
	};
	_vehicle setDamage 0;
};