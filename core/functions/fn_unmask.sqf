/*
	File: fn_unmask.sqf
	Author: S.Lambert alias Krisscut
	Date : 03/09/2014 12h40

	Description:
	Remove any masking objet from the player and try to fill his backpack if something is removed.
*/
private["_onceDelete","_unit","_uniform","_headGear","_goggles"];
_onceDelete = false;

_unit = _this select 0;

_uniform = uniform Player;
if (_uniform in life_maskingUniforms) then
{
	removeUniform player;
	if (_unit canAddItemToBackpack _uniform) then
	{
		_unit addItemToBackpack _uniform;
	}
	else
	{
		if (_unit canAddItemToVest _uniform) then
		{
			_unit addItemToVest _uniform;
		}
		else
		{
			if (_unit canAddItemToUniform _headGear) then
			{
				_unit addItemToUniform _headGear;
			}
		};
	};
	_onceDelete = true;
};

_headGear = (headgear player);
if ( _headGear in life_maskingHeadgear) then
{
	removeHeadgear player;
	if (_unit canAddItemToBackpack _headGear) then
	{
		_unit addItemToBackpack _headGear;
	}
	else
	{
		if (_unit canAddItemToVest _headGear) then
		{
			_unit addItemToVest _headGear;
		}
		else
		{
			if (_unit canAddItemToUniform _headGear) then
			{
				_unit addItemToUniform _headGear;
			}
		};
	};
	_onceDelete = true;
};

_goggles = (goggles player);
if (_goggles in life_maskingGoggles) then
{
	removeGoggles player;
	if (_unit canAddItemToBackpack _goggles) then
	{
		_unit addItemToBackpack _goggles;
	}
	else
	{
		if (_unit canAddItemToVest _goggles) then
		{
			_unit addItemToVest _goggles;
		}
		else
		{
			if (_unit canAddItemToUniform _goggles) then
			{
				_unit addItemToUniform _goggles;
			};
		};
	};

	_onceDelete = true;
};

if(_onceDelete) then {titleText["Vous avez été démasqué !","PLAIN"];};
life_action_inUse = false;
/*player setVariable ["AGM_canTreat", true, true];*/