/*
	Author: Bryan "Tonic" Boardwine
	Filename: fn_getBuildingPositions.sqf

	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
*/
private["_building","_arr","_restricted","_exitLoop","_i"];
_building = _this select 0;
_arr = [];

_restricted = switch(typeOf _building) do {
	case "Land_Shed_02_F": {[]}; //Possibilité 5 coffres
	case "Land_Shed_05_F": {[]}; //Possibilité 6 coffres
	case "Land_Slum_01_F": {[1]}; //Possibilité 7 coffres
	case "Land_GarageShelter_01_F": {[1,2,3,6]}; //Posibilité 3 coffres
	case "Land_Slum_03_F": {[1,3,4,5,7,14,17,18,21,22,23,24,25]}; //Possibilité 13 coffres
	case "Land_House_Small_02_F": {[4]}; //Possibilité 8 Coffres
	case "Land_House_Small_03_F": {[4]}; //Possibilité 9 coffres
	case "Land_House_Small_05_F": {[4,5]}; //Possibilité 4 coffres
	case "Land_House_Small_06_F": {[0,1,5,7,8]}; //Possibilité 4 coffres
	case "Land_House_Small_04_F": {[0,1,5,6]}; //Possibilité 3 coffres
	case "Land_House_Big_01_F": {[1,7,8,9,10,11,12]}; //Possibilité 6 coffres
	case "Land_Addon_04_F": {[1,3,10,11,12,13,14,15,16,17]}; //Possibilité 8 Coffres
	case "Land_House_Big_02_F": {[0,1,2,6,7,9,10,11,12,13]}; //Possibilité 4 coffres
	case "Land_House_Big_04_F": {[0,5,6,7,8,9,10,11,12,19,20,21,22,23]}; //Possibilité 9 coffres
	case "Land_House_Big_03_F": {[0,2,3,6,7,8,9,12,13,14,15,18,19,20,21]}; //Possibilité 6 coffres
	case "Land_Hotel_02_F": {[0,1,2,3,4,5,7,8,9,10,11,12,14,16,17,18,19,20,21,22,25,28,30]}; //Possibilités 8 coffres
	case "Land_Hotel_01_F": {[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]}; // Possibilités 4 Coffres 
	case "Land_FuelStation_02_workshop_F": {[4,5,6]}; //Possibilité 3 coffres
	case "Land_FuelStation_01_shop_F": {[2]}; //Possibilité 7 coffres
	case "Land_School_01_F": {[0,2,5,9,11,15]}; //Possibilité 15 coffres
	case "Land_Supermarket_01_F": {[6,7,8,9,10,11,12,13,14,15]}; //Possibilité 7 coffres
	case "Land_Shop_Town_01_F": {[3,4,5,6,8,9]}; //Possibilité 6 coffres
	case "Land_Shop_Town_03_F": {[3,4,5,6,7,8,10,14,15,18]}; //Possibilité 11 coffres
	case "Land_SM_01_shed_F": {[0,1,4,9]}; //Possibilité 6 coffres
	case "Land_i_Shed_Ind_F": {[0,1,4,9]}; //Possibilité 6 coffres	
default {[]};
}; 

_i = 0;
_exitLoop = false; //Loops are not fun.
while {true} do {
	if(!(_i in _restricted)) then {
	_pos = _building buildingPos _i;
	if(_pos isEqualTo [0,0,0]) exitWith {_exitLoop = true;};
	_arr pushBack _pos;
	};
	if(_exitLoop) exitWith {};
	_i = _i + 1;
};

_arr;
