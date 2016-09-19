#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used a refresher for the vehicle inventory / trunk menu items.
	From: right part of the dialog
	To: Left part.
*/
private["_veh","_tInv","_pInv","_veh_data","_vehFromIndex","_veh_dataFrom","_numFrom","_ctrlFrom","_numTo","_ctrlTo","_index","_icon"];
//_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (lbCurSel 3499 == -1) exitWith {lbSetCurSel [3499, 0];}; //Komodo: Transfer direct system. Exit because the lbSetCurSel will call again vehInventory...

_veh = life_vehicle_transfer_to;
if(isNull _veh OR !alive _veh) exitWith {[] call life_fnc_vehInventoryClose;}; //If null / dead exit menu
disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
_pInv = (findDisplay 3500) displayCtrl 3503;
lbClear _tInv;
lbClear _pInv;

if(_veh isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_veh getVariable["containers",[]]);
	_veh_data = [_mWeight,(_veh getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_veh] call life_fnc_vehicleWeight;
};

if(_veh_data select 0 == -1) exitWith {[] call life_fnc_vehInventoryClose; diag_log "Close Dialog line 119";};

ctrlSetText[3504,format["Poids: %1/%2",_veh_data select 1,_veh_data select 0]];
_data = _veh getVariable ["Trunk",[]];
if(count _data == 0) then {_veh setVariable["Trunk",[[],0],true]; _data = [];} else {_data = _data select 0;};

//diag_log "Inventory From: fn_vehInventory init";

/* Added by Komodo to handle direct transfers between vehicles
*/
//_selection = (findDisplay 3500) displayCtrl 3499;
if (!isNull life_vehicle_transfer_from && player != life_vehicle_transfer_from) then
{
	life_vehicle_transfer_from setVariable["trunk_in_use",false,true];
	life_vehicle_transfer_from setVariable["trunk_in_use_by","",true];
}; //re-allowing usage of trunk if another vehicule is selected
life_vehicle_transfer_from = ObjNull;

if (lbData[3499,(lbCurSel 3499)] == "Inventaire") then {
	life_vehicle_transfer_from = player;
	//diag_log "Inventory From: fn_vehInventory player";
}
else {
	//diag_log "Inventory From: fn_vehInventory vehicle";
	_vehFromIndex = parseNumber lbData[3499,(lbCurSel 3499)];
	//diag_log format["Inventory From: fn_vehInventory vehicle index: %1", _vehFromIndex];
	life_vehicle_transfer_from = life_vehicles select _vehFromIndex;

	if (life_vehicle_transfer_from getVariable ["trunk_in_use",true]) exitWith {[] call life_fnc_vehInventoryClose; hint "L'inventaire source est déjà en cours d'utilisation.";};
	if (life_vehicle_transfer_from getVariable ["trunk_in_use_by",""] != "") exitWith {[] call life_fnc_vehInventoryClose; hint "L'inventaire source est déjà en cours d'utilisation.";};
	life_vehicle_transfer_from setVariable["trunk_in_use",true,true];
	life_vehicle_transfer_from setVariable["trunk_in_use_by",getPlayerUID player,true];
};

