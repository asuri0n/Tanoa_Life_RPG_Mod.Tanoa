//_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if((player getVariable ["FAR_isUnconscious", 1] == 0) && (isNull _unit)) ExitWith {[[[cursorTarget], "admintools\tools\Rez.sqf"],"BIS_fnc_execVM",cursorTarget,true] spawn life_fnc_MP;};//send execution of script to the target
player setVariable ["FAR_isDragged", 0, true];
player setVariable ["FAR_isStabilized", 0, true];
life_is_arrested = false;
// Clear the "medic nearby" hint
hintSilent "";
player enableSimulation true;
player allowDamage true;
player setCaptive false;
life_is_arrested = false;
player playMove "amovppnemstpsraswrfldnon";
player playMove "";

//Komodo: nécessaire pour @AGM
player setDamage 0;
//player setVariable ["AGM_Blood", 1, True];
//player setVariable ["AGM_isBleeding", False, True];
//player setVariable ["AGM_Painkiller", 1, True];
//player setVariable ["AGM_Pain", 0, True];
//player setVariable ["AGM_isUnconscious", False, True];
//[player] call AGM_Medical_fnc_wakeUp;