/*
	File: fn_delStuff.sqf
	Author: Bloopis
	Date : 05/02/2014
	
	Description:
	Create and displays HCI for stuff restriction

	Parameter(s) :
		0: OBJECT - Target

	Returns:
		NULL
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3"];
createDialog "restric_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 41000;
_Btn1 = _display displayCtrl 41002;
_Btn2 = _display displayCtrl 41003;
_Btn3 = _display displayCtrl 41004;
life_pInact_curTarget = _curTarget;

//delete weapon
_Btn1 ctrlSetText localize "STR_pInAct_RestricWp";
_Btn1 buttonSetAction "[[],""life_fnc_seizePlayerWeaponAction"",life_pInact_curTarget,FALSE] spawn life_fnc_MP";

//delete clothes
_Btn2 ctrlSetText localize "STR_pInAct_RestricCL";
_Btn2 buttonSetAction "[[],""life_fnc_seizePlayerStuffAction"",life_pInact_curTarget,FALSE] spawn life_fnc_MP";

//delete license
_Btn3 ctrlSetText localize "STR_pInAct_RestricLicen";
//_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_delLicenses;";
_Btn3 buttonSetAction "[[player],""life_fnc_getLicensesAction"",life_pInact_curTarget,FALSE] spawn life_fnc_MP";