private["_ind","_price","_className"];

_className = param [0,"-1",[""]];
if(_className == "-1") exitWith {hint "ERREUR. Mauvais classname du véhicule. Appeler un admin."};

_ind = [_className,life_vehicleList] call life_fnc_index;
if(_ind == -1) exitWith {
	hint "ERREUR. Le véhicule n'est pas dans la liste. Si vous récupérez le véhicule, vous n'allez plus avoir d'argent. Appeler un admin.";
	diag_log format ["[GETPRICEVEH] PLAYER : %1 ; CLASSNAME : %2",player, _className];
	_price = 1000;
};

_price = (life_vehicleList select _ind) select 1;
_price = if(_price == -1) then {1000} else {_price};
_price;