/*
	Filename: fn_changeInVehicleGarage.sqf
	Author: Komodo

	Description:
	Function that sets variables telling the client if it's required to send a new garage query to the server or if he can use the last stored one.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;

switch (true) do
{
    case (_type == "Car"): {invo_garage_change_car = true;};
    case (_type == "Air"): {invo_garage_change_air = true;};
    case (_type == "Ship"): {invo_garage_change_ship = true;};
    default
    {
    	invo_garage_change_car = true;
    	invo_garage_change_air = true;
    	invo_garage_change_ship = true;
	};
};