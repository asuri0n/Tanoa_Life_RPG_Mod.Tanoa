/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4"];
if(!dialog) then {
	createDialog "cInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

if(((playerSide == civilian) AND (license_civ_bounty_hunter)) AND (!(([_curTarget] call INVO_fnc_wantedPerson) isEqualTo []))) then
{
	_Btn4 ctrlSetText localize "STR_pInAct_Arrest";
	_Btn4 buttonSetAction "[life_pInact_curTarget,30] call life_fnc_arrestAction; closeDialog 0;";
};

//we enable escort button only if some condition are false ..
if((player getVariable["civrestrained",false]) OR (player getVariable["restrained",false]) OR (life_pInact_curTarget getVariable["restrained",false])) then{
    //we disable button !
    _Btn1 ctrlEnable false;
    _Btn2 ctrlEnable false;
    _Btn3 ctrlEnable false;
};
//si pas près d'un zone, on ne peux pas mettre en prison !
if(!((player distance (getMarkerPos "cop_spawn_6") < 30))) then
{
	_Btn4 ctrlEnable false;
};