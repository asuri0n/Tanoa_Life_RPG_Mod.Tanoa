#include <macro.h>

private["_building"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (__GETC__(life_adminlevel) == 0) exitWith {};
if (isNull _building) exitWith {hint "NULL building?";};
if (!(_building isKindOf "Land_TBox_F")) exitWith {hint "Tu ne vises le bon bâtiment.";};
if (_building getVariable ["commsActive", true]) exitWith {hint "Action inutile, tout fonctionne normalement.";};
_building setVariable["commsActive",true,true];