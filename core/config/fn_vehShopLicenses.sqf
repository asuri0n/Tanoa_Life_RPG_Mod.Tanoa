/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.

	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_car": {_ret = true;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_airhq": {_ret = license_cop_air;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "reb_air": {_ret = license_civ_rebel;};
	case "depan_car": {_ret = true;};
	case "depan_air": {_ret = true;};
	case "dep": {_ret = true;};
	case "civ_luxe": {_ret = true;};
	case "cop_car": {_ret = true;};
	case "cop_ship": {_ret = true;};
	case "donateur": {_ret = true;};
	case "gang_car": {_ret = license_civ_gangster;};
	case "bac_car": {_ret = license_cop_bac;}; //Ajout bac johnny
	case "hunter_car": {_ret = license_civ_bounty_hunter;}; //Ajout bac johnny
	case "xxx_car": {_ret = license_civ_xxx;}; //Ajout bac johnny
	case "xxx_air": {_ret = license_civ_xxx;}; //Ajout bac johnny
	case "wt_car": {_ret = license_civ_wt;}; //Ajout bac johnny
	case "wt_air": {_ret = license_civ_wt;}; //Ajout bac johnny
	case "ef_air": {_ret = license_civ_ef;}; //Ajout bac johnny
	case "transport_car": {_ret = license_civ_busDriver;}; //Ajout bac johnny
	case "umb_car": {_ret = license_civ_umb;}; //Ajout bac johnny
};

_ret;