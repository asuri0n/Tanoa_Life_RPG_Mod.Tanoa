#include <macro.h>
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type"];

if (vehicle player != player) exitWith {hint "Ce n'est pas un Drive, descends de ton véhicule!";};

if(!life_use_atm) exitWith
{
	hint "Tu viens de braquer la banque, tu ne peux pas utiliser le DAB.";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[life_dabliquide] call life_fnc_numberText,[life_liquide] call life_fnc_numberText];

{
	if(alive _x) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

//tri alpha
lbSort [_units, "ASC"];

lbSetCurSel [2703,0];


/*
	File: fn_bankLoad.sqf
	Author: S.Lambert

	Description:
	incorporated into atm manament
*/

if (!isnil {(group player) getVariable "gang_name"}) then {
	_rank = player getVariable["gang_rank",-10];
	if ((_rank < 2) && (getPlayerUID player != (group player) getVariable "gang_owner")) then
	{
		(getControl(2700,2706)) ctrlEnable false; //WithDraw
	};
}
else
{
	(getControl(2700,2705)) ctrlEnable false;  //deposit
	(getControl(2700,2706)) ctrlEnable false; //WithDraw
};

/*
if (isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
	if (grpPlayer getVariable "gang_owner" != steamid) Then {
		(getControl(2700,2706)) ctrlEnable false;
	};
};
*/

//["DAB"] spawn life_fnc_spotShop;
