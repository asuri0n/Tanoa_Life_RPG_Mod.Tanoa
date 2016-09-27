#include <macro.h>
_uidList = ["123456789","987654321"];
waitUntil {!isNull player};

_uid = getPlayerUID player;

if (__GETC__(life_adminlevel) != 0) then {
	player addAction ["<t color='#0074E8'>Tools Menu</t>","admintools\tools.sqf","",1,false,true,"","player == player"];
};
