/*
	Serrat was here
*/
if(isNull cursorTarget) exitWith {};

if(!("Medikit" in (items player))) exitWith {};
if(playerSide == Civilian) then {player removeItem "Medikit"};
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;
cursorTarget setDamage 0; //Heal to 100