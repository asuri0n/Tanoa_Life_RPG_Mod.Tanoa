/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine edit by Kriss

	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units","_groupMembers"];
_markers = [];
_markersGroup = [];
_groupMembers = [];
_units = [];

sleep 0.25;
if(visibleMap) then {
	//Group markers
	{if((side _x == side player) && group _x == group player ) then {_groupMembers pushBack _x;}} foreach playableUnits; //Fetch list of groupMembers

	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		if(!isNil "_name" && !_down) then {
			_units pushBack _x;
		};
	} foreach allDeadMen;

	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_markers pushBack _marker;
	} foreach _units;

	//Create markers for the group
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];

		_markersGroup pushBack [_marker,_x];
	} foreach _groupMembers;

	//move group markers
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markersGroup;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
	{deleteMarkerLocal (_x select 0);} foreach _markersGroup;
	_markers = [];
	_groupMembers = [];
};