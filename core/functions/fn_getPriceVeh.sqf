private["_ind","_price","_className"];

_className = param [0,"-1",[""]];

if(_className == "-1") exitWith {hint "Erreur récupération du prix. Appeler un admin."};

_ind = [_className,life_vehicleList] call life_fnc_index;

_price = if((life_vehicleList select _ind) select 1 == -1) then {1000} else {((life_vehicleList select _ind) select 1)};

diag_log format ["DEBUG - _price: %1", _price];
_price;