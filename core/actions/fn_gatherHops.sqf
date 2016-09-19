private["_sum"];
_sum = ["hops",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_sum > 0) then{

   life_action_gather = true;
   titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Hops"],"PLAIN"];
   titleFadeOut 5;
   sleep 5;
     if(([true,"hops",1] call life_fnc_handleInv)) then {
        titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Hops"],"PLAIN"];
        };
}else{
   hint localize "STR_NOTF_InvFull";
};
life_action_gather = false;