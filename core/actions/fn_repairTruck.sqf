/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_time","_lastPlayMove"];
_veh = cursorTarget;
if(_veh isKindOf "car") then {
	_time = 0.35;
} else {
	_time = 0.60;
};
_lastPlayMove = 0;

life_interrupted = false;
if(isNull _veh) exitwith {};
if(life_action_inUse) exitWith {hint "Tu es déjà occupé.";};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		player setVariable ["AGM_canTreat", false, true];
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Réparation %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while{true} do
		{
			if((_lastPlayMove - time) < 0) then {
				player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player say3D "repairCric";
				_lastPlayMove = time + 6;
			};
			sleep _time;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
			if (!("ToolKit" in (items player))) exitWith {};
		};

		life_action_inUse = false;
		player setVariable ["AGM_canTreat", true, true];
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if (!("ToolKit" in (items player))) exitWith {};
		if(!alive player) exitWith {};
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Action terminée","PLAIN"]; life_action_inUse = false; player setVariable ["AGM_canTreat", true, true];};
		if(player != vehicle player) exitWith {titleText["Tu dois être à l'exterieur du véhicule pour le réparer.","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		//Systeme de rémunération pour les dépanneur
		if((playerSide == independent) && ((call life_medicLevel) > 0) && !(_veh in life_vehicles)) then
		{
			titleText["Tu as gagné 7500€ pour la réparation du véhicule.","PLAIN"];
			life_liquide = life_liquide + 7500;
			["repairTruck", false, 7500] call life_fnc_antiCheatCash;
		}else{
			titleText["Tu as réparé le véhicule","PLAIN"];
		};

	};
};