#include <macro.h>
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_answer","_vehiclesLimit","_playersInGroupCount"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint "Tu n'as pas choisi de véhicule"};

_answer =  false;
//Komodo: ajout message de confirmation vente/location
if (_mode) then
{
	_answer = [
	format["<t color='#8cff9b'>Etes vous sur de vouloir ACHETER ce véhicule?</t>"],
	"Achat",
	"Oui",
	"Non"
	] call BIS_fnc_guiMessage;
}
else
{
	_answer = [
	format["<t color='#8cff9b'>Etes vous sur de vouloir LOUER ce véhicule?</t>"],
	"Location",
	"Oui",
	"Non"
	] call BIS_fnc_guiMessage;
};

if (!_answer) exitWith {hint "Action annulée.";};

_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg;

if(_mode) then {
	_basePrice = ((_vehicleList select _vIndex) select 1)*1.5;
} else {
	_basePrice = (_vehicleList select _vIndex) select 1;
};

if(__GETC__(life_donator) == 1)then {
	_basePrice = round(_basePrice - (_basePrice*(5/100)));
};
if(__GETC__(life_donator) == 2)then {
	_basePrice = round(_basePrice - (_basePrice*(10/100)));
};
if(__GETC__(life_donator) == 3)then {
	_basePrice = round(_basePrice - (_basePrice*(15/100)));
};
if(__GETC__(life_donator) == 0)then {
	_basePrice = _basePrice;
};

_playersInGroupCount = count (units (group player));
if (_playersInGroupCount <= 4) then
{
	_vehiclesLimit = 2;
}
else
{
	_vehiclesLimit = 3;
};

if (_className in invo_limited_vehicles) then
{
	_limitedVehiclesCount = count ([group player, invo_limited_vehicles] call INVO_fnc_vehiclesInGangOfType);
	if (_limitedVehiclesCount >= _vehiclesLimit) exitWith {hint "Ton groupe a déjà trop de blindés!!"; _exit = true;};
	diag_log format ["DEBUG: - unimpound - veh: %1; limitCount: %2, vehLimite: %3", _className, _limitedVehiclesCount, _vehiclesLimit];
};

if (_className in invo_limited_vehicles_armed) then
{
	_limitedVehiclesCount = count ([group player, invo_limited_vehicles_armed] call INVO_fnc_vehiclesInGangOfType);
	if (_limitedVehiclesCount >= _vehiclesLimit) exitWith {hint "Ton groupe a déjà trop de véhicules armés!!"; _exit = true;};
	diag_log format ["DEBUG: - unimpound - veh: %1; limitCount: %2, vehLimite: %3", _className, _limitedVehiclesCount, _vehiclesLimit];
};

_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_liquide < _basePrice) exitWith {hint format["Tu n'as pas assez d'argent pour acheter ce véhicule.\n\nManque: $%1",[_basePrice - life_liquide] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint "Tu n'as pas la licence requise!"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if ((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {hint "Il y a un véhicule qui bloque le point de spawn";};
life_liquide = life_liquide - _basePrice;
["vehicleBuy", false, -1 * _basePrice] call life_fnc_antiCheatCash;
hint format["Tu as acheté %1 pour $%2",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];
playSound "caching";
[[format["%1 a acheter un %2 pour %3",name player,getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
//Spawn the vehicle and prep it.
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	/*[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;*/
	_vehicle allowDamage true; //Re-enable damage handling.
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["trunk_in_use_by","",true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",nil,false] spawn life_fnc_MP;
	sleep 3;
	_vehicle setdamage 0;
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",nil,false] spawn life_fnc_MP;
//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};

	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		switch(true) do
		{
			case (__GETC__(life_medicLevel) > 0) :
			{
				[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
			};
			case (__GETC__(life_depanLevel) > 0) :
			{
				[_vehicle,"dep_offroad",true] spawn life_fnc_vehicleAnimate;
			};
		};
	};
};

life_vehicles pushBack _vehicle; //Add err to the chain.
if(_mode) then {
	if(!(_className in ["B_MRAP_01_hmg_F"])) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	};
};

//[] call SOCK_fnc_updateRequestMoney;
closeDialog 0; //Exit the menu.
true;