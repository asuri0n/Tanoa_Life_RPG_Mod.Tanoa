/*
	Filename: fn_gatherArcheologie.sqf

*/

//	Traduction : Skydred
private["_sum"];

if (!license_civ_archeologie) exitWith {hint "Impossible de récupérer des échantillons d'archéologique sans licence!";};

_sum = ["archeologieillegale",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Prise d'echantillons en cours...","PLAIN"];
	sleep 2;
	if(([true,"archeologieillegale",_sum] call life_fnc_handleInv)) then
	{

		titleText[format["Tu as ramassé un échantillon archéologique"],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};
life_action_in_use = false;