/*
	Filename: fn_setupEVH.sqf
	Master eventhandler file
*/
//player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["Killed", {_this spawn life_fnc_onDeath}];

/* player removeAllEventHandlers "handleDamage"; */
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];

/* AGM */
//[player, "AGM_wokeUp", {[_this select 0] call INVO_fnc_AGM_wokeUp;}] call AGM_Core_fnc_addCustomEventHandler;
//[player, "AGM_knockedOut", {[_this select 0] spawn INVO_fnc_AGM_knockOut;}] call AGM_Core_fnc_addCustomEventHandler;
//player addEventHandler["handleDamage",{_this call INVO_fnc_AGM_handleDamage;}];

//player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn;player enableFatigue false}];
player addEventHandler["Respawn", {_this call life_fnc_onRespawn;player enableFatigue false}];

player addEventHandler["Put",{[1] call SOCK_fnc_updateRequestCivGear}]; //Bam, sync dans ta face même si tu tire ton cable.
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["InventoryClosed", {_this spawn life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};

//Komodo: adding this to minimize call to local functions for alliances
"invo_alliances" addPublicVariableEventHandler {[] spawn life_fnc_updateInvoAllies;};
//if (license_civ_busDriver) then {[] spawn life_fnc_getIn;};

//Komodo: d?sactive la vue tactique. A tester.
dokeyCheck = {
	private ["_r"] ;
	_r = false ;
	if ((_this select 1) in (actionKeys "TacticalView")) then {hint "La vue tactique est desactivee pour le bien de tous." ;_r=true;};
	_r;
};
(FindDisplay 46) displaySetEventHandler ["keydown", "_this call dokeyCheck"];

//diag_log "Passage dans setupEVH";