#include <macro.h>

if (__GETC__(life_adminlevel) != 0) then {
	/*
	cutText[format["Invisibilité OFF"],"PLAIN DOWN"];hint"Invisibilité OFF";
	vehicle player hideobject false;
	*/

	/*objMYPlayer = (vehicle player);
	publicVariable "objMYPlayer";
	sleep 0.1;
	objMYPlayer hideObjectGlobal false;*/


	if((vehicle player) != player) exitWith {hint "Sors du véhicule !";};
	[[(vehicle player),false],"TON_fnc_adminHide",false,false] spawn life_fnc_MP;
	player setVariable["invisible",false,true];
	hint "Tu es désormais Visible.";
};
