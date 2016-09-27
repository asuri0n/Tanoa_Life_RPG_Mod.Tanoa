#include <macro.h>

if (__GETC__(life_adminlevel) != 0) then {
	/*
	cutText[format["Invisibilité ON"],"PLAIN DOWN"];hint"Invisibilité ON";
	vehicle player hideobject true;
	*/

	/*objMYPlayer = (vehicle player);
	publicVariable "objMYPlayer";
	sleep 0.1;
	objMYPlayer hideObjectGlobal true;*/


	if((vehicle player) != player) exitWith {hint "Sort du véhicule !";};
	[[(vehicle player),true],"TON_fnc_adminHide",false,false] spawn life_fnc_MP;
	player setVariable["invisible",true,true];
	hint "Tu es désormais Invisible";
	detach sphereAdmin;
	deleteVehicle sphereAdmin;
	[[format["%1 INVISIBLE ON",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
};