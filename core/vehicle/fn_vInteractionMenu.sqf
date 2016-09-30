#include <macro.h>
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
life_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

//enable to pull out people form vehicle for civilian
_Btn2 ctrlSetText localize "STR_vInAct_PullOut";
if((playerSide == west) || (playerSide == independent) || ((playerSide == civilian) && (license_civ_bounty_hunter) && (!(license_civ_rebel))) || (__GETC__(life_adminlevel) != 0)) then {
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
}
else
{
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_CivpulloutAction;";
};

if("ToolKit" in (items player)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if(playerSide == west) then {

	_Btn6 ctrlShow false;//insurance buton	_Btn6 ctrlShow true;//insurance buton
	_Btn6 ctrlSetText localize "STR_vInAct_Insure";

	if(!(life_vInact_curTarget getVariable["insured",false]) && ([(getPlayerUID player),(cursorTarget getVariable["vehicle_info_owners", []])] call life_fnc_index) != -1) then {
			_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInsure;";
			_Btn6 ctrlEnable true;
	};
	_Btn7 ctrlShow false;//device mine
	_Btn8 ctrlShow false;//Zamak Labo Process
	_Btn9 ctrlShow false;//unflip

	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";

	_Btn4 ctrlSetText localize "STR_vInAct_Registration";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	//if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

	_Btn5 ctrlSetText localize "STR_vInAct_Impound";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
} else {
	_Btn3 ctrlShow false;

	_Btn6 ctrlShow true;//insurance buton
	_Btn6 ctrlSetText localize "STR_vInAct_Insure";

	if(!(life_vInact_curTarget getVariable["insured",false]) && ([(getPlayerUID player),(cursorTarget getVariable["vehicle_info_owners", []])] call life_fnc_index) != -1) then {
		_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInsure;";
		_Btn6 ctrlEnable true;
	} else {
		_Btn6 ctrlEnable false;
	};

	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn7 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_Btn7 ctrlEnable false;
		} else {
			_Btn7 ctrlEnable true;
		};
	} else {
		_Btn7 ctrlShow false;
	};

	//Zamak Labo
	if(typeOf _curTarget == "O_Truck_02_Ammo_F") then {
		_Btn8 ctrlSetText "Process";
		_Btn8 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehProcessIllegal";
		_Btn8 ctrlEnable true;
	} else {
		_Btn8 ctrlShow false;
	};

	if((__GETC__(life_adminlevel) == 0) && (__GETC__(life_medicLevel) == 0)) then {
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
	}else {
		_Btn4 ctrlSetText localize "STR_vInAct_Registration";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

		_Btn5 ctrlSetText localize "STR_vInAct_Impound";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	};

	_Btn9 ctrlEnable false;
	if(_curTarget isKindOf "Ship") then {
		_Btn9 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn9 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn9 ctrlEnable true;} else {_Btn9 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","cl3_xr_1000_yellow","cl3_xr_1000_black"]) then {
			_Btn9 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn9 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn9 ctrlEnable true;} else {_Btn9 ctrlEnable false};
		};
		if(_curTarget isKindOf "LandVehicle") then {
			_Btn9 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn9 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then {
				_Btn9 ctrlEnable false;
			} else {
				_Btn9 ctrlEnable true;
			};
		};
	};
};