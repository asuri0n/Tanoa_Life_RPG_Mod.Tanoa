/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
	
	
	
	
	
	
	
	
	NOT USE !!! Check farmingtooluse
*/
closeDialog 0;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["uran_1","apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1"];
_zone = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_gather = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
	case (_zone in ["uran_1"]): {_gather = "uranium1"; _val = 2;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_mineVeh";};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_gather = true;

//XP SYSTEM 
_profName = [_gather] call life_fnc_profType;
if( _profName != "" ) then 
{	
	_data = missionNamespace getVariable (_profName);
	_profExp = _data select 1; 
	_level = [_profExp] call life_fnc_getLevelXp;
    _addExpAmount = _addExpAmount + round(2.5 * (_data select 0));
};
//--XP SYSTEM
		
player action ["SwitchWeapon", player, player, 100];  // késako ?
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
}; 
	
if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
	//XP SYSTEM 
	if( _profName != "" ) then 
	{
		[_profName,_addExpAmount] call life_fnc_addExp;
	};
	//--XP SYSTEM
}; 
life_action_gather = false;