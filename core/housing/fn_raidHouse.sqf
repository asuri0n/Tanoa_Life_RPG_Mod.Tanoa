#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Filename: fn_raidHouse.sqf

	Description:
	Raids the players house?
*/
private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_houseInv","_houseInvData","_houseInvVal"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Cette maison n'a pas de propriétaire."};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint "Cette personne n'est pas en ligne, vous ne pouvez pas piller sa maison!"};
life_action_inUse = true;
player setVariable ["AGM_canTreat", false, true];

//Setup the progress bar
disableSerialization;
_title = "Fouille de la maison....";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(player distance _house > 13) exitWith {};
	if (vehicle player != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(player distance _house > 13) exitWith {life_action_inUse = false; titleText["Vous êtes allé trop loin de la maison!","PLAIN"]; player setVariable ["AGM_canTreat", true, true];};
if(!alive player) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
if (vehicle player != player) exitWith {life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
life_action_inUse = false;
player setVariable ["AGM_canTreat", true, true];

[_house] call life_fnc_lockHouse; //Komodo: allows to make containers popup, and to fill in the trunk if players hasn't use the house.
sleep 4; //waiting for server to complete.

_houseInv = _house getVariable ["Trunk",[[],0]];
if(_houseInv isEqualTo [[],0]) exitWith {hint "Il n'y a rien dans la maison."};

_houseInvData = _houseInv select 0;
_houseInvVal = _houseInv select 1;
_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;

	_index = [_var,life_illegal_items] call life_fnc_index;
	if(_index != -1) then {
		_vIndex = [_var,__GETC__(sell_array)] call life_fnc_index;
		if(_vIndex != -1) then {
			_houseInvData deleteAt _forEachIndex;
			_houseInvVal = _houseInvVal - (([_var] call life_fnc_itemWeight) * _val);
			_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
		};
	};
} foreach (_houseInv select 0);

if(_value > 0) then {
	[[0,format["Une maison a été perquisitionné et avait $%1 kilos de drogue / contrebande.",[_value] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	life_dabliquide = life_dabliquide + _value;
	["raidHouse", true, _value] call life_fnc_antiCheatCash;
	_house setVariable["Trunk",[_houseInvData,_houseInvVal],true];
	[[_house],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
} else {
	hint "Rien d'illégal dans cette maison.";
};
