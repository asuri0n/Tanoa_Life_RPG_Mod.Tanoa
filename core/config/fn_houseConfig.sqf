/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for buyable houses?
*/
private["_house"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(_house == "") exitWith {[]};

/*
	Return Format:
	[price,# of containers allowed]
*/
switch (true) do {
	case (_house == "Land_Shed_02_F"): {[500000,1]};
	case (_house == "Land_Shed_05_F"): {[600000,1]};
	case (_house == "Land_Slum_01_F"): {[700000,1]};
	case (_house == "Land_GarageShelter_01_F"): {[800000,1]};
	case (_house == "Land_Slum_03_F"): {[1000000,2]};
	case (_house == "Land_House_Small_02_F"): {[1000000,2]};
	case (_house == "Land_House_Small_03_F"): {[1100000,2]};
	case (_house == "Land_House_Small_05_F"): {[1200000,2]};
	case (_house == "Land_House_Small_06_F"): {[1300000,2]};
	case (_house == "Land_House_Small_04_F"): {[1400000,2]};
	case (_house == "Land_House_Big_01_F"): {[1500000,2]};
	case (_house == "Land_Addon_04_F"): {[1500000,3]};
	case (_house == "Land_House_Big_02_F"): {[1750000,3]};
	case (_house == "Land_House_Big_04_F"): {[2000000,4]};
	case (_house == "Land_House_Big_03_F"): {[2500000,4]};
	case (_house == "Land_Hotel_02_F"): {[4000000,5]};
	case (_house == "Land_Hotel_01_F"): {[5000000,6]};
	case (_house == "Land_FuelStation_02_workshop_F"): {[500000,1]};
	case (_house == "Land_FuelStation_01_shop_F"): {[750000,2]};
	case (_house == "Land_School_01_F"): {[1000000,3]};
	case (_house == "Land_Supermarket_01_F"): {[1500000,4]};
	case (_house == "Land_Shop_Town_01_F"): {[2500000,1]};
	case (_house == "Land_Shop_Town_03_F"): {[3000000,3]};
	case (_house == "Land_i_Shed_Ind_F"): {[3500000,6]};

	case (_house == "Land_SM_01_shed_F"): {[3500000,6]};
	default {[]};
};