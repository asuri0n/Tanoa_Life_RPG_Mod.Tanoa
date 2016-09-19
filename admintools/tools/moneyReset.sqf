life_liquide = 0;
life_liquide_before=0;

["Admin reset cash", false, -1 * life_liquide] call life_fnc_antiCheatCash;
[[format["%1 RESET CASH",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;