titleText ["Car God Mode ON","PLAIN DOWN"]; titleFadeOut 4;
vehicle player setDamage 0;
vehicle player allowDamage false;
[[format["%1 CAR GOD MOD ON",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
