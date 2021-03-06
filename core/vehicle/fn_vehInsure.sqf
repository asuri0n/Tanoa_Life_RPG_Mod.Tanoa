#include <macro.h>
/*
	File: fn_vehInsure.sqf
	Author: Bloopis, modified by Komodo

	Description:
	Insures the vehicle
*/
private ["_vehicle","_insurePrice","_vinfo","_answer","_vehicleList","_insureCoef","_insured","_indexConfig"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _vehicle) exitWith {hint "Ce n'est pas votre véhicule";};

if (typeOf _vehicle in ["O_MRAP_02_F","I_MRAP_03_F","I_G_Offroad_01_armed_F"]) exitWith {hint "Véhicule non assurable";};

_insured = _vehicle getVariable ["insured",false];
if (_insured) exitWith {hint "Ce véhicule est déjà assuré";};

_insurePrice = 1000;
_insureCoef = 1;
switch (__GETC__(life_donator)) do {
    case 1: {
    	_insureCoef = (call insureCoef1);
    };
    case 2: {
    	_insureCoef = (call insureCoef2);
    };
    case 3: {
    	_insureCoef = (call insureCoef3);
    };
    case 0: {
		_insureCoef = (call insureCoef);
    };
};

_insurePrice = round(([(typeOf _vehicle)] call life_fnc_getPriceVeh) * (call rentToBuy) * _insureCoef);

_indexConfig = ([(typeOf _vehicle),__GETC__(life_price_insurance)] call life_fnc_index);
if(_indexConfig != -1) then {
     _insurePrice = (((__GETC__(life_price_insurance)) select _indexConfig) select 1);
};

if (_insurePrice == 0) exitWith {hint "Ce véhicule ne peut être assuré.";};

if (life_dabliquide < _insurePrice) exitWith {hint format["Tu ne dispose pas de %1€ en banque, tu ne peux donc pas souscrire à l'assurance !", _insurePrice];};

_answer = [
format["<t color='#8cff9b'>Etes vous sur de vouloir ASSURER ce véhicule pour %1€ ?</t>", _insurePrice],
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