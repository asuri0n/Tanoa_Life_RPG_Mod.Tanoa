#include <macro.h>
waituntil {!alive player ; !isnull (finddisplay 46)};


if (__GETC__(life_adminlevel) != 0) then {
act = player addaction [("<t color=""#0074E8"">" + ("Modo Menu") +"</t>"),"admintools\tools.sqf","",5,false,true,"",""];
};
/*if ((getPlayerUID player) in ["76561198016156017"]) then {
act = player addaction [("<t color=""#6666CC"">" + ("Menu Event") +"</t>"),"admintools\eventools.sqf","",5,false,true,"",""];
};*/