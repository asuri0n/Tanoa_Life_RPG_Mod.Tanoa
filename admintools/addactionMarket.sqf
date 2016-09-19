// Copyright 2014 Altis-azura.fr
Fock2_addactionMP =
{
private["_object","_screenMsg","_scriptToCall","_scriptToCall2"];
_object = _this select 0;
_screenMsg = _this select 1;
_scriptToCall = _this select 2;
_scriptToCall2 = _this select 3;

if(isNull _object) exitWith {};

_object addaction [_screenMsg,_scriptToCall,_scriptToCall2];
};