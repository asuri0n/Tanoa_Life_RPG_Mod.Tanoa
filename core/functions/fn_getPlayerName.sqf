/*
	Author: Komodo, reusing Kriss' code on playerTags
	Filename: fn_getPlayerName.sqf
	Description:
	Gives player name or "Masked" when applicable.
*/
private ["_unit","_goggles","_headGear","_uniform","_name","_masked"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_masked = false;

if (isNull _unit) exitWith {};

_name = _unit getVariable["realname",""];

_goggles = goggles _unit;
_headGear = headgear _unit;
_uniform = uniform _unit;

if (( _goggles in life_maskingGoggles ) || ( _headGear in life_maskingHeadgear) || ( _uniform in life_maskingUniforms)) then
{
	//if in the group ---> don't hide
	if ( !(_unit in (units group player))) then
	{
		_name = "** Masqué **";
		_masked = true;
	};
};
_name;