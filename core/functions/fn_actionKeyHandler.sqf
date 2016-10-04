#include <macro.h>
#include "..\..\script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_barrieres","_cones"];
_curTarget = cursorTarget;

if (life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);

if (LIFE_SETTINGS(getNumber,"global_ATM") isEqualTo 1) then{
    //Check if the player is near an ATM.
    if (((["atm_",str(cursorObject)] call BIS_fnc_inString) && player distance (cursorObject) < 2.3) && {!dialog}) exitWith {
        [] call life_fnc_atmMenu;
    };
};

if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	};
	if (((__GETC__(life_depanLevel) > 0) AND (playerSide == independent)) OR ((__GETC__(life_coplevel) > 0) AND (playerSide == west))) then {
		_barrieres = nearestObjects[getPos player,["RoadBarrier_F"],3] select 0;
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3] select 0;
		if(!(isNil "_barrieres")) then {[] call life_fnc_packupBarriere;};
		if(!(isNil "_cones")) then {[] call life_fnc_packupConewithlight;};
	};
};

if((_curTarget isKindOf "House_F" && {player distance _curTarget < 12}) OR (((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget) OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;
/*player setVariable ["AGM_canTreat", false, true];*/

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
	/*player setVariable ["AGM_canTreat", true, true];*/

};

//If target is a VR_object
if( _curTarget getVariable ["INVO_VRObject",0] == 1) then
{
	_id = 0;
	_type = 0;
	_grade = 0;

	switch(true) do
	{
		case (__GETC__(life_medicLevel) > 0) :			//1
		{
			_type = 1;
		};
		case (__GETC__(life_depanLevel) > 0) :			//2
		{
			_type = 2;
		};
		case (__GETC__(life_coplevel) > 0) :			//2
		{
			_type = 3;
			_grade = __GETC__(life_coplevel);
		};
	};
	_params = [_curTarget,player,_id,[_type,__GETC__(life_donator),0,_grade]];	// [[type of player ( cop, civilian, depan, med...),donat lvl,reduction lvl]}
	_params spawn INVO_fnc_VRsetCrateContent;
};

//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	/*if((_curTarget getVariable["restrained",false]) && !dialog && playerSide == west) then {
		[_curTarget] call life_fnc_copInteractionMenu;
	};*/
	if(((_curTarget getVariable["restrained",false]) || (_curTarget getVariable["civrestrained",false]))  && !dialog) then {
		//AJOUT SKY LE 10/08/2014 pour rajouter les actions médic
		if((playerSide in [west,independent]) || (__GETC__(life_adminlevel) != 0)) then {
			[_curTarget] call life_fnc_copInteractionMenu;
		}
		else
		{
			//only if the player is not unconscious
            if(player getvariable["FAR_isUnconscious",0] == 1) then {
                //ok then it's a civilian so we draw windows for civilians
                [_curTarget] call life_fnc_civInteractionMenu;
            };
		};
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";

	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				sleep(random(3)); //Komodo: anti dupli...
				_handle = [_curTarget] spawn life_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					sleep(random(3)); //Komodo: anti dupli...
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn life_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
};