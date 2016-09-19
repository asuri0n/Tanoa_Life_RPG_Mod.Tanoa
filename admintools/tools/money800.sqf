cutText ["+ 800000 $", "PLAIN"];
life_liquide = life_liquide + 800000;
["Admin 800k", false, 800000] call life_fnc_antiCheatCash;

/* [[format["%1 s'est donné 800K",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP; */
[[format["%1 GIVE 800K",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;