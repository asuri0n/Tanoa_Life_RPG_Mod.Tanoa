#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'

	Kriss:
	link to DIK key code  https://community.bistudio.com/wiki/DIK_KeyCodes
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_handle"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = 35;//_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};

_interactionKeyAlternative = "";

if(count (actionKeys "User10") == 0) then
{
	_interactionKeyAlternative = 219;
}
else
{
	_interactionKeyAlternative = ((actionKeys "User10") select 0) ;
};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//if ((_code in (actionKeys "PersonView")) && life_firstCombatActive && ((vehicle player) == player)) exitWith {true;};

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if (life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Radio system event handler
if (INVO_radio_canUseRadio) then	//vehicle player != player
{
	_handled = ["KeyDown",_this] call INVO_fnc_radioEvents;
};

switch (_code) do
{
	//Space key for Jumping	
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution
			_handled = true;
		};
	};	

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_civilmarkers;}};

		};
	};


	// ALT J Se rendre
	case 36:
	{
		if (!_shift && _alt && !_ctrlKey) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && !(player getVariable ["Escorting", false]) ) then {
				if (player getVariable ["playerSurrender", false]) then {
					player setVariable ["playerSurrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
				};
			};
			_handled = true;
		};

		//Shift + J : Steal keys of proximity v?hicules
		if (_shift && !_alt && !_ctrlKey) then
		{
			if ( !isNull cursorTarget && (cursorTarget isKindOf "Man") && isPlayer cursorTarget && alive cursorTarget && (cursorTarget distance player < 4) && speed cursorTarget < 1 ) then
			{
				if( !(cursorTarget getVariable "Escorting") && (( cursorTarget getVariable "restrained") || cursorTarget getVariable["playerSurrender",false]/* || (cursorTarget getVariable["AGM_isUnconscious",false])*/ || (animationState cursorTarget) == "Incapacitated"))then
				{
					[[player], "life_fnc_stealKey",vehicle cursorTarget,false] spawn life_fnc_MP;
					titleText["Vous avez pris les clés de ses véhicules à proximite!","PLAIN"];
				};
			};
			_handled = true;
		};
	};
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		//Holster weapon
		if (vehicle player != player) exitWith {};
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		}
		else
		{
			/// recall weapon.
			if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
				if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
					player selectWeapon life_curWep_h;
				};
			}
			else
			{
				if(!life_action_inUse) then {
					[] spawn
					{
						private["_handle"];
						_handle = [] spawn life_fnc_actionKeyHandler;
						waitUntil {scriptDone _handle};
						life_action_inUse = false;
						/*player setVariable ["AGM_canTreat", true, true];*/

					};
				};
			};
		};
	};

	//alternativeInteractionKey - transition to new interaction system (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKeyAlternative:
	{
		if(!life_action_inUse) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandlerAlternative;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
				/*player setVariable ["AGM_canTreat", true, true];*/
			};
		};
	};

	case 62:
	{
		if (!_shift && _alt && !_ctrlKey) then
		{

		[[format["%1 a fait un ALT F4",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
		if (invo_cheating) then {[[format["%1 a fait un ALT F4 pendant la mort. CHEAT_DEATH",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;};

		};
	};

	case 1:
	{
		[[format["%1 a fait un ECHAP",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
		if (invo_cheating) then {[[format["%1  a fait un ECHA. CHEAT_DEATH",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;};
	};

	case 211:
	{
		if (!_shift && _alt && _ctrlKey) then
		{

		[[format["%1 a fait un ALT SUP",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
		if (invo_cheating) then {[[format["%1 a fait un ALT ALT SUP pendant la mort. CHEAT_DEATH",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;};
		};
	};
	case 15:
	{
		//Komodo: let's try not to spam logs thanks to invo_previous_AltTab
		if (!_shift && _alt && !_ctrlKey && !invo_previous_AltTab) then
		{
			invo_previous_AltTab = true;
			[[format["%1 a fait un ALT TAB",name player]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
			[] spawn {sleep 1; invo_previous_AltTab = false;}
		};
	};

	//Restraining (Shift + R)
	case 19:
	{
			/*
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call INVO_fnc_restrainAction;
		};*/

		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained")/*&& speed cursorTarget < 1*/) then
		{
			//AJOUT SKY LE 10/08/2014 pour rajouter les actions m?dic
			if((playerSide != civilian) OR (__GETC__(life_adminlevel) != 0)) then {
				//cop & admin & medic
				[] call INVO_fnc_restrainAction;
			}
			else
			{
				if((playerSide == civilian) && (license_civ_bounty_hunter) && (!(license_civ_rebel))) then
				{
					//chasseur de prime et non rebel !
					[] call INVO_fnc_restrainAction;
				};
				//we check if the civilian have enough items to do this action !
				if(cursorTarget getVariable["playerSurrender",false] || (/*(cursorTarget getVariable["AGM_isUnconscious",false]) && */(license_civ_rebel))) then {
					[] call INVO_fnc_restrainAction;
				};
			};
		};
		if (!_shift && _alt && !_ctrlKey) then
		{
			if ( !isNull cursorTarget && (cursorTarget isKindOf "Man") && isPlayer cursorTarget && alive cursorTarget && (cursorTarget distance player < 4) && speed cursorTarget < 1 ) then
			{
				if( !(cursorTarget getVariable "Escorting") && (( cursorTarget getVariable "restrained") || cursorTarget getVariable["playerSurrender",false]/* || (cursorTarget getVariable["AGM_isUnconscious",false])*/ || (animationState cursorTarget) == "Incapacitated"))then				{
					[[player],"life_fnc_dropRadioGPS",vehicle cursortarget,true] spawn life_fnc_MP;
					titleText["Vous avez pris les moyens de communications de cette personne !","PLAIN"];
					_handled = true;
				};
			};
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
		if (!_shift && _alt && !_ctrlKey) then
		{
			if ( !isNull cursorTarget && (cursorTarget isKindOf "Man") && isPlayer cursorTarget && alive cursorTarget && (cursorTarget distance player < 4) && speed cursorTarget < 1 ) then
			{
				if( !(cursorTarget getVariable "Escorting") && (( cursorTarget getVariable "restrained") || cursorTarget getVariable["playerSurrender",false] || (animationState cursorTarget) == "Incapacitated"))then
				{

					[[player],"life_fnc_unmask",vehicle cursortarget,true] spawn life_fnc_MP;
					titleText["Vous avez démasqué cette personne !","PLAIN"];
					_handled = true;
				};
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR (cursorTarget isKindOf "House_F")) && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38:
	{
		//OLD CODE MODIFIED BY SKY -- INCLUSION DEP //
		/*
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","I_Truck_02_medical_F","O_Truck_03_medical_F","B_Truck_01_medical_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","I_MRAP_03_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};

		*/

		/*switch(true) do
		{
			/*case (_shift && playerSide == west) :
			{
				if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_Offroad_01_repair_F","C_Offroad_01_repair_f","B_MRAP_01_F","C_SUV_01_F","I_Truck_02_medical_F","O_Truck_03_medical_F","B_Truck_01_medical_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","I_MRAP_03_F"]) then {
					if(!isNil {vehicle player getVariable "lights"}) then {
						[vehicle player] call life_fnc_sirenLights;
						_handled = true;
					};
				};
			};
			case (_shift && (playerSide == independent) && (__GETC__(life_medicLevel) > 0)) :
			{
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_medicSirenLights;
					_handled = true;
					};
			};
			case (_shift && (playerSide == independent) && (__GETC__(life_depanLevel) > 0)) :
			{
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_depanSirenLights;
					_handled = true;
				};
			};
			default
			{
			};
		};*/
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey) then
		{
			if (!dialog) then {
				PlaySound "unlock_phone";
				[] call life_fnc_p_openMenu;
			} else {
				closeDialog 0;
			};
		};
	};

	//F Key
	case 33:
	{
		//OLD CODE MODIFIED BY SKY -- INCLUSION DEP //
		/*
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirenes Off","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirenes On","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
		*/
		switch(true) do
		{
			case (playerSide == west && (vehicle player) != player && !life_siren_active && ((driver vehicle player) == player)) :
			{
				[] spawn
				{
					life_siren_active = true;
					sleep 4.7;
					life_siren_active = false;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
				if((_veh getVariable "siren")) then
				{
					titleText ["Sirenes Off","PLAIN"];
					_veh setVariable["siren",false,true];
				}
				else
				{
					titleText ["Sirenes On","PLAIN"];
					_veh setVariable["siren",true,true];
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;

					//Zamak Labo - detect
					if ((typeOf _veh) == "B_MRAP_01_F" || (typeOf _veh) == "I_MRAP_03_F" || (typeOf _veh) == "DAR_ImpalaPolice" || (typeOf _veh) == "DAR_TahoePolice" || (typeOf _veh) == "DAR_ExplorerPolice" || (typeOf _veh) == "I_Heli_light_03_unarmed_F") then
					{
						titleText ["Détection zamak Lab","PLAIN"];
						//diag_log "ZAMAK LABO ----- Flic dans Strider -----";
						[] spawn life_fnc_vehDetect; //Zamak Labo: activates detection script when siren is activated.
					};
				};
			};
			case ((playerSide == independent) && (__GETC__(life_medicLevel) > 0) && (vehicle player) != player && !life_siren_active && ((driver vehicle player) == player)) :
			{

				[] spawn
				{
					life_siren_active = true;
					sleep 4.7;
					life_siren_active = false;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
				if((_veh getVariable "siren")) then
				{
					titleText ["Sirenes Off","PLAIN"];
					_veh setVariable["siren",false,true];
				}
				else
				{
					titleText ["Sirenes On","PLAIN"];
					_veh setVariable["siren",true,true];
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
			case ((playerSide == independent) && (__GETC__(life_depanLevel) > 0) && (vehicle player) != player && !life_siren_active && ((driver vehicle player) == player)) :
			{
				[] spawn
				{
					life_siren_active = true;
					sleep 4.7;
					life_siren_active = false;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
				if((_veh getVariable "siren")) then
				{
					titleText ["Sirenes Off","PLAIN"];
					_veh setVariable["siren",false,true];
				}
				else
				{
					titleText ["Sirenes On","PLAIN"];
					_veh setVariable["siren",true,true];
					[[_veh],"life_fnc_depanSiren",nil,true] spawn life_fnc_MP;
				};
			};
			default
			{
			};
		};


	};
	//U Key
	case 22:
	{
		if (isPlayer cursorTarget and cursorTarget isKindOf "Man") exitWith {}; //Komodo: prevent trying to unlock player as they are now in keys list.
		if(!_alt && !_ctrlKey) then {
			//if ((invo_LastLockUnlock + 2) > time) exitWith {hint "Arrête de spammer la touche U";};
			//invo_LastLockUnlock = time;
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 15) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint "Tu n'es pas proche d'une porte!"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat "Tu as fermé la porte.";
					///[[player],"life_fnc_houseSoundClose",true,false] spawn life_fnc_MP;
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat "Tu as ouvert la porte.";
					///[[player],"life_fnc_houseSoundOpen",true,false] spawn life_fnc_MP;
					//ouverture
					};
				};
			}
			else
			{
				if((_veh isKindOf "Ship") OR (_veh isKindOf "Air") OR (_veh isKindOf "LandVehicle")) then
				{
					_locked = locked _veh;
					if(_veh in life_vehicles && player distance _veh < 8) then
					{
						if (_veh getVariable["sabot",false]) exitWith {hint "Ce véhicule a un sabot, tu ne peux pas le déverrouiller.";};
						if(_locked == 2) then
						{
							_veh lock 0;
							[[_veh,0], "life_fnc_lockVehicle",_veh,false,true] spawn life_fnc_MP; //Call instead of spawn function
							[[_veh, "Beep",10],"life_fnc_playSound",true,false] spawn Life_fnc_MP;
							systemChat "Votre vehicule est OUVERT.";
						}
						else
						{
							_veh lock 2;
							[[_veh,2], "life_fnc_lockVehicle",_veh,false,true] spawn life_fnc_MP; //Call instead of spawn function
							[[_veh, "BeepBeep",10],"life_fnc_playSound",true,false] spawn Life_fnc_MP;
							systemChat "Votre vehicule est FERME.";
						};
					};
				}
				else
				{
					if ((nearestObject [player, "Land_i_Shed_Ind_F"]) in invo_prison_reserved_buildings AND (playerSide == west OR (playerSide == civilian AND license_civ_bounty_hunter))) then
					{
						_veh = nearestObject [player, "Land_i_Shed_Ind_F"];
						_door = [_veh] call life_fnc_nearestDoor;
						if(_door == 0) exitWith {hint "Tu n'es pas proche d'une porte!"};
						_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
						if(_locked == 0) then {
							_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
							_veh animate [format["door_%1_rot",_door],0];
							systemChat "Tu as fermé la porte.";
						///[[player],"life_fnc_houseSoundClose",true,false] spawn life_fnc_MP;
						} else {
							_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
							_veh animate [format["door_%1_rot",_door],1];
							systemChat "Tu as ouvert la porte.";
						///[[player],"life_fnc_houseSoundOpen",true,false] spawn life_fnc_MP;
						//ouverture
						};
					};
				};
			};
		};
	};

	//C Key
	case 46:
	{
		//Shift + C = Put the hood / remove the hood
		if (_shift && !_alt && !_ctrlKey) then
		{
			if ( !isNull cursorTarget && (cursorTarget isKindOf "Man") && isPlayer cursorTarget && alive cursorTarget && (cursorTarget distance player < 4) && speed cursorTarget < 1 ) then
			{
				if( !(cursorTarget getVariable "Escorting") && (( cursorTarget getVariable "restrained") || cursorTarget getVariable["playerSurrender",false]/* || (cursorTarget g/riable["AGM_isUnconscious",false])*/ || (animationState cursorTarget) == "Incapacitated"))then				{
					//Check if we have an item
					//N'est pas cagoule, le faire
					if ((cursorTarget getVariable ["INVO_hooded",0]) == 0) then
					{
						if(!([false,"hood",1] call life_fnc_handleInv)) then
						{
							hint "Vous devez avoir l'item Cagoule sur vous - achetable a un magasin rebelle/flic - pour pouvoir cagouler une personne";
						}
						else
						{
							[[player],"life_fnc_hood",vehicle cursortarget,true] spawn life_fnc_MP;

							titleText["Vous avez mis une cagoule sur la tete de cette personne!","PLAIN"];
							_handled = true;
						};

					}
					else	//est cagoule, la lui retirer
					{
						[[player],"life_fnc_unHood",vehicle cursortarget,true] spawn life_fnc_MP;
						titleText["Vous avez retire la cagoule de cette personne!","PLAIN"];
						//give to the player a new hood
						[true,"hood",1] call life_fnc_handleInv;
						_handled = true;
					};
				};
			};
		};
	};

	//FIN // End Key
	case 207:
	{
		if(__GETC__(life_adminlevel) != 0) then {
			//Launch Admin menu
			createDialog "life_admin_tools_main";
		};
	};

	//origin/HOME - Raccourci de destruction rapide
	case 199:
	{
		if(!invo_godmod) exitwith {};
		if(__GETC__(life_adminlevel) != 0) then {
			//Launch Admin menu
			player execVM 'admintools\tools\DestroyIT.sqf';
		};

	};

	//Ctrl + N = Notification Menu
	case 49:
	{
		if (!_shift && !_alt && _ctrlKey) then
		{
			createDialog "invo_notification_main";
		};
	};

	//F5 ESP ON
	case 63:
	{
		if(!invo_godmod) exitwith {};
		if(__GETC__(life_adminlevel) != 0) then {
			//Launch Admin menu
			player execVM 'admintools\tools\ESP.sqf';
		};
	};

	//F6 ESP OFF
	case 64:
	{
		if(!invo_godmod) exitwith {};
		if(__GETC__(life_adminlevel) != 0) then {
			//Launch Admin menu
			player execVM 'admintools\tools\ESPoff.sqf';
		};
	};

	//F8 Suppression objet
	case 66:
	{
		if(!invo_godmod) exitwith {};
		if(__GETC__(life_adminlevel) != 0) then {
			//Launch Admin menu
			player execVM 'admintools\tools\DeleteIT.sqf';
		};
	};

	// O, police gate opener
    case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && ((playerSide == west) OR (playerSide == independent)) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
	};

	//===================================
	//======= CHIFFRES TOP ==============
	//===================================
	
	// SwitchWeapon 1
    case 2:
	{
		if ((primaryWeapon player)!= "") then
		{
			player selectWeapon (primaryWeapon player);
		};
	};
	// SwitchWeapon 2
    case 3:
	{
		if ((handgunWeapon player)!= "") then
		{
			player selectWeapon (handgunWeapon player);
		};
	};
	// SwitchWeapon 3
    case 4:
	{
		if ((secondaryWeapon player)!= "") then
		{
			player selectWeapon (secondaryWeapon player);
		};
	};
	//Touche 4
	case 5:
	{
		if((playerSide == west) OR ((playerSide == civilian) AND (license_civ_bounty_hunter))) then
		{
			[] call life_fnc_p_openMenu;
			[] call life_fnc_wantedMenu;
		};
		if (( vehicle player != player ) && (playerSide == independent) && (__GETC__(life_medicLevel) > 0) && !(player getVariable["isHorn",false])) then {[2.5,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"AirhornEMT",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
	};
	//Touche 5
	case 6:
	{
		if(playerSide == west) then { hint parseText format["<t color='#3366CC'><t size='2'>Tableau des amendes</t></t><br/><br/><br/>-Tentative vol vehicule : 20 000<br/>-Vols vehicules: 2x prix vehicule ou 50 000<br/>-Exces vitesse: 200 par km/h supp. Si +50km/h: Sabot + Amende + Retrait Permis<br/>-Stationnement genant : 2000<br/>-Phares eteint nuit : 1000, Sabot si cassés<br/>-Conduite dangeureuse : 5000<br/>-Arme levee: 5000<br/>-Attaque de banque : 300 000<br/>-Conduite sans permis : 20 000 voitures, 50 000 camions, 60 000 helicos<br/>-Objets rebelles: 70 000<br/>-Refus amende: <t color='#FF0000'>30m prison</t>",_name];};
		if (( vehicle player != player ) && (playerSide == independent) && (__GETC__(life_medicLevel) > 0) && !(player getVariable["isHorn",false])) then {[2.5,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"Whelen_HowlerEMT",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
	};
	//Touche 6
	case 7:
	{
		if(playerSide == west) then { hint parseText format["<t color='#3366CC'><t size='2'>Tableau des amendes 2</t></t><br/><br/><br/>-Delit fuite: 20 000<br/>-Drogues: Prix cargaison + 30% de la cargaison + Sabot<br/>-Vol personne: 2x prix vol ou 40 000<br/>-Tentative meurtre: 30 000 (civils), 100 000 (agents)<br/>-Prise d'otage: 100 000 par otage<br/>-Homicide sur agent de la milice : <t color='#FF0000'>30m prison</t><br/>-Meurtres: 50 000 par meurtres (vehicule ou arme)",_name];};
		if (( vehicle player != player ) && (playerSide == independent) && (__GETC__(life_medicLevel) > 0) && !(player getVariable["isHorn",false])) then {[2.5,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"Whelen_ManualEMT",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
	};
	//Touche 7
	case 8:
	{
		if (( vehicle player != player ) && (playerSide == west) && !(player getVariable["isHorn",false])) then {[2.5,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"SirenHorn",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
		if (( vehicle player != player ) && (playerSide == independent) && (__GETC__(life_medicLevel) > 0) && !(player getVariable["isHorn",false])) then {[2.5,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"Whelen_TakedownEMT",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
	};
	//Touche 8
	case 9:
	{
		if (( vehicle player != player ) && (playerSide == west) && !(player getVariable["isHorn",false])) then {[4,"isHorn"] spawn life_fnc_waitSound;[[vehicle player,"SirenTrack",20000],"life_fnc_playSound",nil,true] spawn life_fnc_MP;};
	};
	//touche 10 Casque antibruit
	case 10:
	{
		if ((invo_SpamAntibruit + 2) > time) exitWith {hint "Arrête de spammer la touche";};
		invo_SpamAntibruit = time;

		if (soundVolume != 1) then
        {
			1 fadeSound 1;
			titleText ["Casque anti-bruit desactive.", "PLAIN"];
        }
        else
        {
			1 fadeSound 0.1;
			titleText ["Casque anti-bruit active.", "PLAIN"];
        };
	};

};

_handled;