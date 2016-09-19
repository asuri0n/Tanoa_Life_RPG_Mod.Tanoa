/*

	[PRICE-ROW] marketGetModifiers [SHORTNAME];

*/

private["_ret","_shortname"];

_shortname = _this select 0;
_ret = [0,0,0,0];
/* old code
{
	if((_x select 0) == _shortname) exitWith
	{
		_ret = _x;
	};
}
foreach life_market_prices;
*/
//Komodo: préparation nouveau système marché

{
	if((_x select 1) == _shortname) exitWith
	{
		_ret = [_shortname, _x select 3, _x select 9, _x select 10];
	};
}
foreach life_market_prices_v2;

_ret;