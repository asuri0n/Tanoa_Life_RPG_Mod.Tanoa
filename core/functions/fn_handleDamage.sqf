/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
invo_killer = _source;

//Internal Debugging.
if (VACA_SERV_DEBUG) then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual","DDOPP_B_Taser","B_9x21_Ball","B_556x45_dual"] && _curWep in ["DDOPP_X26","DDOPP_X26_b","DDOPP_X3","DDOPP_X3_b","hgun_P07_snds_F","arifle_SDAR_F"]) then {
			private["_distance","_isVehicle","_isQuad"];
			_distance = if(_projectile in ["B_9x21_Ball","B_556x45_dual","DDOPP_B_Taser"]) then {100} else {35};
			_isVehicle = if(vehicle player != player) then {true} else {false};
			_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};

			_damage = false;
			if(_unit distance _source < _distance) then {
				if(!life_istazed && !(_unit getVariable["restrained",false])) then {
					if(_isVehicle && _isQuad) then {
						player action ["Eject",vehicle player];
						[_unit,_source] spawn life_fnc_tazed;};
					if(_isVehicle) exitWith {};
					if (!_isVehicle && !_isQuad) then {
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			};

			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

[] call life_fnc_hudUpdate;

//diag_log format ["INVO DEBUG - AGMhandleDamage - _source: %1, _projectile: %2; Damage: %3", typeOf (vehicle _source), _projectile,_damage];
if (((vehicle _source isKindOf "Ship") OR ( vehicle _source isKindOf "Air") OR (vehicle _source isKindOf "LandVehicle")) AND (_projectile == "")) then
{
	diag_log "INVO DEBUG - Carkill";
	_unit allowDamage false;
	//_unit setVariable ["AGM_allowDamage", False];
	_unit spawn {
		sleep 2;
		//_this setVariable ["AGM_allowDamage", True];
		_this allowDamage true;
	};
};

 if (_projectile in ["mini_Grenade"]) then {
	 _damage = 0;
	 [_projectile] spawn life_fnc_handleFlashbang;
 };