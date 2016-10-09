/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("icons\items\marijuana.paa")};
	case "life_inv_apple": {("icons\items\apple.paa")};
	case "life_inv_rabbit": {("icons\items\meat.paa")};
	case "life_inv_salema": {("icons\items\fish.paa")};
	case "life_inv_ornate": {("icons\items\fish.paa")};
	case "life_inv_mackerel": {("icons\items\fish.paa")};
	case "life_inv_tuna": {("icons\items\fish.paa")};
	case "life_inv_mullet": {("icons\items\fish.paa")};
	case "life_inv_catshark": {("icons\items\fish.paa")};
	case "life_inv_turtle": {("icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("icons\items\fishingpoles.paa")};
	case "life_inv_water": {("icons\items\water.paa")};
	case "life_inv_coffee": {("icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("icons\items\donut.paa")};
	case "life_inv_fuelE": {("icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("icons\items\iron.paa")};
	case "life_inv_copperr": {("icons\items\copper.paa")};
	case "life_inv_sand": {("icons\items\sand.paa")};
	case "life_inv_salt": {("icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("icons\items\salt.paa")};
	case "life_inv_glass": {("icons\items\glass.paa")};
	case "life_inv_diamond": {("icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("icons\items\diamond.paa")};
	case "life_inv_tbacon": {("icons\items\meat.paa")};
	case "life_inv_redgull": {("icons\items\redgull.paa")};
	case "life_inv_lockpick": {("icons\items\lockpick.paa")};
	case "life_inv_peach": {("icons\items\peach.paa")};
	case "life_inv_coke": {("icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("icons\items\spikestrip.paa")};
	case "life_inv_rock": {("icons\items\rock.paa")};
	case "life_inv_cement": {("icons\items\cement.paa")};
	case "life_inv_goldbar": {("icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("icons\items\storagebig.paa")};
	case "life_inv_bottles": {("icons\items\bouteille_verre.paa")};
	case "life_inv_ziptie": {("icons\items\handcuff.paa")};
	case "life_inv_machete": {("icons\items\machette.paa")};
	case "life_inv_cornmeal": {("icons\items\mais.paa")};
	case "life_inv_barriere": {("icons\items\barriere.paa")};
	case "life_inv_bottledbeer": {("icons\items\bierre.paa")};
	case "life_inv_hood": {("icons\items\cagoule.paa")};
	case "life_inv_barriereStop": {("icons\items\stop.paa")};
	case "life_inv_bottledwhiskey": {("icons\items\whisky.paa")};
	case "life_inv_puranium": {("icons\items\water.paa")};
	case "life_inv_ipuranium": {("icons\items\water.paa")};
	case "life_inv_fishp": {("icons\items\fish.paa")};
	case "life_inv_boisp": {("icons\items\bois.paa")};
	case "life_inv_sandp": {("icons\items\sand.paa")};
	case "life_inv_glassp": {("icons\items\glass.paa")};
	case "life_inv_laitp": {("icons\items\lait.paa")};
	case "life_inv_caoutchoucp": {("icons\items\caoutchouc.paa")};
	case "life_inv_linp": {("icons\items\lin.paa")};
	case "life_inv_tissup": {("icons\items\tissu.paa")};
	case "life_inv_charbonp": {("icons\items\charbon.paa")};
	case "life_inv_poudrenoirp": {("icons\items\poudre_noir.paa")};
	case "life_inv_cocainp": {("icons\items\cocain_unprocessed.paa")};
	case "life_inv_cocainpurp": {("icons\items\cocain_unprocessed.paa")};
	case "life_inv_heroinpy": {("icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinpurp": {("icons\items\heroin_unprocessed.paa")};
	case "life_inv_marip": {("icons\items\marijuana.paa")};
	case "life_inv_maripurp": {("icons\items\marijuana.paa")};
	case "life_inv_uraniump1": {("icons\items\uranium.paa")};
	case "life_inv_uraniump2": {("icons\items\uranium.paa")};
	case "life_inv_uraniump3": {("icons\items\uranium.paa")};
	case "life_inv_uraniump4": {("icons\items\uranium.paa")};
	case "life_inv_uraniumpurp": {("icons\items\uranium.paa")};
	case "life_inv_rockp": {("icons\items\rock.paa")};
	case "life_inv_rocktaillep": {("icons\items\rocktaillee.paa")};
	case "life_inv_copperorep": {("icons\items\copper_ore.paa")};
	case "life_inv_briquep": {("icons\items\sac.paa")};
	case "life_inv_goldp": {("icons\items\gold.paa")};
	case "life_inv_goldbarp": {("icons\items\goldbar.paa")};
	case "life_inv_ironorep": {("icons\items\iron_ore.paa")};
	case "life_inv_ironp": {("icons\items\iron.paa")};
	case "life_inv_diamantp": {("icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamantpurp": {("icons\items\diamond.paa")};
	case "life_inv_oilpy": {("icons\items\oil_unprocessed.paa")};
	case "life_inv_plastiquep": {("icons\items\plastique.paa")};
	case "life_inv_calcairep": {("icons\items\salt_unprocessed.paa")};
	case "life_inv_cimentp": {("icons\items\cement.paa")};
	case "life_inv_planchep": {("icons\items\bois.paa")};
	case "life_inv_ossillp": {("icons\items\skull.paa")};
	case "life_inv_osslp": {("icons\items\skull.paa")};
	case "life_inv_clayp": {("icons\items\copper_ore.paa")};
	default {("icons\items\default.paa")};
};