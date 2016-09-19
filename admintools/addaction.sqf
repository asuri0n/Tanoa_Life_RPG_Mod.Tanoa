// Copyright 2014 Altis-azura.fr
Fock_addactionMP =
{
private["_object","_screenMsg","_scriptToCall"];
_object = _this select 0;
_screenMsg = _this select 1;
_scriptToCall = _this select 2;

if(isNull _object) exitWith {};

_object addaction [_screenMsg,_scriptToCall];
};