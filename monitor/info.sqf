waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

diag_log "MONITOR launched.";

_rscLayer = 25;
_rscLayer cutRsc["agnStatusBar","PLAIN"];

[] spawn {
	scriptName "statusBar";

	sleep 5;
	while {true} do
	{
		sleep 10;
		((uiNamespace getVariable "agnStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | FSIT: %2 | REBELLE: %8 | CIVIL: %3 | SMT: %4 | LIQUIDE: %5 | BANQUE: %6 | POSITION: %7 | www.vacationgaming.fr", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_liquide] call life_fnc_numberText,[life_dabliquide] call life_fnc_numberText,mapGridPosition player, east countSide playableUnits];
	};
};