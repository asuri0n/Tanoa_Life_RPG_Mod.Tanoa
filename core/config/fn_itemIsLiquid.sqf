/*
	FileName: fn_itemIsLiquid.sqf
	Author: Komodo

	Description:
	Returns true if an item is a liquid
*/
private ["_item"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {false};

switch (_item) do {
    case "oilu": {true};
    case "oilp": {true};
    case "turtlesoup": {true};
    case "coffee": {true};
    case "fuelE": {true};
    case "fuelF": {true};
    case "whiskey": {true};
    case "beerp": {true};
    case "moonshine": {true};
    case "grapes": {true};
    case "grapejuice": {true};
    case "wine": {true};
    case "applecompote": {true};
    case "peachcompote": {true};

    default {false};
};