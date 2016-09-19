/* 
	File: fn_animMenu.sqf
	Name: Ciaran Langton
	Desc: A script I wrote a long time ago... But in a very close place...
	Please don't copy this script...
*/

_menu = _this select 0;

_anims = [
	["Pompes","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["Ninja Dance","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["Knee Bends (Fast)","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["Knee Bends (Normal)","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
	["Scared","AmovPercMstpSnonWnonDnon_Scared"],
	["Scared","AmovPercMstpSnonWnonDnon_Scared2"],
	["Masturb","CL3_anim_lunatic"],
	["Night Danse","cl3_nightclubdance"],
	["Dubstep Danse","cl3_dubstepdance"],
	["Hip Hop Danse","cl3_hiphopdance"],
	["Robot Danse","cl3_robotdance"],
	["Russe Danse","cl3_russiandance"],
	["Drunk Dance","cl3_crazydrunkdance"]
];
disableSerialization;
if(_menu) then {

	//Check to see if they can still do the action.
	if(player getVariable ["restrained",false]) exitWith {closeDialog 0;};
	if(player getVariable ["escorting",false]) exitWith {closeDialog 0;};
	if(animationState player == "incapacitated") exitWith {closeDialog 0;};
	if(life_istazed) exitWith {closeDialog 0;};
	if(life_action_inUse) exitWith {closeDialog 0;};	
	if(!alive player) exitWith {closeDialog 0;};
	
	//Get the list from the dialog.
	_animListDiag = findDisplay 13750;
	_animList = _animListDiag displayCtrl 13751;
	_id = lbCurSel (_animList);
	if(_id == -1) exitWith {};
	_arr = _anims select _id;
	player playMoveNow (_arr select 1);
	closeDialog 0;
} else {
	if(dialog) exitWith {}; //Fix dialog
	createDialog "animMenu";

	//Before opening check if they can.
	if(player getVariable ["restrained",false]) exitWith {closeDialog 0;};
	if(player getVariable ["escorting",false]) exitWith {closeDialog 0;};
	if(animationState player == "incapacitated") exitWith {closeDialog 0;};
	if(life_istazed) exitWith {closeDialog 0;};	
	if(life_action_inUse) exitWith {closeDialog 0;};
	if(!alive player) exitWith {closeDialog 0;};	
	_animListDiag = findDisplay 13750;
	_animList = _animListDiag displayCtrl 13751;
	//Add all the animations into the list.
	{
		_animList lbAdd format["%1",_x select 0];
	} forEach _anims;
};