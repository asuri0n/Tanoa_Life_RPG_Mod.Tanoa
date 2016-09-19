#include <macro.h>
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_buyButton","_shop_data","_name","_price","_marketprice","_i","_icon"];
disableSerialization;

//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;
_buyButton = _display displayCtrl 2408;

//Purge list
lbClear _item_list;
lbClear _gear_list;

_shop_data = [life_shop_type] call life_fnc_virt_shops;
ctrlSetText[2403,format["%1", _shop_data select 0]];

{
	_name = [([_x,0] call life_fnc_varHandle)] call life_fnc_vartostr;
	_icon = [([_x,0] call life_fnc_varHandle)] call life_fnc_itemIcon;
	_index = [_x,__GETC__(buy_array)] call life_fnc_index;

	//added by Kriss - if commercial item lock buy from the shop to prevent usebug
	/*for "_j" from 0 to ((count list_commercial_items)-1) do
	{
		//searching the index of the player
		if( _x == (list_commercial_items select _j)) then
		{
			_buyButton ctrlEnable false;
		};
	};*/

	if(_index != -1) then
	{
		_price = (__GETC__(buy_array) select _index) select 1;
		////change le prix en fonction des achats////
		_marketprice = [_x] call life_fnc_marketGetBuyPrice;
		if(_marketprice != -1) then
		{
			_price = _marketprice;
		};
		////Fin market////
		_item_list lbAdd format["%1  ($%2)",_name,[_price] call life_fnc_numberText];
		_item_list lbSetData [(lbSize _item_list)-1,_x];
		_item_list lbSetValue [(lbSize _item_list)-1,_price];
		_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
	};

} foreach (_shop_data select 1);

_i = 0;
{
	_var = [_x,0] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _var;
	_name = [_var] call life_fnc_vartostr;
	_icon = [_var] call life_fnc_itemIcon;

	if(_val > 0) then
	{
		_gear_list lbAdd format["%1x %2",_val,_name];
		_gear_list lbSetData [(lbSize _gear_list)-1,_x];
		_gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
		lbSetCurSel [2402,_i];
		ctrlSetText [2405, format ["%1", _val]];
		_i = _i + 1;
	};
} foreach (_shop_data select 1);

//On appelle l'interface du marché comme ca c'est tout beau
[_shop_data select 1] spawn life_fnc_marketShortView;