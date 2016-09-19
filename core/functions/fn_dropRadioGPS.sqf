/*
	File: fn_dropRadioGPS.sqf
	Author: S.Lambert alias Krisscut
	Date : 03/09/2014 16h40

	Description:
	Remove GPS & Radio items from player inventory and add it to the unit given in parameter
*/
private["_unit","_onceDelete","_nameL","_cell"];

_onceDelete = false;
_unit = _this select 0;

_cell = false;
_nameL = "";
{  
	_nameL = _x;
	_name = [_x,14] call KRON_StrLeft;  
	diag_log format ["_name %1",_name];
	if(_name == "tf_anprc148jem" || _name == "ItemRadio") then  
	{  
		_nameL = _x;
		_cell = true;  
	};
}foreach assignedItems player;

if (_cell) then
{
	player unassignItem _nameL;
	player removeItem _nameL;
	_unit addItem _nameL;
	_onceDelete = true;
};

if ("ItemGPS" in assignedItems player) then
{
	player unassignItem "ItemGPS";
	player removeItem "ItemGPS";
	_unit addItem "ItemGPS";
	_onceDelete = true;
};

if(_onceDelete) then {titleText["On vous a pris vos moyens de communications et de positionnement GPS !","PLAIN"];};

if(!isNull (findDisplay 3000)) then {closedialog 3000};