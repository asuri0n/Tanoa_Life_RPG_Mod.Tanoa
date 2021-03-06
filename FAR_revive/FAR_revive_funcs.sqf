////////////////////////////////////////////////
// Player Actions
////////////////////////////////////////////////
FAR_Player_Actions =
{
	if (alive player && player isKindOf "Man") then
	{
		// addAction args: title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition, positionInModel, radius, radiusView, showIn3D, available, textDefault, textToolTip)
		player addAction ["<t color=""#C90000"">" + "Stopper l'hémorragie" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_stabilize"], 10, true, true, "", "call FAR_Check_Stabilize"];
		//player addAction ["<t color=""#C90000"">" + "Suicide" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_suicide"], 9, false, true, "", "call FAR_Check_Suicide"];
		player addAction ["<t color=""#C90000"">" + "Trainer" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_drag"], 9, false, true, "", "call FAR_Check_Dragging"];

		if((playerSide == independent) || (playersNumber resistance == 0)) then {
			player addAction ["<t color=""#C90000"">" + "Réanimer" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_revive"], 10, true, true, "", "call FAR_Check_Revive"];
		};
	};
};

////////////////////////////////////////////////
// Handle Death
////////////////////////////////////////////////
FAR_HandleDamage_EH =
{
	private ["_unit", "_killer", "_part", "_projectile", "_amountOfDamage", "_isUnconscious"];

	_unit = _this select 0;
	_part = _this select 1;
	_amountOfDamage = _this select 2;
	_killer = _this select 3;
	_isUnconscious = _unit getVariable "FAR_isUnconscious";
	_projectile = _this select 4;
	invo_killer = _killer;

	//Internal Debugging.
	if (VACA_SERV_DEBUG) then {
		systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_amountOfDamage,_killer,_projectile,diag_frameno];
	};

	//Handle the tazer first (Top-Priority).
	if(!isNull _killer) then {
		if(_killer != _unit) then {
			_curWep = currentWeapon _killer;
			if(_projectile in ["B_9x21_Ball","B_556x45_dual","DDOPP_B_Taser","B_9x21_Ball","B_556x45_dual"] && _curWep in ["DDOPP_X26","DDOPP_X26_b","DDOPP_X3","DDOPP_X3_b","hgun_P07_snds_F","arifle_SDAR_F"]) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile in ["B_9x21_Ball","B_556x45_dual","DDOPP_B_Taser"]) then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};

				_amountOfDamage = false;
				if(_unit distance _killer < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_killer] spawn life_fnc_tazed;};
						if(_isVehicle) exitWith {};
						if (!_isVehicle && !_isQuad) then {
							[_unit,_killer] spawn life_fnc_tazed;
						};
					};
				};

				//Temp fix for super tasers on cops.
				if(playerSide == west && side _killer == west) then {
					_amountOfDamage = false;
				};
			};
		};
	};

	[] call life_fnc_hudUpdate;

	//diag_log format ["INVO DEBUG - AGMhandleDamage - _killer: %1, _projectile: %2; Damage: %3", typeOf (vehicle _killer), _projectile,_amountOfDamage];
	if (((vehicle _killer isKindOf "Ship") OR ( vehicle _killer isKindOf "Air") OR (vehicle _killer isKindOf "LandVehicle")) AND (_projectile == "")) then
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
		 _amountOfDamage = 0;
		 [_projectile] spawn life_fnc_handleFlashbang;
	 };

	// 26K - Added body part check - Script was checking hits on arms and legs causing early KIAs.
    if (alive _unit && _amountOfDamage >= 0.9 && _isUnconscious == 0/* && _bodyPart in ["","head_hit","body"]*/) then
	{
		_unit setDamage 0;
		_unit allowDamage false;
		_amountOfDamage = 0;

		[_unit, _killer] spawn FAR_Player_Unconscious;
	};

	_amountOfDamage
};

