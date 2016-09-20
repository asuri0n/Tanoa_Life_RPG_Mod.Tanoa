/*
Script created by jacob88
http://forums.bistudio.com/member.php?118253-jacob88
This script is released on a do as you wish basis
with credit to me (jacob88) as author of the script,
more specifically this script is released under (APL) see link
http://www.bistudio.com/community/licenses/arma-public-license

To Use:
- Option 1
	- To use via addAction add the following to players init
		-
		  "Start_addAction" execVM "Speed_Limiter.sqf";

- Option 2
	- To use via KeyPress add the following to players init
		- 
		  "Start_KeyPress" execVM "Speed_Limiter.sqf";

	- The key pressed by default is 29 or (left CTRL), you can change the key by changing this number to a different dik code
		- You can find a list of dik codes at the below link
		- https://community.bistudio.com/wiki/ListOfKeyCodes
*/

//If using script by KeyPress change this to the dik code of the key you wish to use
_Key = 29;



//Main Script Starts

if (_this == "Start_addAction") exitWith {player addAction ["Speed Limiter (ON)", {execVM "Speed_Limiter.sqf";}, "", 1.5, false, true, "", '(((vehicle player) in vehicles) && (((vehicle player) isKindOf "LandVehicle") or ((vehicle player) isKindOf "Ship")) && ((assignedDriver (vehicle player)) == player) && (isNil "SPEED_LIMITER"))']; player addAction ["Speed Limiter (OFF)", {execVM "Speed_Limiter.sqf";}, "", 1.5, false, true, "", '(((vehicle player) in vehicles) && (((vehicle player) isKindOf "LandVehicle") or ((vehicle player) isKindOf "Ship")) && ((assignedDriver (vehicle player)) == player) && !(isNil "SPEED_LIMITER"))'];};
if (_this == "Start_KeyPress") exitWith {waitUntil{!(isNull (findDisplay 46))}; call compile format ["(findDisplay 46) displayAddEventHandler [""KeyUp"", {if ((_this select 1) == %1) then {execVM ""Speed_Limiter.sqf"";}}];", _Key];};
if !((vehicle player) in vehicles) exitWith {};
if !(((vehicle player) isKindOf "LandVehicle") or ((vehicle player) isKindOf "Ship")) exitWith {};
if ((assignedDriver (vehicle player)) != player) exitWith {};

if (isNil "SPEED_LIMITER") then
{
SPEED_LIMITER = true;
_vehicle = (vehicle player);
_speedlimit = ((sin (direction _vehicle) * ((velocity _vehicle) select 0)) + (cos (direction _vehicle) * ((velocity _vehicle) select 1)) + ((velocity _vehicle) select 2));
while{(!(isNil "SPEED_LIMITER") && ((vehicle player) == _vehicle) && ((assignedDriver _vehicle) == player) && (alive (vehicle player)) && (alive player))}do
	{
	waitUntil{(((sin (direction _vehicle) * ((velocity _vehicle) select 0)) + (cos (direction _vehicle) * ((velocity _vehicle) select 1)) + ((velocity _vehicle) select 2)) > _speedlimit)};
	_vehicle setVelocity [(sin (direction _vehicle) * _speedlimit),(cos (direction _vehicle) * _speedlimit), ((velocity _vehicle) select 2)];
	sleep 0.01;
	};
	SPEED_LIMITER = nil;
};

if !(isNil "SPEED_LIMITER") then
{
SPEED_LIMITER = nil;
};