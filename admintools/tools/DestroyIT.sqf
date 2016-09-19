if(cursorTarget!=player) then
{
	cursorTarget setDamage 1;
	cutText[format["%1 DETRUIT",cursorTarget],"PLAIN"];
};