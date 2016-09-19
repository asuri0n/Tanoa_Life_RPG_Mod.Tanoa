/*
	Filename: fn_gatherArcheologie.sqf

*/

//	Traduction : Skydred
private["_sum"];

_sum = ["organ",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Découpage du défunt ...","PLAIN"];
	sleep 5;
	if(([true,"organ",_sum] call life_fnc_handleInv)) then
	{

		titleText[format["Tu as volé un organe !!"],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};
life_action_in_use = false;