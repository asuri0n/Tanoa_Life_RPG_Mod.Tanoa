/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_lastPlayMove"];
_vehicle = cursorTarget;
life_interrupted = false;
if(isNull _vehicle) exitWith {hint "Tu dois viser le véhicule que tu veux remplir!"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "Tu dois être proche d'un véhicule!"};

if(!([false,"fuelF",1] call life_fnc_handleInv)) exitWith {};
life_action_inUse = true;
/*player setVariable ["AGM_canTreat", false, true];*/
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format["Ravitaillement %1",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_lastPlayMove = 0;

while{true} do
{
	if((_lastPlayMove - time) < 0) then {
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		_lastPlayMove = time + 5.8;
	};
	sleep 0.2;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_interrupted) exitWith {};
};
life_action_inUse = false;
/*player setVariable ["AGM_canTreat", true, true];*/
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"];};


switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			[[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.5);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.5);
		};
	};

	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			[[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.2);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.2);
		};
	};

	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			[[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.35);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.35);
		};
	};
};
titleText[format["Tu as ravitaillé le %1",_displayName],"PLAIN"];
[true,"fuelE",1] call life_fnc_handleInv;