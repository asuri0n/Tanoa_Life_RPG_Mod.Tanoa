/*
	File: fn_jailTime.sqf
	Author: Bloopis
	Date : 05/02/2014
	Traduction : Skydred
	Description:
	CREATE AND INIT JAIL MENU WINDOW

	Parameter(s) :
		OBJECT - target

	Returns:
		NULL
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4"];
createDialog "jailTime_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Cible incorrecte !"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {hint "Impossible d'effectuer cette action !"; closeDialog 0;}; //Bad side check?

_display = findDisplay 40000;
_Btn1 = _display displayCtrl 40002;
_Btn2 = _display displayCtrl 40003;
_Btn3 = _display displayCtrl 40004;
_Btn4 = _display displayCtrl 40005;
life_pInact_curTarget = _curTarget;

//10 mins to jail
_Btn1 buttonSetAction "[life_pInact_curTarget,10] call life_fnc_arrestAction; closeDialog 0;";

//20 mins to jail
_Btn2 buttonSetAction "[life_pInact_curTarget,20] call life_fnc_arrestAction; closeDialog 0;";

//30 mins to jail
_Btn3 buttonSetAction "[life_pInact_curTarget,30] call life_fnc_arrestAction; closeDialog 0;";

//1 hr to jail (troll)
_Btn4 buttonSetAction "[life_pInact_curTarget,60] call life_fnc_arrestAction; closeDialog 0;";