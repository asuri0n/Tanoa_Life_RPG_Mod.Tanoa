#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return","_i","_area","_myGangId","_ownerId","_hideout","_spawnAuthorized"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Georgetown","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","La Rochelle","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Aéroport de Tanoa","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Lijnhaven","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_6","Terrain d'entrainement","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			//["cop_spawn_5","CP Harcourt","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_11","Prison","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};

	case civilian:
	{
		_return = [];
		_return  pushBack ["civ_spawn_1","Georgetown","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		_return  pushBack ["civ_spawn_2","La Rochelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		_return  pushBack ["civ_spawn_3","Lifou","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		_return  pushBack ["civ_spawn_4","Aéroport de saint george","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		_return  pushBack ["civ_spawn_5","Ouméré","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

		if(license_civ_bonbeur) then {
			_return  pushBack ["bonbeur_spawn","Entreprise bonbeur","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		};
		if(license_civ_gangster) then {
			_return  pushBack ["gangster_spawn","Camp Gangster","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		};

		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};
	};

	case independent:
	{
		_return = [];
		switch(true) do
		{
			case (__GETC__(life_medicLevel) > 0) :
			{
				_return  pushBack ["med_spawn_1","Hôpital Georgetown","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
				_return  pushBack ["med_spawn_2","Hôpital La Rochelle","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
				_return  pushBack ["med_spawn_3","Hôpital Aéroport de Tanoa","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
				_return  pushBack ["med_spawn_4","Hôpital Aéroport de saint george","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
				_return  pushBack ["med_spawn_4","Hôpital Ouméré","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

			};
			case (__GETC__(life_depanLevel) > 0) :
			{
				_return  pushBack ["depannage1","QG Kavala","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"];
				_return  pushBack ["depannage2","QG Athira","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"];
				_return  pushBack ["depannage3","QG Sofia","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"];
			};
			default
			{
				_return  pushBack ["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
				_return  pushBack ["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
				_return  pushBack ["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
				_return  pushBack ["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			};
		};
	};

	case east:
	{
		_return = [];
		if(license_civ_rebel) then {
			_return  pushBack ["reb_spawn_1","Aérodrome de Bala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

			diag_log format["[VACA_DEBUG] ====== SPAWN gang data:%1", life_gangData];
			if((count life_gangData) != 0) then {
				_i = 0;
				_myGangId = life_gangData select 0;
				{
					_i = _i + 1;
					_area = format["area_spawn_%1", _i];
					_hideout = missionNamespace getVariable [_x select 1, objNull];
					if (isNull _hideout) exitWith {diag_log "SPAWN: hideout non trouvée";};

					_spawnAuthorized = _hideout getVariable ["spawnAuthorized",false];
					_ownerId = _hideout getVariable["ownerId",-1];
					diag_log format["SPAWS this area:%1", _x];
					if ((_myGangId == _ownerId) AND _spawnAuthorized) then
					{
						_return pushBack [_area,_x select 2,"\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
					};
				} forEach INVO_listCaptureArea;
			};
			diag_log "[VACA_DEBUG] ====== FIN GANG";

			if(count life_houses > 0) then {
				{
					_pos = call compile format["%1",_x select 0];
					_house = nearestBuilding _pos;
					_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

					_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
				} foreach life_houses;
			};
		};
	};
};

_return;