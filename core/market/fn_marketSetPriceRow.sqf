/*

	[] fnc [SHORTNAME, [PRICEROW], (send?)];

*/

private["_shortname","_price","_send","_line"];

_shortname = _this select 0;
_price = _this select 1;
_send = [_this,2,true] call BIS_fnc_param;

{
	if((_x select 0) == _shortname) exitWith
	{
		life_market_prices set [_forEachIndex, _price];
	};
}
foreach life_market_prices;

//Komodo: nouveau système de marché: MAJ des prix
{
	if ((_x select 1) == _shortname) exitWith
	{
		_line = life_market_prices_v2 select _forEachIndex;
		_line set [3, _price select 1]; //Modification de la valeur de la ressource
		_line set [8, true]; //Passage de la varialbe update à true pour demander au serveur de mettre à jour ce prix.
		life_market_prices_v2 set [_forEachIndex, _line];
	}
} foreach life_market_prices_v2;

if(_send) then {publicVariable "life_market_prices";};
if(_send) then {publicVariable "life_market_prices_v2";};