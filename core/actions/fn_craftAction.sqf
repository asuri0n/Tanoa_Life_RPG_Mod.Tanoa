/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem"];

disableSerialization;

_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;

_matsNeed = 0;

if(!(player canAdd _item)) exitWith {hint localize "STR_NOTF_NoRoom";};

_config = ["weapon"] call life_fnc_craftCfg;
{

	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

			_str = [_matsNeed select _i] call life_fnc_varToStr;
			_matsNum = _matsNeed select _i+1;

			if((missionNamespace getVariable (_matsNeed select _i)) < _matsNum) exitWith {_allMaterial = false;};

		};
	};
} foreach (_config select 1);

if(!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial";};

//Error checking
if((count _matsNeed) == 0) exitWith {};




//Setup vars.
_oldItem = _matsNeed;
_newItem = _item;

_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
_itemName = _itemInfo select 1;

_upp = format["Crafting %1",_itemName];




//Some more checks
if((count _oldItem) == 0) exitWith {};

closeDialog 0;

//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {

	_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
	if(!([false,_handledItem,_oldItem select _i+1] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
[] call life_fnc_p_updateMenu;

life_is_processing = true;

while{true} do
{
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
};

_invSize = count _oldItem;

if(!(player addItem _item)) exitWith {
	5 cutText ["","PLAIN"];

	for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
		_handledItem = [_oldItem select _i,1] call life_fnc_varHandle;
		[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
	};
	life_is_processing = false;
};
5 cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
life_is_processing = false;