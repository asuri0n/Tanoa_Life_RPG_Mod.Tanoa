/*
	Author: Komodo
	Filename: fn_openGarage.sqf

	Description:
	Function that enables to both simplify mission.sqm code and allows queries to DB optimization by using local cache.
    [""Air"", ""air_g_aiportNord""] call life_fnc_openGarage;
*/
private["_type","_sp"];

_type = [_this,0,"",[""]] call BIS_fnc_param;
_sp = _this select 1;

if (!(_type in ["Car", "Air", "Ship"])) exitWith {hint "Erreur type de Garage. Contactez un Admin.";};

life_garage_sp = _sp;
life_garage_type = _type;

createDialog "Life_impound_menu";

disableSerialization;
ctrlSetText[2802,"Recherche véhicules...."];

switch (true) do {
    case (_type == "Car"):
    {
    	if (invo_garage_change_car) then
    	{
    		//Komodo: requête nécessaire, go serveur!
    		[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
    	}
    	else
    	{
    		//Komodo: Better to use local cache :)
			[invo_garage_last_query_car] call life_fnc_impoundMenu;
    	};
    };
    case (_type == "Air"):
    {
    	if (invo_garage_change_air) then
    	{
    		//Komodo: requête nécessaire, go serveur!
    		[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
    	}
    	else
    	{
    		//Komodo: Better to use local cache :)
			[invo_garage_last_query_air] call life_fnc_impoundMenu;
    	};
    };
    case (_type == "Ship"):
    {
    	if (invo_garage_change_ship) then
    	{
    		//Komodo: requête nécessaire, go serveur!
    		[[getPlayerUID player,playerSide,_type,player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
    	}
    	else
    	{
    		//Komodo: Better to use local cache :)
			[invo_garage_last_query_ship] call life_fnc_impoundMenu;
    	};
    };
};