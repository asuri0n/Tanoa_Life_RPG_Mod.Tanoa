/*
	File: fn_vehHandleTrunk.sqf
	Author: Komodo
	Description:
	Function that handles add/remove of item to a trunk.
	This function MUST be used after checking if add/remove is feasible with vehCanHandleTrunk.
*/

private["_math","_item","_num","_return","_indexItem","_itemWeight","_vehTrunkContent","_veh_data","_mWeight","_totalWeight","_numInTrunk","_veh"];
_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = subtract;
_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.
_veh = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_return = false;

//diag_log "vehCanHandleTrunk launched";

if(_item == "" OR _num < 1 OR isNull _veh OR !alive _veh) exitWith {false};
if (!(_veh getVariable ["trunk_in_use",false])) exitWith {false};
if (_veh getVariable["trunk_in_use_by",""] != (getPlayerUID player)) exitWith {hint "Quelqu'un d'autre utilise déjà cet inventaire."; false;};

_vehTrunkContent = (_veh getVariable "Trunk") select 0;
_indexItem = [_item,((_veh getVariable "Trunk") select 0)] call life_fnc_index;
_itemWeight = ([_item] call life_fnc_itemWeight) * _num;
_numInTrunk = 0;
if (_indexItem > -1) then {_numInTrunk = _vehTrunkContent select _indexItem select 1;};
_veh_data = _veh getVariable ["Trunk",[[],0]];

//Computing total available weight
if(_veh isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_veh getVariable["containers",[]]);
	_totalWeight = [_mWeight,(_veh getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [_veh] call life_fnc_vehicleWeight;
};

//Performing add or remove.
if (_math) then {
	/* ADD case */
	if(_indexItem == -1) then {
		_vehTrunkContent pushBack [_item,_num];
	}
		else {
		_vehTrunkContent set[_indexItem,[_item,_numInTrunk + _num]];
	};
	_veh setVariable["Trunk",[_vehTrunkContent,(_veh_data select 1) + _itemWeight],true];
}
else {
	/* SUBSTRACT case */
	if(_num == _numInTrunk) then {
		_vehTrunkContent deleteAt _indexItem;
	}
		else {
		_vehTrunkContent set[_indexItem,[_item,(_numInTrunk - _num)]];
	};
	_veh setVariable["Trunk",[_vehTrunkContent,(_veh_data select 1) - _itemWeight],true];
};