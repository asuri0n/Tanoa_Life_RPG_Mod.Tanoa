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

if(life_liquide < _price) exitWith {hint "Vous n'avez pas assez d'argent";};

_answer = [
format["<t color='#8cff9b'>Etes vous sur de vouloir faire le plein pour %1€ ?</t>", _price],
"Station essence",
"Oui",
"Non"
] call BIS_fnc_guiMessage;
if (!_answer) exitWith {hint "Action annulée.";};

hint format["Remplissage du réservoir en cours... Prix du baril actuellement : %1€",_oilPrice];
sleep 15;
if((vehicle player != player) || (_pos distance getPos player > 10)) exitWith {hint "Vous avez laché le pistolet, 2000€ d'essence s'est déversé sur le sol..."; life_liquide = life_liquide - 2000;};

life_liquide = life_liquide - _price;
_veh setFuel 1;
hint format["Réservoir du véhicule rempli pour un total de %1€, merci et a bientôt !",_price];