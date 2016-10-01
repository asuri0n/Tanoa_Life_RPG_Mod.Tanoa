/*
	Author: Bryan "Tonic" Boardwine
	Filename: fn_inventoryOpened.sqf

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_nop"];
_nop = true;
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
_veh = vehicle player;

if (_veh == player) Then {_veh = cursorTarget};
if (locked _veh > 1) Then
{
	hint "Impossible, vehicule fermé à clef !";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
	_nop = false;
};

if ((((playerSide == civilian) OR (playerSide == east)) && (license_civ_rebel)) && (cursortarget getvariable["FAR_isUnconscious",0] == 1)or (cursortarget getVariable "restrained") or (group cursortarget == group player) or (cursortarget getVariable "playerSurrender")) then {
	hint "Ouverture du sac !";
} else {
	hint "Impossible de voler dans les sacs !";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
	_nop = false;
};

if(((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) && ((playerSide == civilian) OR (playerSide == east))) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint "Tu n'as pas acces à cette caisse car le propriétaire a verrouiller celui ci";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
	_nop = false;
};

if(_nop) then {
	PlaySound "zipup";
};

//Komodo: might help limiting duplication by forcing access to inventory by only one player.
_container setVariable["accessed_by",getPlayerUID player,true];
[_container] spawn
{
	waitUntil {!isNull (findDisplay 602)};
	sleep(1);
	while{true} do
	{
		if ((_this select 0) getVariable["accessed_by",""] != getPlayerUID player) exitWith
		{
			closeDialog 0;
		};
		sleep 1;
		if (isNull (findDisplay 602)) exitWith {diag_log "INVO DEBUG - inventoryClosed - end loop";};
	};
};
