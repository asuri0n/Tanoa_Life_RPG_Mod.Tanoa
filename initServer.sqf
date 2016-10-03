/*
	File: initServer.sqf

	Description:
	Starts the initialization of the server.
*/
if(!(_this select 0)) exitWith {}; //Not server

[] spawn {
	private["_pos","_pumps"];

	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	life_pumps = nearestobjects [_pos,["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F"], 8500];
	{
		_x enableSimulationGlobal false;
	} foreach life_pumps;
	publicVariable "life_pumps";
};

[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";

[8,true,12] execFSM "core\fsm\timeModule.fsm";
execFSM "core\fsm\server.fsm"; //Komodo: added for market logging system.