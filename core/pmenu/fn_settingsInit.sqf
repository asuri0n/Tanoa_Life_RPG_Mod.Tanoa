/*
	File: fn_settingsInit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes key parts for the Settings menu for View distance and other stuff.
*/
tawvd_foot = profileNamespace getVariable ["tawvd_foot", viewDistance];
tawvd_car = profileNamespace getVariable ["tawvd_car", viewDistance];
tawvd_air = profileNamespace getVariable ["tawvd_air", viewDistance];
tawvd_addon_disable = true;
invo_sound_dim_car = profileNamespace getVariable ["invo_sound_dim_car", 0];
invo_sound_dim_air = profileNamespace getVariable ["invo_sound_dim_air", 0];
invo_sound_dim_sea = profileNamespace getVariable ["invo_sound_dim_sea", 0];

invo_play_intro = profileNamespace getVariable ["invo_play_intro", true];
life_revealObjects = profileNamespace getVariable ["life_revealObjects", true];

[] spawn
{
	private["_recorded"];
	while {true} do
	{
		_recorded = vehicle player;
		sleep 2.2;
		if(vehicle player != _recorded OR !alive player) then {
			[] call life_fnc_updateViewDistance;
		};
	};
};
