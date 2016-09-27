if(cursorTarget!=player) then
{
	cursorTarget setDamage 0;
	cutText[format["%1 Réparé",cursorTarget],"PLAIN"];
	[[format["%1 MODO-REPAIR IT",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
};