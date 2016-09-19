/*
    File: fn_civLoadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_uniform","_vest","_backpack","_goggles","_headgear","_items","_prim","_seco","_hgun","_uItems","_bItems","_vItems","_pItems","_sItems","_hItems","_yItems","_uMags","_bMags","_vMags","_handle"];

if (playerSide == civilian) then {_itemArray = civ_gear;};
if (playerSide == independent) then {_itemArray = indep_gear;};

waitUntil {!(isNull (findDisplay 46))};
if(count _itemArray == 0) exitWith
{
    if(headGear player != "") then {removeHeadgear player;};
    if(goggles player != "") then {removeGoggles player;};
};

//Strip the unit down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
    player unassignItem _x;
    player removeItem _x;
} foreach (assignedItems player);

_uniform = [_itemArray,0,"",[""]] call BIS_fnc_param;
_vest = [_itemArray,1,"",[""]] call BIS_fnc_param;
_backpack = [_itemArray,2,"",[""]] call BIS_fnc_param;
_goggles = [_itemArray,3,"",[""]] call BIS_fnc_param;
_headgear = [_itemArray,4,"",[""]] call BIS_fnc_param;
_items = [_itemArray,5,[],[[]]] call BIS_fnc_param;
_prim = [_itemArray,6,"",[""]] call BIS_fnc_param;
_seco = [_itemArray,7,"",[""]] call BIS_fnc_param;
_hgun = [_itemArray,8,"",[""]] call BIS_fnc_param;
_uItems = [_itemArray,9,[],[[]]] call BIS_fnc_param;
_uMags = [_itemArray,10,[],[[]]] call BIS_fnc_param;
_bItems = [_itemArray,11,[],[[]]] call BIS_fnc_param;
_bMags = [_itemArray,12,[],[[]]] call BIS_fnc_param;
_vItems = [_itemArray,13,[],[[]]] call BIS_fnc_param;
_vMags = [_itemArray,14,[],[[]]] call BIS_fnc_param;
_pItems = [_itemArray,15,[],[[]]] call BIS_fnc_param;
_sItems = [_itemArray,16,[],[[]]] call BIS_fnc_param;
_hItems = [_itemArray,17,[],[[]]] call BIS_fnc_param;
_yItems = [_itemArray,18,[],[[]]] call BIS_fnc_param;

if(_prim != "") then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_seco != "") then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_hgun != "") then {_handle = [_hgun,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_goggles != "") then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_headgear != "") then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
{
    if (_x != "") then {
        player addPrimaryWeaponItem _x;
    };
} foreach (_pItems);
{
    if (_x != "") then {
        player addSecondaryWeaponItem _x;
    };
} foreach (_sItems);
{
    if (_x != "") then {
        player addHandgunItem _x;
    };
} foreach (_hItems);
{player addItemToUniform _x;} foreach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} foreach (_uMags);
{player addItemToVest _x;} foreach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} foreach (_vMags);
{player addItemToBackpack _x;} foreach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} foreach (_bMags);

[] call life_fnc_carryLoadCfg; //Komodo: added to force computation of maxweight

{
    _item = [_x,1] call life_fnc_varHandle;
    [true,_item,1] call life_fnc_handleInv;
} foreach (_yItems);
