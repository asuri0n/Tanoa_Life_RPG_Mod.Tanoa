/*
	Filename: fn_vehicleUsageCost.sqf
	Author: Komodo

	Description: handles hourly cost of required vehicles.
	
	["B_Heli_Light_01_F",60000],
	["PMC_MH9",60000],
	["C_Heli_Light_01_civil_F",60000],
	["O_Heli_Light_02_unarmed_F",90000],
	["GNT_C185F",600],
	["GNT_C185",600],
	["O_Heli_Transport_04_covered_F",120000],
	["O_Heli_Transport_04_box_F",120000],
	["I_Heli_Transport_02_F",180000]
	
*/
private ["_veh","_cost","_vehIndex","_crew"];

invo_vehicle_costPerHour_list = [
	["B_Heli_Light_01_F",0],
	["PMC_MH9",0],
	["C_Heli_Light_01_civil_F",0],
	["O_Heli_Light_02_unarmed_F",0],
	["GNT_C185F",0],
	["GNT_C185",0],
	["O_Heli_Transport_04_covered_F",0],
	["O_Heli_Transport_04_box_F",0],
	["I_Heli_Transport_02_F",0]
];


_oldVeh = vehicle player;
_veh = vehicle player;

while {true} do
{
	sleep 10;
	_veh = vehicle player;

	if (_veh != player) then		//Launch here scripts that you need to launch when you go into a new vehicle !
	{
		_vehIndex = [(typeOf _veh), invo_vehicle_costPerHour_list] call life_fnc_index;
		if (_vehIndex > -1) then
		{
			if (((assignedVehicleRole player) select 0) in ["driver","Turret"]) then
			{
				_crew = {if (_x != player) then {((assignedVehicleRole player) select 0) in ["driver","Turret"];};} count (crew _veh);
				//diag_log "INVO_DEBUG - vehicleUsageCost - getInVehicleWithCost";
				if (_crew == 0) then
				{
					//Alone in pilot position
					_cost = round (((invo_vehicle_costPerHour_list select _vehIndex) select 1) / 60 / 6);
					life_dabliquide = life_dabliquide - _cost;
					["vehicleUsageCost", true, -1 * _cost] call life_fnc_antiCheatCash;
				}
				else
				{
					//Someone else is here, only the pilot pays.
					if (assignedVehicleRole player == ["driver"]) then
					{
						_cost = round (((invo_vehicle_costPerHour_list select _vehIndex) select 1) / 60 / 6);
						life_dabliquide = life_dabliquide - _cost;
						["vehicleUsageCost", true, -1 * _cost] call life_fnc_antiCheatCash;
					};
				};
			};
		};
	};
};