/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Locks up the entire house and closes all doors.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if (life_action_inUse) exitWith {hint "Arrête de spammer!";};
life_action_inUse = true;

_numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(_numberOfDoors == -1 OR _numberOfDoors == 0) exitWith {}; //MEH

titleText ["Verrouillage de la maison...","PLAIN"];
sleep 3;

for "_i" from 1 to _numberOfDoors do {
	_house animate[format["door_%1_rot",_i],0];
	_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
};

[_house] call life_fnc_lockHouse; //Komodo: allows to make containers popup, and to fill in the trunk if players hasn't use the house.
sleep 3;
titleText["La maison a été verrouillé.","PLAIN"];

life_action_inUse = false;
