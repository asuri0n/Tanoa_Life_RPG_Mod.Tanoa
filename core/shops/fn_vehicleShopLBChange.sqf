#include <macro.h>
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","_assurPrice","_insureCoef","_vehPrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg;
_basePrice = (_vehicleList select _vIndex) select 1;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

// get vehicule buy price (another one to be sync with other price assurance)
_vehPrice = [_className] call life_fnc_getPriceVeh;

// Prix reduis selon donateur lvl
_assurPrice = 1000;
_insureCoef = 1;
switch (__GETC__(life_donator)) do {
    case 1: {
		_basePrice = round(_basePrice - (_basePrice*(call vaca_don_1)));
    	_insureCoef = (call insureCoef1);
    };
    case 2: {
		_basePrice = round(_basePrice - (_basePrice*(call vaca_don_2)));
    	_insureCoef = (call insureCoef2);
    };
    case 3: {
		_basePrice = round(_basePrice - (_basePrice*(call vaca_don_3)));
    	_insureCoef = (call insureCoef3);
    };
    case 0: {
		_basePrice = _basePrice;
		_insureCoef = (call insureCoef);
    };
};
_assurPrice = round(_vehPrice * (call rentToBuy) * _insureCoef);

ctrlShow [2330,true];
(getControl(2300,2303)) ctrlSetStructuredText parseText format[
"
	Prix location: <t color='#8cff9b'>$%1</t><br/>
	Prix achat: <t color='#8cff9b'>$%2</t><br/>
	Vitesse max: %3 km/h<br/>
	Nombre CV: %4<br/>
	Sieges passagers: %5<br/>
	Coffre: %6<br/>
	Reservoir: %7<br/>
	Blindage: %8<br/><br/>
	Prix assurance: <t color='#8cff9b'>%9€</t><br/>
",
[_basePrice] call life_fnc_numberText,
[round(_basePrice * (call rentToBuy))] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"Vide"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleInfo select 9,
[_assurPrice] call life_fnc_numberText
];

_ctrl = getControl(2300,2304);
lbClear _ctrl;
_colorArray = [_className] call life_fnc_vehicleColorCfg;

for "_i" from 0 to count(_colorArray)-1 do {
	if((_colorArray select _i) select 1 == (life_veh_shop select 2)) then {
		_temp = [_className,_i] call life_fnc_vehicleColorStr;
		_ctrl lbAdd format["%1",_temp];
		_ctrl lbSetValue [(lbSize _ctrl)-1,_i];
	};
};

if(_className in (__GETC__(life_vShop_rentalOnly))) then {
	ctrlEnable [2309,false];
} else {
	if(!(life_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

lbSetCurSel[2304,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;