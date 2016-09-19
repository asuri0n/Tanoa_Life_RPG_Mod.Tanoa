/*
	Filename: fn_openMarketView.sqf
	Open pack-up dlg

*/
private ["_index"];

if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

waitUntil {!isnull (findDisplay 39500)};

lbClear 1500;

//Recreate listbox items
{
	_index = lbAdd [1500, format ["%1 - $%2", [[_x select 1, 0] call life_fnc_varHandle] call life_fnc_varToStr, _x select 3]];
	lbSetData [1500, _index, _x select 1];
}
foreach life_market_prices_v2;

//Refresh
[] call life_fnc_refreshMarketView;