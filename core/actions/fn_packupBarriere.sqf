/*
	File: fn_packupBarriere.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Packs up a deployed barriere.
*/
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule." };
private["_barrieres","_lightA","_lightB"];
_barrieres = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
_lightA = nearestObjects[getPos player,["Land_Flush_Light_red_F"],8] select 0;
_lightB = nearestObjects[getPos player,["Land_Flush_Light_red_F"],8] select 1;

if(isNil "_barrieres") exitWith {};

if(([true,"barriere",1] call life_fnc_handleInv)) then {
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText["Tu as ramassé la barrière.","PLAIN"];
	deleteVehicle _barrieres;
	if (!(isNil "_lightA")) then {deleteVehicle _lightA;};
	if (!(isNil "_lightB")) then {deleteVehicle _lightB;};
};

life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];