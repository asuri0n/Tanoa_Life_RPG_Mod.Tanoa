/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts automated mining of resource from the tempest device.
*/
private["_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex","_useBug"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint localize "STR_NOTF_DeviceIsMining";}; //Mining is already in process..
closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..
_useBug = false;
_weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {hint localize "STR_NOTF_DeviceFull"; life_action_inUse = false;};
_resourceZones = ["or_area","argile_area","diamant_area","fer_area","souffre_area","charbon_area","uranium_area","petrole_area","foret_area_1","foret_area_2","foret_area_3","foret_area_4","lin_area","heroine_area","coke_area","cannabis_area","apple_area_1","apple_area_2","apple_area_3","apple_area_4","apple_area_5","apple_area_6","apple_area_7"];
_zone = "";

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 150) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
_item = switch(true) do {
	case (_zone in ["or_area"]): {"goldp"};
	case (_zone in ["argile_area"]): {"clayp"};
	case (_zone in ["diamant_area"]): {"diamantp"};
	case (_zone in ["fer_area"]): {"ironorep"};
	case (_zone in ["souffre_area"]): {"souffrep"};
	case (_zone in ["charbon_area"]): {"charbonp"};
	case (_zone in ["uranium_area"]): {"uraniump1"};
	case (_zone in ["petrole_area"]): {"oilpy"};
	default {""};
};

if(_item == "") exitWith {hint "Ceci n'est pas une mine."; life_action_inUse = false;};
_vehicle setVariable ["mining",true,true]; //Lock the device
[_vehicle,"life_fnc_soundDevice",true,false] spawn life_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.

life_action_inUse = false; //Unlock it since it's going to do it's own thing...

while {true} do {
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	titleText[localize "STR_NOTF_DeviceMining","PLAIN"];
	_time = time + 27;

	//Wait for 27 seconds with a 'delta-time' wait.
	waitUntil {
		if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		sleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText[localize "STR_NOTF_MiningStopped","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;

	if (_space < 0) exitWith {hint "Usebug logué sur ce véhicule, minage désactivé, inventaire supprimé. Il ne faut pas refuel en même temps que le Tempest mine. Range ton véhicule et ressort-le."; _useBug = true;};
	_itemIndex = [_item,_items] call life_fnc_index;
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight..
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	_itemWeight = ([_item] call life_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};

	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};

	//Locality checks...
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[[_vehicle,(fuel _vehicle)-0.04],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
	};

	if(fuel _vehicle == 0) exitWith {titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];};
	titleText[format[localize "STR_NOTF_DeviceMined",_sum],"PLAIN"];
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight..
	if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};
	sleep 2;
};

if (_useBug) exitWith
{
	_vehicle setVariable ["Trunk",[[],0],true];
};

_vehicle setVariable["mining",nil,true];