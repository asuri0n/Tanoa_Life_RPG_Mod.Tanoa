/*
	File: fn_updateViewDistance.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance tawvd_foot; 1 fadeSound 1;};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance tawvd_car; 1 fadeSound (1 - (invo_sound_dim_car / 100));};
	case ((vehicle player) isKindOf "Air"): {setViewDistance tawvd_air; 1 fadeSound (1 - (invo_sound_dim_air / 100));};
	case ((vehicle player) isKindOf "Ship"): {1 fadeSound (1 - (invo_sound_dim_sea / 100));};
};