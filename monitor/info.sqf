waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

diag_log "MONITOR launched.";

//_rscLayer = "agnStatusBar" call BIS_fnc_rscLayer;
_rscLayer = 25;
_rscLayer cutRsc["agnStatusBar","PLAIN"];

[] spawn {
	sleep 5;
	_statusText = "Serveur Vacation Gaming";
	_counter = 180;
	while {true} do
	{
		sleep 10;
		((uiNamespace getVariable "agnStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | GENDARME: %2 | CIVIL: %3 | EMT: %4 | LIQUIDE: %5 | BANQUE: %6 | POSITION: %7 | www.vacationgaming.fr | ts.vacationgaming.com", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_liquide] call life_fnc_numberText,[life_dabliquide] call life_fnc_numberText,mapGridPosition player, _counter];
	};
};