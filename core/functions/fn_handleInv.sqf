/*
	File: fn_handleInv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Do I really need one?
*/
private["_math","_item","_num","_return","_var","_weight","_value","_diff","_totalWeight","_shotName"];
_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = subtract;
_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.
if(_item == "" OR _num == 0) exitWith {false};

//Komodo: let's detect these fucking cheaters and punish them.
_totalWeight = 0;
{
	_value = missionNamespace getVariable _x;
	_shotName = [_x,1] call life_fnc_varHandle;
	if (_shotName != "") then
	{
		_totalWeight = _totalWeight + (([_shotName] call life_fnc_itemWeight) * _value);
	};
} count life_inv_items;
if (_totalWeight > 94) exitWith
{
	[[format["CHEAT_INVENTAIRE par %1. A ban perm, forcement par injection de code.", name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
	[[0,format["%1 AVEC UID %2 VIENT D'ESSAYER D'UTILISER UN CHEAT ! MERCI DE LE DIRE AUX ADMINS ET DE PRENDRE UN SCREEN !", name player,getPlayerUID player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	{
		missionNamespace setVariable [_x, 0];
	} count life_inv_items;
	[player] spawn life_fnc_jail;
	false;
};

_var = [_item,0] call life_fnc_varHandle;
if(_math) then
{
	_diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
_weight = ([_item] call life_fnc_itemWeight) * _num;
_value = missionNamespace getVariable _var;

	diag_log format["_item %3; _var %2 ; _value %1 ",_value,_var,_item];
	
if(_math) then
{
	//Lets add!
	if((life_carryWeight + _weight) <= life_maxWeight) then
	{
		missionNamespace setVariable[_var,(_value + _num)];

		if((missionNamespace getVariable _var) > _value) then
		{
			life_carryWeight = life_carryWeight + _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	}
		else
	{
		_return = false;
	};
}
	else
{
	//Lets subtract!
	if((_value - _num) < 0) then
	{
		_return = false;
	}
		else
	{
		missionNamespace setVariable[_var,(_value - _num)];

		if((missionNamespace getVariable _var) < _value) then
		{
			life_carryWeight = life_carryWeight - _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	};
};

_return;