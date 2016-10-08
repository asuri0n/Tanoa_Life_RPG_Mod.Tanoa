// Source : HomeLife @Joker

private ["_vehicles","_veh","_pos","_price","_oilPrice","_capacity","_oilMaxPrice","_answer"];

_oilPrice = ["plastiquep"] call life_fnc_marketGetSellPrice;
_oilMaxPrice = 15000;
_price = round(_oilPrice*100/_oilMaxPrice);
_vehicles = position player nearObjects ["Car", 6];
if(count _vehicles == 0) then {
	_vehicles = position player nearObjects ["Air", 6];
};
if(count _vehicles == 0) exitWith {hint "Il n'y aucun véhicule près de vous";};
if(vehicle player != player) exitWith {hint "Vous ne pouvez pas effectuer cette action depuis un véhicule";};

_pos = getPos player;
_veh = _vehicles select 0;
_capacity = getNumber(configFile >> "CfgVehicles" >> (typeOf cursorTarget) >> "fuelCapacity");
if(_capacity == 0) then {_capacity = 60};
_price = _price * _capacity;

if(life_dabliquide < _price) exitWith {hint "Vous n'avez pas assez d'argent";};

if (life_action_inUse) exitWith {hint "Tu est déjà occupé, termine d'abord ce que tu as commencé!";};

_answer = [
format["<t color='#8cff9b'>Etes vous sur de vouloir faire le plein pour %1€ ?</t>", _price],
"Station essence",
"Oui",
"Non"
] call BIS_fnc_guiMessage;
if (!_answer) exitWith {hint "Action annulée.";};

life_action_inUse = true;

_title = "Remplissage du réservoir en cours...";
_duration = 15;
_handle = [_duration,_title] spawn life_fnc_progressBar;
waitUntil {scriptDone _handle};

if(!alive player) exitWith {};
if(player != vehicle player) exitWith {life_action_inUse = false; hint "Action annulé"};
if(life_interrupted) exitWith {life_interrupted = false; life_action_inUse = false; hint "Action annulé"};
if(!life_action_inUse) exitWith {life_action_inUse = false; hint "Action annulé"};

hint format["Prix du baril actuellement : %1€",_oilPrice];
if((vehicle player != player) || (_pos distance getPos player > 10)) exitWith {hint format["Vous avez laché le pistolet, %1€ d'essence s'est déversé sur le sol...",_price]; life_dabliquide = life_dabliquide - _price;};

life_dabliquide = life_dabliquide - _price;
_veh setFuel 1;
hint format["Réservoir du véhicule rempli pour un total de %1€, merci et a bientôt !",_price];