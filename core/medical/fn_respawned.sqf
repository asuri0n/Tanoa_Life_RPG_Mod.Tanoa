/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_liquide = 0; //Make sure we don't get our cash back.
life_liquide_before = 0;
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

systemChat "test2";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		[] call life_fnc_copDefault;
	};
	case civilian: {
		[] call life_fnc_civFetchGear;
	};
	case east: {
		[] call life_fnc_civFetchGear;
	};
	case independent: {
		[] call life_fnc_medicLoadout;
	};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[player,life_copRecieve,true] call INVO_fnc_wantedBounty;
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[getPlayerUID player] call INVO_fnc_wantedRemove;
};

[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.