if (life_vehicle_transfer_from == player) then {
	//Player Inventory
	//diag_log "Inventory From: fn_vehInventory player2";
	{
		//Money Handle
		if(_x != "life_liquide") then
		{
			_str = [_x] call life_fnc_varToStr;
			_shrt = [_x,1] call life_fnc_varHandle;
		_icon = [_x] call life_fnc_itemIcon;
			_val = missionNameSpace getVariable _x;
			if(_val > 0) then
			{
				_pInv lbAdd format["[%1] - %2",_val,_str];
				_pInv lbSetData [(lbSize _pInv)-1,_shrt];
				_pInv lbSetPicture [(lbSize _pInv)-1,_icon];
				if((lbCurSel 3503) > -1) then {
					_ctrlFrom = ctrlSelData(3503);
					if (_ctrlFrom == _shrt) then {
						_numFrom = [_ctrlFrom,_val,_veh_data select 1,_veh_data select 0] call life_fnc_calWeightDiff;
						ctrlSetText [3506, format ["%1", _numFrom]];
					};
				};
			};
		}
			else
		{
			if(life_liquide > 0) then
			{
				_pInv lbAdd format["$%1",[life_liquide] call life_fnc_numberText];
				_pInv lbSetData [(lbSize _pInv)-1,"money"];
			};
		};
	} foreach life_inv_items;
}
else {
	/* Case where life_vehicle_transfer_from is a vehicle */
	if(isNull life_vehicle_transfer_from OR !alive life_vehicle_transfer_from OR (player distance life_vehicle_transfer_from > 12)) exitWith {[] call life_fnc_vehInventoryClose; hint "Soit l'inventaire de l'objet source n'existe plus, soit il est trop loin, soit il a été détruit, ou son inventaire est en cours d'utilisation.";};

	if(life_vehicle_transfer_from isKindOf "House_F") then {
		private["_mWeightFrom"];
		if (!(life_vehicle_transfer_from getVariable ["contentInit", false])) exitWith {[] call life_fnc_vehInventoryClose; hint "Tu dois d'abord déverrouiller les containers pour que ça fonctionne!";};
		life_vehicle_transfer_house = life_vehicle_transfer_from; //Komodo: used to fix a bug not saving house trunk when user last selection is another vehicle...
		_mWeightFrom = 0;
		{_mWeightFrom = _mWeightFrom + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_vehicle_transfer_from getVariable["containers",[]]);
		_veh_dataFrom = [_mWeightFrom,(life_vehicle_transfer_from getVariable["Trunk",[[],0]]) select 1];
	} else {
		_veh_dataFrom = [life_vehicle_transfer_from] call life_fnc_vehicleWeight;
	};

	if(_veh_dataFrom select 0 == -1) exitWith {[] call life_fnc_vehInventoryClose; hint "veh_data_from -1";};

	//ctrlSetText[3504,format["Poids: %1/%2",_veh_dataFrom select 1,_veh_dataFrom select 0]]; -- should add a control first to display this information
	_dataFrom = life_vehicle_transfer_from getVariable ["Trunk",[]];
	if(count _dataFrom == 0) then {life_vehicle_transfer_from setVariable["Trunk",[[],0],true]; _dataFrom = [];} else {_dataFrom = _dataFrom select 0;};

	{
		if((_x select 0) != "money") then
		{
			_var = [_x select 0,0] call life_fnc_varHandle;
			_name = [_var] call life_fnc_varToStr;
		_icon = [_var] call life_fnc_itemIcon;
			_val = _x select 1;
			if(_val > 0) then
			{
				_pInv lbAdd format["[%1] - %2",_val,_name];
				_pInv lbSetData [(lbSize _pInv)-1,_x select 0];
				_tInv lbSetPicture [(lbSize _tInv)-1,_icon];
				if((lbCurSel 3503) > -1) then {
					_ctrlFrom = ctrlSelData(3503);
					if (_ctrlFrom == _x select 0) then {
						_numFrom = [_ctrlFrom,_val,_veh_data select 1,_veh_data select 0] call life_fnc_calWeightDiff;
						ctrlSetText [3506, format ["%1", _numFrom]];
					};
				};
			};
		}
			else
		{
			_val = _x select 1;
			if(_val > 0) then
			{
				_pInv lbAdd format["$%1",[_val] call life_fnc_numberText];
				_pInv lbSetData [(lbSize _pInv)-1,"money"];
			};
		};
	} foreach _dataFrom;
};

//diag_log "fin Init player/vehFrom item list";
//Trunk Inventory Items for targetted vehicle.

ctrlSetText [3505, "1"];
{
	if((_x select 0) != "money") then
	{
		_var = [_x select 0,0] call life_fnc_varHandle;
		_name = [_var] call life_fnc_varToStr;
		_icon = [_var] call life_fnc_itemIcon;
		_val = _x select 1;
		if(_val > 0) then
		{
			_tInv lbAdd format["[%1] - %2",_val,_name];
			_tInv lbSetData [(lbSize _tInv)-1,_x select 0];
			_tInv lbSetPicture [(lbSize _tInv)-1,_icon];
			if((lbCurSel 3502) > -1) then {
				_ctrlTo = ctrlSelData(3502);
				if (_ctrlTo == _x select 0) then {
					if (life_vehicle_transfer_from == player) then {
						_numTo = [_ctrlTo,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
						ctrlSetText [3505, format ["%1", _numTo]];
					}
					else {
						_numTo = [_ctrlTo,_val,_veh_dataFrom select 1,_veh_dataFrom select 0] call life_fnc_calWeightDiff;
						ctrlSetText [3505, format ["%1", _numTo]];
					};
				};
			};
		};
	}
		else
	{
		_val = _x select 1;
		if(_val > 0) then
		{
			_tInv lbAdd format["$%1",[_val] call life_fnc_numberText];
			_tInv lbSetData [(lbSize _tInv)-1,"money"];
		};
	};
} foreach _data;
