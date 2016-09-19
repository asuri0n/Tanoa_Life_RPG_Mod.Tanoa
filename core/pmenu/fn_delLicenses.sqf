/*
	File: fn_delLicenses.sqf
	Author: Bloopis
	Date : 05/02/2014
	
	Description:
	Create and displays HCI for licenses restriction

	Parameter(s) :
		0: OBJECT - Target

	Returns:
		NULL
*/
private["_display","_curTarget","_list","_Btn1","_licenses"];
createDialog "restric_licenses_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_licenses = [_this,1,[],[[]]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 42000;
_list = _display displayCtrl 42001;
_Btn1 = _display displayCtrl 42002;
lbClear _list;
life_pInact_curTarget = _curTarget;
{
	    _list lbAdd ((_x select 0));//we add crimes names
	    _list lbSetData [(lbSize _list)-1,(_x select 1)];//we add crimes values
} forEach _licenses;

_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_delLicense;closeDialog 0;";