#include <macro.h>

if (__GETC__(life_adminlevel) != 0) then {
	_l5=getDir player;
	_target=cursorTarget;
	_target setPosATL[(getPosATL player select 0)+10*sin(_l5),(getPosATL player select 1)+10*cos(_l5),getPosATL player select 2];
	cutText[format["%1 Téléporté",_target],"PLAIN"];
};