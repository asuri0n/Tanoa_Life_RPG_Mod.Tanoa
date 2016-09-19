/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_dialog","_inv","_config","_itemInfo"]; //Declare all private variables
if(!dialog) then { //Verify if the window is open
	createDialog "Life_craft";
};
disableSerialization; //Disable Serialization

if(life_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};


_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
lbClear _inv; //clear the listbox


_config = ["weapon"] call life_fnc_craftCfg;
{
	_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
	_inv lbAdd format["%1",_itemInfo select 1]; //add a gun to the listbox
	_inv lbSetData[(lbSize _inv)-1,_itemInfo select 0]; //set the data of the gun
	_inv lbSetPicture[(lbSize _inv)-1,_itemInfo select 2];

} foreach (_config select 1);