/*
	@Version: 2.3
	@Author: [BWG] Joe
	@Edited: 14.11.2013
	Traduction : Skydred
*/
if((player getVariable "restrained")||(player getVariable "Escorting")) exitWith {};
private ["_pos"];

player setVariable ["playerSurrender", true, true];
// [[0,format["%1 se rend sans résistance", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
while { player getVariable ["playerSurrender", false] }  do {
	player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";

	// Check if player still alive.
	if (!alive player) then {
		player setVariable ["playerSurrender", false, true];
	};
};
// [[0,format["%1 reprend une attitude normale", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
