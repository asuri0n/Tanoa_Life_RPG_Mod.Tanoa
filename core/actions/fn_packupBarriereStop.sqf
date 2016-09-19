/*
	File: fn_packupBarriere.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Packs up a deployed barriere.
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule." };
private["_barriereStops"];
_barriereStops = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_barriereStops") exitWith {};

if(([true,"barriereStop",1] call life_fnc_handleInv)) then
{
	titleText["Tu as ramassé la barrière Stop.","PLAIN"];
	deleteVehicle _barriereStops;
};
