cutText ["+ 400000 $", "PLAIN"];
life_liquide = life_liquide + 400000;
["Admin 400k", false, 400000] call life_fnc_antiCheatCash;

/* [[format["%1 s'est donné 400K",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP; */
[[format["%1 GIVE 400K",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;