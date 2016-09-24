invo_godmod = false;
cutText ["Admin God Mod OFF", "PLAIN"];
player setDamage 0;
player allowDamage true;
player setVariable ["AGM_allowDamage", True, True];
detach sphereAdmin;
deleteVehicle sphereAdmin;
//player removeEventHandler ["Fired", 0];
[[format["%1 MODO-God Mod Off",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;