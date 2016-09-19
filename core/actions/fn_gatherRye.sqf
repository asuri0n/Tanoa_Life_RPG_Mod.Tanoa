private["_sum"];
_sum = ["rye",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_sum > 0) then{
	life_action_gather = true;
        titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Rye"],"PLAIN"];
	titleFadeOut 5;
	sleep 5;
        if(([true,"rye",1] call life_fnc_handleInv)) then{titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Rye"],"PLAIN"];
	};
}
	else {
hint localize "STR_NOTF_InvFull";
};
life_action_gather = false;