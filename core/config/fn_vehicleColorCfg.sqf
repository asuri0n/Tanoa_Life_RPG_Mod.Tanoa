/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["textures\vehicules\civ\Hayon_Monster.paa","civ"],
			["textures\vehicules\civ\Hayon_Nature.paa","civ"],
			["textures\vehicules\civ\Hayon_Night.paa","civ"],
			["textures\vehicules\civ\Hayon_youtube.paa","civ"],
			["textures\vehicules\civ\Hayon_Poly.paa","civ"],
			["textures\vehicules\smt\HAYONSMT.paa","med"]
		];
	};

	case "B_MRAP_01_F":
	{
		_ret =
		[
			["textures\vehicules\cop\Milice_Hunter.paa","cop","textures\vehicules\cop\hunter.paa"]
		];
	};

	case "C_Offroad_01_F":
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["textures\vehicules\civ\Offroad_Cyan.paa","civ"],
			["textures\vehicules\emt\Dep_Offroad.paa","med"],
			["textures\vehicules\smt\OFFROADSMT.paa","med"],
			["textures\vehicules\cop\offroad.paa","cop"]
		];
	};

 	case "O_Truck_02_Ammo_F":
	{
 		_ret =
 		[
 			["textures\vehicules\reb\Zamaklab_Jaune_1.paa","reb","textures\vehicules\reb\Zamaklab_Jaune_2.paa","textures\vehicules\reb\Zamaklab_Jaune_3.paa"],
 			["\A3\soft_f_epc\Truck_03\Data\truck_03_ammo_co.paa","reb"]
 		];
 	};

 	case "B_Truck_01_mover_F":
	{
 		_ret =
 		[
 			["textures\vehicules\emt\Dep_HEMTT_1.paa","med","textures\vehicules\emt\Dep_HEMTT_2.paa"]
 		];
 	};

 	case "O_Heli_Transport_04_box_F":
	{
 		_ret =
 		[
 			["\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","civ","\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa"],
			["\a3\Air_F_Heli\Heli_Transport_04\Scripts\Heli_Transport_04_pods_camo.sqf","reb"]
 		];
 	};

 	case "O_Heli_Transport_04_covered_F":
	{
 		_ret =
 		[
 			["\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","civ","\a3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa"],
 			["\a3\Air_F_Heli\Heli_Transport_04\Scripts\Heli_Transport_04_pods_camo.sqf","reb"]
 		];
 	};

 	case "O_Heli_Transport_04_medevac_F":
	{
 		_ret =
 		[
 			["\a3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_pods_black.sqf","med"]
 		];
 	};

 	case "O_Heli_Transport_04_F":
	{
 		_ret =
 		[
 			["\a3\Air_F_Heli\Heli_Transport_04\Scripts\Heli_Transport_04_basic_black.sqf","med"]
 		];
 	};

 	case "O_Heli_Transport_04_repair_F":
	{
 		_ret =
 		[
 			["\a3\Air_F_Heli\Heli_Transport_04\Scripts\Heli_Transport_04_pods_black.sqf","med"]
 		];
 	};

	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			//["textures\vehicules\cop\Milice_Hellcat.paa","cop"]
		];
	};

	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\vehicules\civ\SUV_taxi.paa","civ"],
			["textures\vehicules\smt\SUVSMT.paa","med"],
			["textures\vehicules\civ\SUV_kitty.paa","civ"],
			["textures\vehicules\civ\SUV_fast.paa","civ"],
			["textures\vehicules\civ\SUV_camo.paa","civ"],
			["textures\vehicules\staff\suv_staff_black.paa","fed"],
			["textures\vehicules\civ\SUV_ferrari.paa","civ"],
			["textures\vehicules\civ\SUV_Cube.paa","civ"],
			["textures\vehicules\civ\SUV_donut.paa","civ"],
			["textures\vehicules\civ\SUV_homer.paa","civ"],
			["textures\vehicules\civ\SUV_poly.paa","civ"],
			["textures\vehicules\civ\SUV_bfm.paa","civ"],
			["textures\vehicules\reb\SUV_camo.paa","reb"],
			["textures\vehicules\civ\SUV_noir.paa","civ"],
			["textures\vehicules\civ\SUV_vert.paa","civ"]
		];
	};

	case "C_Van_01_box_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\vehicules\smt\CAMION2CAISSE.paa","med","textures\vehicules\smt\CAMIONCAISSE.paa"]
		];
	};

	case "C_Van_01_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "B_Quadbike_01_F":
	{
		_ret =
		[
			["textures\vehicules\cop\quad.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"],
			["textures\vehicules\smt\QUADSMT.paa","med"]
		];
	};

	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["textures\vehicules\cop\bird.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"], //Index 10
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["textures\vehicules\reb\Bird_1.paa","reb"],
			["textures\vehicules\reb\Bird_2.paa","reb"],
			["textures\vehicules\emt\Med_Bird.paa","med"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			["textures\vehicules\emt\Dep_Bird.paa","med"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","bac"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","bac"],
			["textures\vehicules\reb\Bird_2.paa","bac"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","civ"],
			["textures\vehicules\civ\Bird_cookie.paa","civ"],
			["textures\vehicules\civ\Bird_hawai.paa","civ"],
			["textures\vehicules\civ\Bird_stickerbomb.paa","civ"]
		];
	};

	case "C_Heli_Light_01_civil_F": //M900
	{
		_ret =
		[
			["textures\vehicules\cop\bird.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"], //Index 10
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["textures\vehicules\reb\Bird_1.paa","reb"],
			["textures\vehicules\reb\Bird_2.paa","reb"],
			["textures\vehicules\smt\M900SMT.paa","med"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			["textures\vehicules\emt\Dep_Bird.paa","med"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","bac"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","bac"],
			["textures\vehicules\reb\Bird_2.paa","bac"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","civ"],
			["textures\vehicules\civ\Bird_cookie.paa","civ"],
			["textures\vehicules\civ\Bird_hawai.paa","civ"],
			["textures\vehicules\civ\Bird_stickerbomb.paa","civ"],
			["textures\vehicules\civ\bird_swirl.paa","civ"]
		];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\vehicules\reb\Orca_rebel.paa","reb"],
			["textures\vehicules\civ\Orca_Shield.paa","civ"],
			["textures\vehicules\cop\orca.paa","cop"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","bac"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","civ"]
		];
	};

	case "I_MRAP_03_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","reb"],
			["textures\vehicules\reb\Strider_reb.paa","reb"],
			["textures\vehicules\reb\Strider_rouge.paa.paa","reb"],
			["textures\vehicules\reb\Strider_rose.paa.paa","reb"]
		];
	};

	case "O_MRAP_02_F":
	{
		_ret =
		[
			["\A3\Soft_F\MRAP_02\data\mrap_02_ext_01_co.paa","reb","\a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"],
			["textures\vehicules\reb\ifrit_lion_front.paa","reb","textures\vehicules\reb\ifrit_lion_back.paa"],
			["textures\vehicules\reb\ifrit_grey_front.paa","reb","textures\vehicules\reb\ifrit_grey_back.paa"],
			["textures\vehicules\reb\ifrit_forest_front.paa","reb","textures\vehicules\reb\ifrit_forest_back.paa"],
			["textures\vehicules\reb\ifrit_red_front.paa","reb","textures\vehicules\reb\ifrit_red_back.paa"],
			["textures\vehicules\reb\ifrit_noir_back.paa","reb","textures\vehicules\reb\ifrit_noir_back.paa"],
			["textures\vehicules\reb\ifrit_rose_front.paa","reb","textures\vehicules\reb\ifrit_rose_back.paa"]
		];
	};

	case "B_G_Offroad_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Offroad_01\Data\offroad_01_ext_ig01_co.paa","reb"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\vehicules\civ\Zamak_barbie1.paa","civ","textures\vehicules\civ\Zamak_barbie2.paa"],
			["textures\vehicules\civ\Zamak_truck_kab_coca.paa","civ","textures\vehicules\civ\Zamak_truck_kuz_coca.paa"],
			["textures\vehicules\civ\Zamak_weed.paa","civ","textures\vehicules\civ\Zamak_weed_back.paa"],
			["textures\vehicules\civ\Zamak_red_front.paa","civ","textures\vehicules\civ\Zamak_red_back.paa"],
			["textures\vehicules\civ\Zamak_yellow_front.paa","civ","textures\vehicules\civ\Zamak_yellow_back.paa"],
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","bac","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\vehicules\civ\Zamak_weed.paa","bac","textures\vehicules\civ\Zamak_weed_back.paa"]
		];
	};

	case "B_G_Offroad_01_armed_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_07_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_10_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_05_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_01_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_04_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_03_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_09_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_06_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_08_co.paa","reb"],
			["\a3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_ig_02_co.paa","reb"]
		];
	};

	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["textures\vehicules\civ\CH49_USMC_1.paa","civ","textures\vehicules\civ\CH49_USMC_2.paa","textures\vehicules\civ\CH49_USMC_3.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["textures\vehicules\smt\MOHAWK1SMT.paa","med","textures\vehicules\smt\MOHAWK2SMT.paa","textures\vehicules\smt\MOHAWK3SMT.paa"]
		];
	};

	case "C_Offroad_02_unarmed_F":
	{
		_ret =
		[
			["textures\vehicules\cop\prowler.paa","cop"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","civ"],
			["\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","civ"]
		];
	};
};
_ret;