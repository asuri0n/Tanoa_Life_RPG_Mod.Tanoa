/*
	File: fn_packupConeWithlight.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Packs up a deployed barriere.
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule." };
private["_barrieres"];
_barrieres = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;

if(isNil "_barrieres") exitWith {};

if(([true,"conewithlight",1] call life_fnc_handleInv)) then
{
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText["Tu as ramassé le cone.","PLAIN"];
	deleteVehicle _barrieres;
};

life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];