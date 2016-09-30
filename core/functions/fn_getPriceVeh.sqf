private["_ind","_price","_vehicleList","_className"];

_className = param [0,"-1",[""]];

if(_className == "-1") exitWith {hint "Erreur récupération du prix. Appeler un admin."};

_vehicleList = [];
_vehicleList = (["kart_shop"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["donateur"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["civ_car"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["gang_car"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["civ_luxecar"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["civ_truck"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["reb_car"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["civ_air"] call life_fnc_vehicleListCfg);
_vehicleList = _vehicleList + (["civ_ship"] call life_fnc_vehicleListCfg);

_ind = [_className,_vehicleList] call life_fnc_index;

_price = ((_vehicleList select _ind) select 1);
_price;