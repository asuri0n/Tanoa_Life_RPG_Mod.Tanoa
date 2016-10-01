/*
	Author: Bryan "Tonic" Boardwine

	Description:
	A short function for telling the player to add a vehicle to his keychain.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isServer && isDedicated) exitWith {};

if(!(_vehicle in life_vehicles)) then
{
	life_vehicles pushBack _vehicle;
};
//Ajout Serrat, à tester
if(_vehicle isKindof "Air") exitWith {};
if((typeOf _vehicle) in ["I_MRAP_03_F","B_MRAP_01_F","O_MRAP_02_F","B_MRAP_01_hmg_F","I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F"] && (!license_civ_rebel) && ((playerSide == civilian) OR (playerSide == east))) exitWith
{
	if((count crew _vehicle) == 0) then
	{
		[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
		hint "Vous devez posseder la licence rebelle pour utiliser ce véhicule";
	}
		else
	{
		hint "Il y a un joueur dans le vehicule";
	};
};