////////////////////////////////////////////////
// Make Player Unconscious
////////////////////////////////////////////////
FAR_Player_Unconscious =
{
	private["_unit", "_killer"];
	_unit = _this select 0;
	_killer = _this select 1;

	// Death message
	if (FAR_EnableDeathMessages && !isNil "_killer" && isPlayer _killer && _killer != _unit) then
	{
		FAR_deathMessage = [_unit, _killer];
		publicVariable "FAR_deathMessage";
		["FAR_deathMessage", [_unit, _killer]] call FAR_public_EH;
	};

	if (isPlayer _unit) then
	{
		disableUserInput true;
		titleText ["", "BLACK FADED"];
	};

	// Eject unit if inside vehicle
	if (vehicle _unit != _unit) then
	{
		unAssignVehicle _unit;
		_unit action ["getOut", vehicle _unit];

		sleep 2;
	};

	_unit setDamage 0;
    	_unit setVelocity [0,0,0];
    	_unit allowDamage false;
	_unit setCaptive true;
    	_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";

	sleep 4;

	if (isPlayer _unit) then
	{
		titleText ["", "BLACK IN", 1];
		disableUserInput false;

		// Mute Radio
		_unit setVariable ["ace_sys_wounds_uncon", true];
	};

	_unit switchMove "AinjPpneMstpSnonWrflDnon";
	_unit enableSimulation false;
	_unit setVariable ["FAR_isUnconscious", 1, true];

	// Call this code only on players
	if (isPlayer _unit) then
	{
		_bleedOut = time + FAR_BleedOut;

		while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 && _unit getVariable "FAR_isStabilized" == 0 && (FAR_BleedOut <= 0 || time < _bleedOut) } do
		{
			hintSilent format["Mort dans %1 secondes si vous n'êtes pas stabilisé\n\n%2", round (_bleedOut - time), call FAR_CheckFriendlies];

			sleep 0.5;
		};

		if (_unit getVariable "FAR_isStabilized" == 1) then {
			//Unit has been stabilized. Disregard bleedout timer and umute player
			_unit setVariable ["ace_sys_wounds_uncon", false];

			while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 } do
			{
				hintSilent format["Vous avez été stabilisé\n\n%1", call FAR_CheckFriendlies];

				sleep 0.5;
			};
		};

		// Player bled out
		if (FAR_BleedOut > 0 && {time > _bleedOut} && {_unit getVariable ["FAR_isStabilized",0] == 0}) then
		{
			_unit setDamage 1;
		}
		else
		{
			// Player got revived
			_unit setVariable ["FAR_isStabilized", 0, true];
			sleep 6;

			// Clear the "medic nearby" hint
			hintSilent "";

			// Unmute Radio
			if (isPlayer _unit) then
			{
				_unit setVariable ["ace_sys_wounds_uncon", false];
			};

			_unit enableSimulation true;
			_unit allowDamage true;
			_unit setDamage 0;
			_unit setCaptive false;

			_unit playMove "amovppnemstpsraswrfldnon";
			_unit playMove "";
		};
	}
	else
	{
		// [Debugging] Bleedout for AI
		_bleedOut = time + FAR_BleedOut;

		while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 && _unit getVariable "FAR_isStabilized" == 0 && (FAR_BleedOut <= 0 || time < _bleedOut) } do
		{
			sleep 0.5;
		};

		if (_unit getVariable "FAR_isStabilized" == 1) then {
			while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 } do
			{
				sleep 0.5;
			};
		};

		// AI bled out
		if (FAR_BleedOut > 0 && {time > _bleedOut} && {_unit getVariable ["FAR_isStabilized",0] == 0}) then
		{
			_unit setDamage 1;
			_unit setVariable ["FAR_isUnconscious", 0, true];
			_unit setVariable ["FAR_isDragged", 0, true];
		}
	};
};

////////////////////////////////////////////////
// Revive Player
////////////////////////////////////////////////
FAR_HandleRevive =
{
	private ["_target"];

	_target = _this select 0;

	if (alive _target) then
	{
		player playMove "AinvPknlMstpSlayWrflDnon_medic";

		_target setVariable ["FAR_isUnconscious", 0, true];
		_target setVariable ["FAR_isDragged", 0, true];

		if(playerSide == independent) then {
			hint "Vous avez été payé 1500€ pour cette action";
			life_dabliquide = life_dabliquide + 1500;
			player removeItem "Medikit";
		};

		sleep 6;
	};

	player reveal _target;
};

////////////////////////////////////////////////
// Stabilize Player
////////////////////////////////////////////////
FAR_HandleStabilize =
{
	private ["_target"];

	_target = _this select 0;

	if (alive _target) then
	{
		player playMove "AinvPknlMstpSlayWrflDnon_medic";

		if (!("Medikit" in (items player)) ) then {
			player removeItem "FirstAidKit";
		};

		_target setVariable ["FAR_isStabilized", 1, true];

		sleep 6;
	};
};

