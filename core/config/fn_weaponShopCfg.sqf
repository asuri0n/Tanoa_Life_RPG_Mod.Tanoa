#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "station":
	{
		["Carrefour Mini Market",
			[
				["ItemRadio",nil,200],
				["ItemMap",nil,500],
				["ItemGPS",nil,500],
				["ItemCompass",nil,500],
				["ItemWatch",nil,150],
				["Binocular",nil,1500],
				["NVGoggles","Night Vision",5000],
				["ToolKit",nil,5000]
			]
		];
	};

	case "bac_shop":
	{
		switch(true) do
		{
			case (!license_cop_bac): {"Tu n'es pas membre de la BAC!"};

			default
			{
				["Armurerie de la Brigade Anti Criminalité",
					[
					]
				];
			};
		};
	};

	case "depan":
	{
		switch(true) do
		{
			case (playerSide != independent): {"Tu ne fais pas partie des slots dépanneurs!"};
			case (__GETC__(life_medicLevel) == 0): {"Tu ne fais pas partie des slots dépanneurs!"};
			default
			{
				["Magasin dépanneur",
					[
						["ItemMap",nil,50],
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ItemRadio",nil,200],
						["ToolKit",nil,250],
						["NVGoggles",nil,2000],
						["Chemlight_yellow",nil,255],
						["Rangefinder",nil,2000],
						["ItemCompass",nil,200],
						["ItemWatch",nil,50]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"Tu n'es pas médecin"};
			case (__GETC__(life_medicLevel) == 0):{"Tu n'es pas médecin"};
			default {
				["Magasin Medecin",
					[
						//["AGM_Epipen",nil,0],
						//["AGM_Bloodbag",nil,0],
						//["AGM_Bandage",nil,0],
						//["AGM_Morphine",nil,0],
						["ItemRadio",nil,200],
						["FirstAidKit","Trousse de soin",500],
						["medikit",nil,0],
						["ItemMap",nil,50],
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["NVGoggles",nil,2000],
						["Chemlight_yellow",nil,255],
						["Rangefinder",nil,2000],
						["ItemRadio",nil,200],
						["ItemCompass",nil,200],
						["ItemWatch",nil,50]
					]
				];
			};
		};
	};


	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'etes pas un civil !"};
			case (!license_civ_rebel): {"Tu n'as pas ta licence d'entrainement Rebelle!"};
			case (__GETC__(life_donator) != 0) :
			{
				["Membre Donateur Capture 5%",
					[

					]
				];
			};
			default
			{
				["Arsenal Zone de Capture",
					[

					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Accessible qu'aux rebelles !"};
			case (!license_civ_rebel): {"Tu n'as pas ta licence d'entrainement Rebelle!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						//ARMES
						["hgun_P07_F",nil,20000],
						["hgun_Rook40_F",nil,20000],
							["16Rnd_9x21_Mag",nil,500],

						["hgun_ACPC2_F",nil,20000],
							["9Rnd_45ACP_Mag",nil,500],

						["hgun_Pistol_heavy_01_F",nil,20000],
							["11Rnd_45ACP_Mag",nil,500],

						["hgun_Pistol_heavy_02_F",nil,35000],
							["6Rnd_45ACP_Cylinder",nil,500],

						["srifle_DMR_01_F",nil,150000],
							["10Rnd_762x54_Mag",nil,5000],

						["LMG_Zafir_F",nil,400000],
							["150Rnd_762x54_Box",nil,5000],

						["arifle_Katiba_C_F",nil,150000],
						["arifle_ARX_ghex_F",nil,175000],
						["arifle_ARX_hex_F",nil,175000],
							["30Rnd_65x39_caseless_green",nil,500],

						//
						//["srifle_GM6_camo_F",nil,712500],
							//["5Rnd_127x108_Mag",nil,2500],

						["srifle_DMR_06_camo_F",nil,200000],
						["srifle_DMR_06_olive_F",nil,200000],
						["srifle_DMR_03_woodland_F",nil,200000],
						["arifle_SPAR_03_khk_F",nil,200000],
						["arifle_SPAR_03_snd_F",nil,200000],
							["20Rnd_762x51_Mag",nil,500],

						["arifle_CTAR_hex_F",nil,150000],
							["30Rnd_580x42_Mag_F",nil,500],

						["srifle_DMR_07_ghex_F",nil,175000],
							["20Rnd_650x39_Cased_Mag_F",nil,500],

						//CYRUS
						//["srifle_DMR_05_tan_f",nil,600000],
							//["10Rnd_93x64_DMR_05_Mag",nil,5000],

						//["LMG_03_F",nil,380000],
							//["200Rnd_556x45_Box_F",nil,3500],

						//["arifle_Mk20_F",nil,60000],
						["arifle_SDAR_F",nil,60000],
						["arifle_SPAR_01_khk_F",nil,120000],
						["arifle_SPAR_01_snd_F",nil,120000],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_AK12_F",nil,225000],
						["arifle_AKM_F",nil,175000],
						["arifle_AKM_FL_F",nil,175000],
							["30Rnd_762x39_Mag_F",nil,500],

						["arifle_AKS_F",nil,80000],
							["30Rnd_545x39_Mag_F",nil,500],

						//["arifle_MX_khk_F",nil,300000],
						//["arifle_MXC_khk_F",nil,300000],
						//["arifle_MXM_khk_F",nil,300000],
							//["30Rnd_65x39_caseless_mag",nil,500],

						["arifle_MX_SW_khk_F",nil,225000],
							["100Rnd_65x39_caseless_mag",nil,3500],

						//["arifle_SPAR_02_khk_F",nil,325000],
						//["arifle_SPAR_02_snd_F",nil,325000],
							//["150Rnd_556x45_Drum_Mag_F",nil,3000],

					//VISEURS
						["optic_MRCO",nil,10000],
						["optic_Arco",nil,10000],
						["optic_Hamr",nil,10000],
						["optic_ACO_grn",nil,10000],
						["optic_Aco",nil,10000],
						["optic_Holosight",nil,10000],
						["optic_DMS",nil,17000],
						["optic_NVS","Night Vision",10000],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,30000],
						["muzzle_snds_B_snd_F",nil,30000],
						["muzzle_snds_B_khk_F",nil,30000],
						["muzzle_snds_65_TI_ghex_F",nil,30000],
						["muzzle_snds_65_TI_hex_F",nil,30000],
						["muzzle_snds_L",nil,30000],

					//ACCESSOIRES
						//["AGM_Bloodbag",nil,10000],
						["NVGoggles_INDEP",nil,2000],
						["O_NVGoggles_hex_F",nil,3000],
						["O_NVGoggles_urb_F",nil,3000],
						["ToolKit","Kit de reparation",2000],
						["Rangefinder",nil,8000],
						["FirstAidKit","Trousse de soin",500],
						//["Skyline_C_Remote_Cam",nil,50000],

					//Smoke
						["SmokeShell","Fumi blanche",1000],
						["SmokeShellRed","Fumi rouge",1000],
						["SmokeShellGreen","Fumi verte",1000],
						["SmokeShellYellow","Fumi jaune",1000],
						["SmokeShellPurple","Fumi violette",1000],
						["SmokeShellBlue","Fumi bleu",1000],
						["SmokeShellOrange","Fumi orange",1000]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Interdit aux civils !"};
			case (!license_civ_gun): {"Tu n'a pas le Permis de Port d'Armes !"};
			default
			{
				["Armes a Feu De Billy Joe",
					[
					// Soins
						//["AGM_Bloodbag",nil,10000],
						//["AGM_Bandage",nil,150],
					// Armes
						["hgun_P07_F",nil,20000],
						["hgun_Rook40_F",nil,20000],
							["16Rnd_9x21_Mag",nil,500],

						["hgun_ACPC2_F",nil,20000],
							["9Rnd_45ACP_Mag",nil,500],

						["hgun_Pistol_heavy_01_F",nil,20000],
							["11Rnd_45ACP_Mag",nil,500],

						["hgun_Pistol_heavy_02_F",nil,20000],
							["6Rnd_45ACP_Cylinder",nil,500],

						["hgun_PDW2000_F",nil,38000],
							["30Rnd_9x21_Mag",nil,500],

						["arifle_Mk20_plain_F",nil,60000],
						["arifle_SDAR_F",nil,60000],
							["30Rnd_556x45_Stanag",nil,500],

						["SMG_05_F",nil,40000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

					//ACCESSOIRES
						//["Skyline_C_Remote_Cam",nil,60000],
						["NVGoggles","Night Vision",2000],
						["ToolKit","Kit de reparation",2000],
						["Rangefinder",nil,8000],
						["FirstAidKit","Trousse de soin",500]
					]
				];
			};
		};
	};

	case "gangster":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Interdit aux civils !"};
			case (!license_civ_gangster): {"Tu n'es pas gangster!"};
			case (__GETC__(life_donator) != 0) :
			{
				["Membre Donateur Gangster 5%",
					[
					]
				];
			};
			default
			{
				["Magasin Gangster",
					[
					]
				];
			};
		};
	};

	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"Tu n'es pas donateur!"};
			default
			{
				["Magasin de la communauté",
					[
					// Soins
						//["medikit",nil,35000],
						//["AGM_Bloodbag",nil,8600],
						//["AGM_Bandage",nil,130],
					// Armes
						["hgun_P07_F",nil,17000],
						["hgun_Rook40_F",nil,17000],
							["16Rnd_9x21_Mag",nil,430],

						["hgun_ACPC2_F",nil,17000],
							["9Rnd_45ACP_Mag",nil,430],

						["hgun_Pistol_heavy_01_F",nil,17000],
							["11Rnd_45ACP_Mag",nil,430],

						["hgun_Pistol_heavy_02_F",nil,17000],
							["6Rnd_45ACP_Cylinder",nil,430],

						["hgun_PDW2000_F",nil,33000],
							["30Rnd_9x21_Mag",nil,430],

						["arifle_Mk20_plain_F",nil,52000],
						["arifle_TRG21_F",nil,69000],
						["arifle_SDAR_F",nil,52000],
							["30Rnd_556x45_Stanag",nil,430],

						["SMG_05_F",nil,34500],
							["30Rnd_9x21_Mag_SMG_02",nil,430],


					//ACCESSOIRES
						["NVGoggles","Night Vision",1730],
						["ToolKit","Kit de reparation",1730],
						["Rangefinder",nil,6950],
						["FirstAidKit","Trousse de soin",430]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["magasin général",
			[
				//["AGM_Bandage",nil,150],
				["ItemMap",nil,200],
				["ItemGPS",nil,200],
				["ItemCompass",nil,200],
				["ItemWatch",nil,50],
				["ItemRadio",nil,200],
				["Binocular",nil,1500],
				["NVGoggles","Night Vision",2000],
				["ToolKit",nil,2000],
				["FirstAidKit","Trousse de soin",500]
			]
		];
	};

	case "cop_shop":
	{
		switch(true) do
		{
			case (__GETC__(life_copLevel) == 0):{"Tu n'es pas whitelisté"};
			case (__GETC__(life_copLevel)  == 1):{
				["Armurerie resérviste",
					[
						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

					//VISEURS
						["optic_MRCO",nil,2500],

					//Items
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500]
					]
				];
			};
			case (__GETC__(life_copLevel)  == 2):{
				["Armurerie gendarme",
					[
						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

						["arifle_ARX_blk_F",nil,27500],
							["30Rnd_65x39_caseless_green",nil,500],

						["arifle_Mk20_F",nil,27500],
						["arifle_SDAR_F",nil,27500],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_CTAR_blk_F",nil,27500],
							["30Rnd_580x42_Mag_F",nil,500],

						["arifle_SPAR_02_blk_F",nil,27500],
							["150Rnd_556x45_Drum_Mag_F",nil,500],

					//VISEURS
						["optic_MRCO",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_DMS",nil,2500],
						["optic_NVS","Night Vision",2500],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,2500],
						["muzzle_snds_B_snd_F",nil,2500],
						["muzzle_snds_B_khk_F",nil,25000],
						["muzzle_snds_65_TI_ghex_F",nil,2500],
						["muzzle_snds_65_TI_hex_F",nil,2500],

					//Items
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["O_NVGoggles_ghex_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500],

					//Chemlight
						["Chemlight_green","Chemlight vert",500],
						["Chemlight_red","Chemlight rouge",500],
						["Chemlight_yellow","Chemlight jaune",500],
						["Chemlight_blue","Chemlight bleu",500],

					//Smoke
						["SmokeShell","Fumi blanche",500],
						["SmokeShellRed","Fumi rouge",500],
						["SmokeShellGreen","Fumi verte",500],
						["SmokeShellYellow","Fumi jaune",500],
						["SmokeShellPurple","Fumi violette",500],
						["SmokeShellBlue","Fumi bleu",500],
						["SmokeShellOrange","Fumi orange",500]
					]
				];
			};
			case (__GETC__(life_copLevel)  == 3):{
				["Armurerie adjudant",
					[
						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

						["arifle_ARX_blk_F",nil,27500],
							["30Rnd_65x39_caseless_green",nil,500],

						["arifle_Mk20_F",nil,27500],
						["arifle_SDAR_F",nil,27500],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_CTAR_blk_F",nil,27500],
							["30Rnd_580x42_Mag_F",nil,500],

						["arifle_SPAR_02_blk_F",nil,27500],
							["150Rnd_556x45_Drum_Mag_F",nil,500],

						["arifle_SPAR_03_blk_F",nil,35000],
							["20Rnd_762x51_Mag",nil,500],

					//VISEURS
						["optic_MRCO",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_DMS",nil,2500],
						["optic_NVS","Night Vision",2500],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,2500],
						["muzzle_snds_B_snd_F",nil,2500],
						["muzzle_snds_B_khk_F",nil,25000],
						["muzzle_snds_65_TI_ghex_F",nil,2500],
						["muzzle_snds_65_TI_hex_F",nil,2500],

					//Items
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["O_NVGoggles_ghex_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500],

					//Chemlight
						["Chemlight_green","Chemlight vert",500],
						["Chemlight_red","Chemlight rouge",500],
						["Chemlight_yellow","Chemlight jaune",500],
						["Chemlight_blue","Chemlight bleu",500],

					//Smoke
						["SmokeShell","Fumi blanche",500],
						["SmokeShellRed","Fumi rouge",500],
						["SmokeShellGreen","Fumi verte",500],
						["SmokeShellYellow","Fumi jaune",500],
						["SmokeShellPurple","Fumi violette",500],
						["SmokeShellBlue","Fumi bleu",500],
						["SmokeShellOrange","Fumi orange",500]
						//["Skyline_B_Remote_Cam",nil,5000]
					]
				];
			};
			case (__GETC__(life_copLevel)  == 4):{
				["Armurerie lieutenant",
					[
						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

						["arifle_ARX_blk_F",nil,27500],
							["30Rnd_65x39_caseless_green",nil,500],

						["arifle_Mk20_F",nil,27500],
						["arifle_SDAR_F",nil,27500],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_CTAR_blk_F",nil,27500],
							["30Rnd_580x42_Mag_F",nil,500],

						["arifle_SPAR_02_blk_F",nil,27500],
							["150Rnd_556x45_Drum_Mag_F",nil,500],

						["arifle_SPAR_03_blk_F",nil,35000],
						["srifle_DMR_03_F",nil,35000],
						["srifle_DMR_06_olive_F",nil,35000],
							["20Rnd_762x51_Mag",nil,500],

						["LMG_03_F",nil,42500],
							["200Rnd_556x45_Box_F",nil,500],

						["arifle_MX_SW_Black_F",nil,42500],
							["100Rnd_65x39_caseless_mag",nil,500],

						["arifle_CTARS_blk_F",nil,42500],
							["100Rnd_580x42_Mag_F",nil,500],

					//VISEURS
						["optic_MRCO",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_DMS",nil,2500],
						["optic_NVS","Night Vision",2500],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,2500],
						["muzzle_snds_B_snd_F",nil,2500],
						["muzzle_snds_B_khk_F",nil,25000],
						["muzzle_snds_65_TI_ghex_F",nil,2500],
						["muzzle_snds_65_TI_hex_F",nil,2500],

					//Items
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["O_NVGoggles_ghex_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500],

					//Chemlight
						["Chemlight_green","Chemlight vert",500],
						["Chemlight_red","Chemlight rouge",500],
						["Chemlight_yellow","Chemlight jaune",500],
						["Chemlight_blue","Chemlight bleu",500],

					//Smoke
						["SmokeShell","Fumi blanche",500],
						["SmokeShellRed","Fumi rouge",500],
						["SmokeShellGreen","Fumi verte",500],
						["SmokeShellYellow","Fumi jaune",500],
						["SmokeShellPurple","Fumi violette",500],
						["SmokeShellBlue","Fumi bleu",500],
						["SmokeShellOrange","Fumi orange",500]
						//["Skyline_B_Remote_Cam",nil,5000]
					]
				];
			};
			case (__GETC__(life_copLevel)  == 5):{
				["Armurerie Major",
					[
						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

						["arifle_ARX_blk_F",nil,27500],
							["30Rnd_65x39_caseless_green",nil,500],

						["arifle_Mk20_F",nil,27500],
						["arifle_SDAR_F",nil,27500],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_CTAR_blk_F",nil,27500],
							["30Rnd_580x42_Mag_F",nil,500],

						["arifle_SPAR_02_blk_F",nil,27500],
							["150Rnd_556x45_Drum_Mag_F",nil,500],

						["arifle_SPAR_03_blk_F",nil,35000],
						["srifle_DMR_03_F",nil,35000],
						["srifle_DMR_06_olive_F",nil,35000],
							["20Rnd_762x51_Mag",nil,500],

						["LMG_03_F",nil,42500],
							["200Rnd_556x45_Box_F",nil,500],

						["arifle_MX_SW_Black_F",nil,42500],
							["100Rnd_65x39_caseless_mag",nil,500],

						["arifle_MXC_Black_F",nil,42500],
						["arifle_MX_Black_F",nil,42500],
						["arifle_MXM_Black_F",nil,42500],
							["30Rnd_65x39_caseless_mag",nil,500],

						["arifle_CTARS_blk_F",nil,42500],
							["100Rnd_580x42_Mag_F",nil,500],

						["srifle_DMR_05_blk_F",nil,50000],
							["10Rnd_93x64_DMR_05_Mag",nil,500],

						["srifle_DMR_07_blk_F",nil,50000],
							["20Rnd_650x39_Cased_Mag_F",nil,500],

					//VISEURS
						["optic_MRCO",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_DMS",nil,2500],
						["optic_NVS","Night Vision",2500],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,2500],
						["muzzle_snds_B_snd_F",nil,2500],
						["muzzle_snds_B_khk_F",nil,25000],
						["muzzle_snds_65_TI_ghex_F",nil,2500],
						["muzzle_snds_65_TI_hex_F",nil,2500],

					//Items
						//["AGM_Epipen",nil,35000],
						//["AGM_Bloodbag",nil,2000],
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["O_NVGoggles_ghex_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500],

					//Chemlight
						["Chemlight_green","Chemlight vert",500],
						["Chemlight_red","Chemlight rouge",500],
						["Chemlight_yellow","Chemlight jaune",500],
						["Chemlight_blue","Chemlight bleu",500],

					//Smoke
						["SmokeShell","Fumi blanche",500],
						["SmokeShellRed","Fumi rouge",500],
						["SmokeShellGreen","Fumi verte",500],
						["SmokeShellYellow","Fumi jaune",500],
						["SmokeShellPurple","Fumi violette",500],
						["SmokeShellBlue","Fumi bleu",500],
						["SmokeShellOrange","Fumi orange",500]
						//["Skyline_B_Remote_Cam",nil,5000]
					]
				];
			};
			case (__GETC__(life_copLevel)  == 6):{
				["Armurerie colonel",
					[
						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

						["arifle_ARX_blk_F",nil,27500],
							["30Rnd_65x39_caseless_green",nil,500],

						["arifle_Mk20_F",nil,27500],
						["arifle_SDAR_F",nil,27500],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_CTAR_blk_F",nil,27500],
							["30Rnd_580x42_Mag_F",nil,500],

						["arifle_SPAR_02_blk_F",nil,27500],
							["150Rnd_556x45_Drum_Mag_F",nil,500],

						["arifle_SPAR_03_blk_F",nil,35000],
						["srifle_DMR_03_F",nil,35000],
						["srifle_DMR_06_olive_F",nil,35000],
							["20Rnd_762x51_Mag",nil,500],

						["LMG_03_F",nil,42500],
							["200Rnd_556x45_Box_F",nil,500],

						["arifle_MX_SW_Black_F",nil,42500],
							["100Rnd_65x39_caseless_mag",nil,500],

						["arifle_MXC_Black_F",nil,42500],
						["arifle_MX_Black_F",nil,42500],
						["arifle_MXM_Black_F",nil,42500],
							["30Rnd_65x39_caseless_mag",nil,500],

						["arifle_CTARS_blk_F",nil,42500],
							["100Rnd_580x42_Mag_F",nil,500],

						["srifle_DMR_05_blk_F",nil,50000],
							["10Rnd_93x64_DMR_05_Mag",nil,500],

						["srifle_DMR_07_blk_F",nil,50000],
							["20Rnd_650x39_Cased_Mag_F",nil,500],

						["LMG_Mk200_F",nil,57500],
							["200Rnd_65x39_cased_Box",nil,500],

						["srifle_LRR_F",nil,65000],
							["7Rnd_408_Mag",nil,1000],

					//VISEURS
						["optic_MRCO",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_DMS",nil,2500],
						["optic_NVS","Night Vision",2500],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,2500],
						["muzzle_snds_B_snd_F",nil,2500],
						["muzzle_snds_B_khk_F",nil,25000],
						["muzzle_snds_65_TI_ghex_F",nil,2500],
						["muzzle_snds_65_TI_hex_F",nil,2500],

					//Items
						//["AGM_Epipen",nil,35000],
						//["AGM_Bloodbag",nil,2000],
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["O_NVGoggles_ghex_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500],

					//Chemlight
						["Chemlight_green","Chemlight vert",500],
						["Chemlight_red","Chemlight rouge",500],
						["Chemlight_yellow","Chemlight jaune",500],
						["Chemlight_blue","Chemlight bleu",500],

					//Smoke
						["SmokeShell","Fumi blanche",500],
						["SmokeShellRed","Fumi rouge",500],
						["SmokeShellGreen","Fumi verte",500],
						["SmokeShellYellow","Fumi jaune",500],
						["SmokeShellPurple","Fumi violette",500],
						["SmokeShellBlue","Fumi bleu",500],
						["SmokeShellOrange","Fumi orange",500]
						//["Skyline_B_Remote_Cam",nil,5000]
					]
				];
			};
			case (__GETC__(life_copLevel)  >= 7):{
				["Armurerie general",
					[


						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

						["arifle_ARX_blk_F",nil,27500],
							["30Rnd_65x39_caseless_green",nil,500],

						["arifle_Mk20_F",nil,27500],
						["arifle_SDAR_F",nil,27500],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_CTAR_blk_F",nil,27500],
							["30Rnd_580x42_Mag_F",nil,500],


						["arifle_SPAR_02_blk_F",nil,27500],
							["150Rnd_556x45_Drum_Mag_F",nil,500],

						["arifle_SPAR_03_blk_F",nil,35000],
						["srifle_DMR_03_F",nil,35000],
						["srifle_DMR_06_olive_F",nil,35000],
							["20Rnd_762x51_Mag",nil,500],

						["LMG_03_F",nil,42500],
							["200Rnd_556x45_Box_F",nil,500],

						["arifle_MX_SW_Black_F",nil,42500],
							["100Rnd_65x39_caseless_mag",nil,500],

						["arifle_MXC_Black_F",nil,42500],
						["arifle_MX_Black_F",nil,42500],
						["arifle_MXM_Black_F",nil,42500],
							["30Rnd_65x39_caseless_mag",nil,500],

						["arifle_CTARS_blk_F",nil,42500],
							["100Rnd_580x42_Mag_F",nil,500],

						["srifle_DMR_05_blk_F",nil,50000],
							["10Rnd_93x64_DMR_05_Mag",nil,500],

						["srifle_DMR_07_blk_F",nil,50000],
							["20Rnd_650x39_Cased_Mag_F",nil,500],

						["LMG_Mk200_F",nil,57500],
							["200Rnd_65x39_cased_Box",nil,500],

						["srifle_LRR_F",nil,65000],
							["7Rnd_408_Mag",nil,1000],

					//VISEURS
						["optic_MRCO",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_DMS",nil,2500],
						["optic_NVS","Night Vision",2500],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,2500],
						["muzzle_snds_B_snd_F",nil,2500],
						["muzzle_snds_B_khk_F",nil,25000],
						["muzzle_snds_65_TI_ghex_F",nil,2500],
						["muzzle_snds_65_TI_hex_F",nil,2500],

					//Items
						//["AGM_Epipen",nil,35000],
						//["AGM_Bloodbag",nil,2000],
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["O_NVGoggles_ghex_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500],


					//Chemlight
						["Chemlight_green","Chemlight vert",500],
						["Chemlight_red","Chemlight rouge",500],
						["Chemlight_yellow","Chemlight jaune",500],
						["Chemlight_blue","Chemlight bleu",500],

					//Smoke
						["SmokeShell","Fumi blanche",500],
						["SmokeShellRed","Fumi rouge",500],
						["SmokeShellGreen","Fumi verte",500],
						["SmokeShellYellow","Fumi jaune",500],
						["SmokeShellPurple","Fumi violette",500],
						["SmokeShellBlue","Fumi bleu",500],
						["SmokeShellOrange","Fumi orange",500]
						//["Skyline_B_Remote_Cam",nil,5000]
					]
				];
			};
			case (__GETC__(life_copLevel)  >= 8):{
				["Armurerie GIGN",
					[

						//["DDOPP_X26","Taser X26 Jaune",0],
						//["DDOPP_X26_b","Taser X26 Noir",0],
							//["DDOPP_1Rnd_X26","Munitions Taser X26",0],

						["hgun_P07_snds_F",nil,0],
							["16Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_01_F",nil,0],
							["10Rnd_9x21_Mag",nil,0],

						["SMG_02_F",nil,20000],
						["SMG_05_F",nil,20000],
							["30Rnd_9x21_Mag_SMG_02",nil,500],

						["arifle_ARX_blk_F",nil,27500],
							["30Rnd_65x39_caseless_green",nil,500],

						["arifle_Mk20_F",nil,27500],
						["arifle_SDAR_F",nil,27500],
							["30Rnd_556x45_Stanag",nil,500],

						["arifle_CTAR_blk_F",nil,27500],
							["30Rnd_580x42_Mag_F",nil,500],


						["arifle_SPAR_02_blk_F",nil,27500],
							["150Rnd_556x45_Drum_Mag_F",nil,500],

						["arifle_SPAR_03_blk_F",nil,35000],
						["srifle_DMR_03_F",nil,35000],
						["srifle_DMR_06_olive_F",nil,35000],
							["20Rnd_762x51_Mag",nil,500],

						["LMG_03_F",nil,42500],
							["200Rnd_556x45_Box_F",nil,500],

						["arifle_MX_SW_Black_F",nil,42500],
							["100Rnd_65x39_caseless_mag",nil,500],

						["arifle_MXC_Black_F",nil,42500],
						["arifle_MX_Black_F",nil,42500],
						["arifle_MXM_Black_F",nil,42500],
							["30Rnd_65x39_caseless_mag",nil,500],

						["arifle_CTARS_blk_F",nil,42500],
							["100Rnd_580x42_Mag_F",nil,500],

						["srifle_DMR_05_blk_F",nil,50000],
							["10Rnd_93x64_DMR_05_Mag",nil,500],

						["srifle_DMR_07_blk_F",nil,50000],
							["20Rnd_650x39_Cased_Mag_F",nil,500],

						["LMG_Mk200_F",nil,57500],
							["200Rnd_65x39_cased_Box",nil,500],

						["srifle_LRR_F",nil,65000],
							["7Rnd_408_Mag",nil,1000],

					//VISEURS
						["optic_MRCO",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_DMS",nil,2500],
						["optic_NVS","Night Vision",2500],

					//SILENCIEUX
						["muzzle_snds_58_wdm_F",nil,2500],
						["muzzle_snds_B_snd_F",nil,2500],
						["muzzle_snds_B_khk_F",nil,25000],
						["muzzle_snds_65_TI_ghex_F",nil,2500],
						["muzzle_snds_65_TI_hex_F",nil,2500],

					//Items
						//["AGM_Epipen",nil,35000],
						//["AGM_Bloodbag",nil,2000],
						["ItemMap","Carte",0],
						["ItemGPS","GPS",0],
						["ItemCompass","Boussole",0],
						["ItemWatch","Montre",0],
						["Binocular","Jumelles",0],
						["NVGoggles_tna_F",nil,0],
						["O_NVGoggles_ghex_F",nil,0],
						["ToolKit","Kit de reparation",0],
						["Rangefinder","Telemetre",0],
						["ItemRadio",nil,0],
						["FirstAidKit","Trousse de soin",500],

					//Chemlight
						["Chemlight_green","Chemlight vert",500],
						["Chemlight_red","Chemlight rouge",500],
						["Chemlight_yellow","Chemlight jaune",500],
						["Chemlight_blue","Chemlight bleu",500],

					//Smoke
						["SmokeShell","Fumi blanche",500],
						["SmokeShellRed","Fumi rouge",500],
						["SmokeShellGreen","Fumi verte",500],
						["SmokeShellYellow","Fumi jaune",500],
						["SmokeShellPurple","Fumi violette",500],
						["SmokeShellBlue","Fumi bleu",500],
						["SmokeShellOrange","Fumi orange",500]
						//["Skyline_B_Remote_Cam",nil,5000]
					]
				];
			};
			default
			{
				["Armurerie",
					[
					["SmokeShellOrange","Fumi orange",500]
					//Weapons
					//Ammo
					//Optic
					//Accessories
					//Items
					//Chemlight
					//Smoke
					]
				];
			};
		};
	};
};