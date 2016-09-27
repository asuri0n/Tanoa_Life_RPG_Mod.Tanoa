#include <macro.h>
if (license_civ_papiers) then {


	[[0,getPlayerUID player],"fnc_update",false ,false] spawn BIS_fnc_MP;
	// [[0],"fnc_update",false ,false] spawn BIS_fnc_MP;
	//__CONST__(life_serveur,0);
	[] call SOCK_fnc_syncData;
	["papiers",FALSE,TRUE] call BIS_fnc_endMission;


}else{

	hintC "Tu ne possedes pas de papiers d'identités. Les autoritées refuse ton passage";
	[] call SOCK_fnc_syncData;

};