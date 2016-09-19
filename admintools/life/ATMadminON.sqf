player removeAction ATMadmintools;
ATMadmintools = player addAction["<t color='#ADFF2F'>ATM</t>",life_fnc_atmMenu];

//Test for Market log systems
diag_log format["MARKET LOG: %1",life_market_log];
hint format ["Nombre de groupes: %1", count AllGroups];

/*
// Komodo: pour tester le nouveau système de marché!
private ["_line"];
{
	if((_x select 1) == "oilp") exitWith
	{
		_line = life_market_prices_v2 select _forEachIndex;
		_line set [3, 1234]; //Modification de la valeur de la ressource
		_line set [8, true]; //Passage de la varialbe update à true pour demander au serveur de mettre à jour ce prix.

		life_market_prices_v2 set [_forEachIndex, _line];
	};
} foreach life_market_prices_v2;
publicVariable "life_market_prices_v2";
*/