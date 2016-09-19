/*

	[MARKET-ROW] marketGetModifiers [SHORTNAME];

*/

private["_ret","_shortname"];

_shortname = _this select 0;
_ret = [];
/*
{
	if((_x select 0) == _shortname) exitWith
	{
		_ret = _x;
	};
}
foreach life_market_resources;
*/
/* Komodo: preparation nouveau système marché */
{
	if ((_x select 1) == _shortname) exitWith
	{
		// Shortname, Price, Min, Max, Coef, Coef
		_ret = [_shortname, _x select 2, _x select 5, _x select 6, (_x select 4) / 100, (_x select 4) / 100, []];
	};
} foreach life_market_prices_v2;

_ret;