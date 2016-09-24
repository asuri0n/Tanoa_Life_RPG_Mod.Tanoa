invo_godmod = true;
cutText ["Admin God Mod ON", "PLAIN"];
player setDamage 0;
player setVariable ["AGM_Blood", 1, True];
player setVariable ["AGM_isBleeding", False, True];
player setVariable ["AGM_Painkiller", 1, True];
player setVariable ["AGM_Pain", 0, True];
player setVariable ["AGM_isUnconscious", False, True];
player setVariable ["AGM_allowDamage", False, True];
player allowDamage false;
[[format["%1 MODO-God Mod On",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
//player addEventHandler ["Fired", { (_this select 0) setVehicleAmmo 1 }];

if (!isNil "sphereAdmin") then
{
	deleteVehicle sphereAdmin;
};
sphereAdmin = "Sign_Sphere10cm_F" createVehicle (getPos player);
sphereAdmin attachto [player, [0,-0.08,0.5],"head"];

sphereAdmin setObjectTextureGlobal [0,"#(argb,1,8,3)color(0,0,1,0.5)"];

waitUntil { not alive player };
deleteVehicle sphereAdmin;