#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_sellPrice","_assur","_assurPrice","_vehPrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_assur = (_dataArr select 2);
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

// get vehicule buy price
_vehPrice = [_className] call life_fnc_getPriceVeh;

// Get vehicle garage price
_retrievePrice = [_className,__GETC__(life_garage_prices)] call life_fnc_index;
if(_retrievePrice == -1) then {
	_retrievePrice =  round(_vehPrice* (call sortieVhlCoef));
} else {
	_retrievePrice =  (__GETC__(life_garage_prices) select _retrievePrice) select 1;
};
// Get vehicle sell price
_sellPrice = [_className,__GETC__(life_garage_sell)] call life_fnc_index;
if(_sellPrice == -1) then {
	_sellPrice = round(_vehPrice * (call sellCoef));
} else {
	_sellPrice =  (__GETC__(life_garage_sell) select _sellPrice) select 1;
};
//Get vehicle assurance price
_assurPrice = 1000;
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
_assurPrice = round(_vehPrice * (call rentToBuy) * _insureCoef);

(getControl(2800,2803)) ctrlSetStructuredText parseText format["
	Prix de sortie: <t color='#8cff9b'>$%1</t><br/>
	Prix de vente: <t color='#8cff9b'>$%2</t><br/>
	Couleur: %8<br/>
	Vitesse max: %3 km/h<br/>
	Puissance cheveaux: %4<br/>
	Places passager: %5<br/>
	Stockage: %6<br/>
	Fuel: %7<br/>
	<br/>
	Etat de l'assurance: %9<br/>
	Prix assurance: <t color='#8cff9b'>%10€</t><br/>
	",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"Vide"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleColor,
if(_assur == 1) then {"<t color='#8cff9b'>Assuré</t>"} else {"<t color='#FF0000'>Non assuré</t>"},
[_assurPrice] call life_fnc_numberText
];

ctrlShow [2803,true];
ctrlShow [2830,true];