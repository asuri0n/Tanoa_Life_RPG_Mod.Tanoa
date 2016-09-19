/*
	File: fn_vehCanHandleTrunk.sqf
	Author: Komodo
	Description:
	Function that returns true if given amount of given type of resource can be added to the vehicle/House trunk.
	Should be a safe function as it checks many details. Other checks can further be easilly added.
*/

private["_math","_item","_num","_return","_indexItem","_itemWeight","_vehTrunkContent","_mWeight","_totalWeight","_numInTrunk","_veh"];
_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = subtract;
_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.
_veh = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_return = false;

if(_item == "" OR _num < 1 OR isNull _veh OR !alive _veh) exitWith {false};
if (!(_veh getVariable ["trunk_in_use",false])) exitWith {false};
if (_veh getVariable["trunk_in_use_by",""] != (getPlayerUID player)) exitWith {hint "Quelqu'un d'autre utilise déjà cet inventaire."; false;};

_vehTrunkContent = (_veh getVariable "Trunk") select 0;
_indexItem = [_item,((_veh getVariable "Trunk") select 0)] call life_fnc_index;
_itemWeight = ([_item] call life_fnc_itemWeight) * _num;
_numInTrunk = 0;
if (_indexItem > -1) then {_numInTrunk = _vehTrunkContent select _indexItem select 1;};

//Computing total available weight
if(_veh isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_veh getVariable["containers",[]]);
	_totalWeight = [_mWeight,(_veh getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [_veh] call life_fnc_vehicleWeight;
};

if (_totalWeight select 1 < 0) exitWith
{
	hint "Véhicule bugué, remise à 0 de l'inventaire.";
	false;
};

//Returning if this vehicle's trunk can store or give the amount of selected item.
if (_math) then {
	/* Case ADD to Trunk */
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) then {
		_return = false;
	}
	else {
		//Introducing the concept of liquid item. Certain vehicules only can contain liquids.
		if ([_item] call life_fnc_itemIsLiquid) then {
			_return = true;
		}
		else {
			/* If item is not a liquid, then we check if the target vehicle is a type of Tank. */
			if ([(typeOf _veh)] call life_fnc_vehIsTank) then {
				_return = false;
			}
			else {
				_return = true;
			};
		};
	};
}
else {
	/* Case REMOVE from trunk, checking if there's enough items. */
	if ((_indexItem == -1) OR _num > _numInTrunk) then {
		_return = false;
	}
	else {
		_return = true;
	};
};

_return;