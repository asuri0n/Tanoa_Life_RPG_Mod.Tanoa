/*
	File: initServer.sqf

	Description:
	Starts the initialization of the server.
*/
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";

[8,true,12] execFSM "core\fsm\timeModule.fsm";
execFSM "core\fsm\server.fsm"; //Komodo: added for market logging system.