/*
	Author: Komodo
	Filename: fn_drawAlliesIcons.sqf

	Description:
	Draw icons over members of allies groups


					_position = visiblePosition _x;
					_position set[2,(getPosATL _x select 2) + 2.2];
*/

//
private ["_unit","_alliedUnits","_position"];

if (invo_allies isEqualTo []) exitWith {};

_alliedUnits = [] call INVO_fnc_getAlliedUnits;

if (_alliedUnits isEqualTo []) exitWith {};

{
	if (player distance _x < 2000) then
	{
		_position = visiblePosition _x;
		_position set[2,(getPosATL _x select 2) + 1.2];
		drawIcon3D ["a3\UI_F\data\GUI\Cfg\Hints\icon_text\o_unknown_ca.paa", [1,1,1,1], _position, 1, 1, 0, "", 0, 0.05];
	};
} count _alliedUnits;


