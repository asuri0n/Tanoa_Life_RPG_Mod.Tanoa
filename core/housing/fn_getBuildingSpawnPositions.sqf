/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
*/
private["_building","_arr"];
_building = _this select 0;
_arr = [];

_arr = switch(typeOf _building) do
{
case "Land_i_House_Big_02_V1_F": {[1,8]};
case "Land_i_House_Big_02_V2_F": {[1,8]};
case "Land_i_House_Big_02_V3_F": {[1,8]};
case "Land_i_House_Big_01_V1_F": {[2,3]};
case "Land_i_House_Big_01_V2_F": {[2,3]};
case "Land_i_House_Big_01_V3_F": {[2,3]};
case "Land_i_Garage_V1_F": {[2]};
case "Land_i_Garage_V2_F": {[2]};
case "Land_i_House_Small_01_V1_F": {[2]};
case "Land_i_House_Small_01_V2_F": {[2]};
case "Land_i_House_Small_01_V3_F": {[2]};
case "Land_i_House_Small_03_V1_F": {[4]};
case "Land_i_Stone_House_Small_V1_F": {[2,3]};
case "Land_i_Stone_House_Small_V2_F": {[2,3]};
case "Land_i_Stone_House_Small_V3_F": {[2,3]};
default {[]};
};

_arr;