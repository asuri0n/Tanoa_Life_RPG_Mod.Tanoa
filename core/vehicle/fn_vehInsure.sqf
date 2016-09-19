#include <macro.h>
/*
	File: fn_vehInsure.sqf
	Author: Bloopis, modified by Komodo

	Description:
	Insures the vehicle
*/
private ["_vehicle","_insurePrice","_vinfo","_answer","_vehicleList","_insureCoef","_insured"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _vehicle) exitWith {};
_insured = _vehicle getVariable ["insured",false];
if (_insured) exitWith {hint "Ce véhicule est déjà assuré";};
_insurePrice = 0;
_insureCoef = 1;
_vehicleList = [];
//Komodo: construction de la liste de véhicule, à drastiquement modifier plus tard vu la méthode...

switch (playerSide) do {
    case independent: {
    	_vehicleList = [];
    };
    case civilian: {
    	_vehicleList = (["kart_shop"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["donateur"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["civ_car"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["gang_car"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["civ_luxecar"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["civ_truck"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["reb_car"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["civ_air"] call life_fnc_vehicleListCfg);
    	_vehicleList = _vehicleList + (["civ_ship"] call life_fnc_vehicleListCfg);

    	{
    		if (_x select 0 == typeOf _vehicle) exitWith {_insurePrice = (_x select 1) * _insureCoef;};
    	} count _vehicleList;

	};
};
if (_insurePrice == 0) exitWith {hint "Ce véhicule ne peut être assuré.";};

//CHECK DONATEUR ASSURANCE GRATIS
if(__GETC__(life_donator) != 0) then {
	if (typeOf _vehicle in ["I_Heli_Transport_02_F","B_Quadbike_01_F","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_covered_F","O_Truck_03_device_F","A3L_Dumptruck","B_Truck_01_box_F","B_Truck_01_fuel_F","O_Truck_02_Ammo_F","O_MRAP_02_F","DAR_4X4","DAR_MK27","DAR_MK23","DAR_MK27T","DAR_LHS_16"]) then {
		
	} else {
		_insurePrice = 0;
	};
};

if (life_dabliquide < _insurePrice) exitWith {hint format["Tu ne dispose pas de %1€ en banque, tu ne peux donc pas souscrire à l'assurance !", _insurePrice];};

_answer = [
format["<t color='#8cff9b'>Etes vous sur de vouloir ASSURER ce véhicule pour %1 ?</t>", _insurePrice],
"Assurance",
"Oui",
"Non"
] call BIS_fnc_guiMessage;
if (!_answer) exitWith {hint "Action annulée.";};

if(!(_vehicle getVariable["insured",false])) then
{
	life_dabliquide = life_dabliquide - _insurePrice;
	["vehInsure", true, -1 * _insurePrice] call life_fnc_antiCheatCash;

	_vinfo = _vehicle getVariable["dbInfo",[0,0]];
	[[format["Info : Assurance souscrite pour le joueur : %1 || véhicule plate : %2",(_vinfo select 0), (_vinfo select 1)]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
	hint format["Tu viens d'assurer ton véhicule pour %1 euros",_insurePrice];

	[[_vehicle,player],"TON_fnc_vehicleInsure",true,false] spawn life_fnc_MP; //Komodo: envoi de la mise à jour de l'assurance côté serveur.
	[] spawn SOCK_fnc_updateRequestMoney; //Komodo: added to ensure no one disconnects after to get money back...
}
else
{
	hint "Ce véhicule est déjà assuré !";
};