////////////////////////////////////////////////
// Drag Injured Player
////////////////////////////////////////////////
FAR_Drag =
{
	private ["_target", "_id"];

	FAR_isDragging = true;

	_target = _this select 0;

	_target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;
	_target setVariable ["FAR_isDragged", 1, true];

	player playMoveNow "AcinPknlMstpSrasWrflDnon";

	// Rotation fix
	FAR_isDragging_EH = _target;
	publicVariable "FAR_isDragging_EH";

	// Add release action and save its id so it can be removed
	_id = player addAction ["<t color=""#C90000"">" + "Lâcher" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_release"], 10, true, true, "", "true"];

	hint "Press 'C' if you can't move.";

	// Wait until release action is used
	waitUntil
	{
		!alive player || player getVariable "FAR_isUnconscious" == 1 || !alive _target || _target getVariable "FAR_isUnconscious" == 0 || !FAR_isDragging || _target getVariable "FAR_isDragged" == 0
	};

	// Handle release action
	FAR_isDragging = false;

	if (!isNull _target && alive _target) then
	{
		_target switchMove "AinjPpneMstpSnonWrflDnon";
		_target setVariable ["FAR_isDragged", 0, true];
		detach _target;
	};

	player removeAction _id;
};

FAR_Release =
{
	// Switch back to default animation
	player playMove "amovpknlmstpsraswrfldnon";

	FAR_isDragging = false;
};

////////////////////////////////////////////////
// Event handler for public variables
////////////////////////////////////////////////
FAR_public_EH =
{
	if(count _this < 2) exitWith {};

	_EH  = _this select 0;
	_target = _this select 1;

	// FAR_isDragging
	if (_EH == "FAR_isDragging_EH") then
	{
		_target setDir 180;
	};

	// FAR_deathMessage
	if (_EH == "FAR_deathMessage") then
	{
		_killed = _target select 0;
		_killer = _target select 1;

		if (isPlayer _killed && isPlayer _killer) then
		{
			systemChat format["%1 a été blessé par %2", name _killed, name _killer];
		};
	};
};

////////////////////////////////////////////////
// Revive Action Check
////////////////////////////////////////////////
FAR_Check_Revive =
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];

	_return = false;

	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf player >> "attendant");
	_target = cursorTarget;

	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable "FAR_isDragged";

	// Make sure target is unconscious and player is a medic
	if (_isTargetUnconscious == 1 && _isDragged == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) ) then
	{
		_return = true;

		// [ReviveMode] Check if player has a Medikit
		if ( FAR_ReviveMode == 2 && !("Medikit" in (items player)) ) then
		{
			_return = false;
		};
	};

	_return
};

////////////////////////////////////////////////
// Stabilize Action Check
////////////////////////////////////////////////
FAR_Check_Stabilize =
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];

	_return = false;

	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	_target = cursorTarget;


	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isTargetStabilized = _target getVariable "FAR_isStabilized";
	_isDragged = _target getVariable "FAR_isDragged";

	// Make sure target is unconscious and hasn't been stabilized yet, and player has a FAK/Medikit
	if (_isTargetUnconscious == 1 && _isTargetStabilized == 0 && _isDragged == 0 && ( ("FirstAidKit" in (items player)) || ("Medikit" in (items player)) ) ) then
	{
		_return = true;
	};

	_return
};

////////////////////////////////////////////////
// Suicide Action Check
////////////////////////////////////////////////
FAR_Check_Suicide =
{
	_return = false;
	_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",0];

	if (alive player && _isPlayerUnconscious == 1) then
	{
		_return = true;
	};

	_return
};

////////////////////////////////////////////////
// Dragging Action Check
////////////////////////////////////////////////
FAR_Check_Dragging =
{
	private ["_target", "_isPlayerUnconscious", "_isDragged"];

	_return = false;
	_target = cursorTarget;
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";

	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return;
	};

	// Target of the action
	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable "FAR_isDragged";

	if(_isTargetUnconscious == 1 && _isDragged == 0) then
	{
		_return = true;
	};

	_return
};

////////////////////////////////////////////////
// Show Nearby Friendly Medics
////////////////////////////////////////////////
FAR_IsFriendlyMedic =
{
	private ["_unit"];

	_return = false;
	_unit = _this;
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf _unit >> "attendant");

	if ( alive _unit && (isPlayer _unit || FAR_Debugging) && side _unit == FAR_PlayerSide && _unit getVariable "FAR_isUnconscious" == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) ) then
	{
		_return = true;
	};

	_return
};

FAR_CheckFriendlies =
{
	private ["_unit", "_units", "_medics", "_hintMsg"];

	_units = nearestObjects [getpos player, ["Man", "Car", "Air", "Ship"], 800];
	_medics = [];
	_dist = 800;
	_hintMsg = "";

	// Find nearby friendly medics
	if (count _units > 1) then
	{
		{
			if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then
			{
				if (alive _x && count (crew _x) > 0) then
				{
					{
						if (_x call FAR_IsFriendlyMedic) then
						{
							_medics = _medics + [_x];

							if (true) exitWith {};
						};
					} forEach crew _x;
				};
			}
			else
			{
				if (_x call FAR_IsFriendlyMedic) then
				{
					_medics = _medics + [_x];
				};
			};

		} forEach _units;
	};

	// Sort medics by distance
	if (count _medics > 0) then
	{
		{
			if (player distance _x < _dist) then
			{
				_unit = _x;
				_dist = player distance _x;
			};

		} forEach _medics;

		if (!isNull _unit) then
		{
			_unitName	= name _unit;
			_distance	= floor (player distance _unit);

			_hintMsg = format["Médecin proche:\n%1 is %2m away.", _unitName, _distance];
		};
	}
	else
	{
		_hintMsg = "Aucun médecin proche";
	};

	_hintMsg
};



