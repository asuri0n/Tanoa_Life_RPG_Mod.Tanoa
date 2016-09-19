/*
	Will be revised later
*/
//if((damage player) < 0.25) exitWith {};
if(!("Medikit" in (items player))) exitWith {};
player removeItem "Medikit";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;
player setDamage 0; //Heal to 100