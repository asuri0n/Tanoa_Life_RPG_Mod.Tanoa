//[cursorTarget] spawn FAR_HandleRevive;

//Komodo: nécessaire pour @AGM
cursorTarget setDamage 0;
//cursorTarget setVariable ["AGM_Blood", 1, True];
//cursorTarget setVariable ["AGM_isBleeding", False, True];
//cursorTarget setVariable ["AGM_Painkiller", 1, True];
//cursorTarget setVariable ["AGM_Pain", 0, True];
//cursorTarget setVariable ["AGM_isUnconscious", False, True];
//[cursorTarget] call AGM_Medical_fnc_wakeUp;



[[format["%1 a revive une personne avec la commande EMT ",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;