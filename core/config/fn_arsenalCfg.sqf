#include <macro.h>
/*
	File: fn_arsenalCfg.sqf
	Author: Komodo

	Description:
	Master configuration file for the virtual arsenal shop.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop","_weapons","_magazines","_items","_backpacks","_return","_coef","_isGangShop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

_weapons = [];
_magazines = [];
_items = [];
_backpacks = [];
_return = [[],[],[],[]];
_isGangShop = false;
if (_shop == "gang") then
{
	_isGangShop = true;
	_shop = "rebel";
};

//default equipment available for all civilian factions.
if (playerSide == civilian) then
{
	//General Store
	_items = _items + [
		["Binocular",150],
		["ItemMap",50],
		["ItemCompass",50],
		["ItemWatch",50],
		["ItemGPS",100],
		["ToolKit",2000],
		["ItemRadio",50],		
		["NVGoggles",2000],
		
		//Uniforms
		["U_C_Poloshirt_salmon",175],
		["U_C_Poloshirt_redwhite",150],
		["U_C_Poor_1",250],
		["U_C_Poloshirt_stripped",250],
		["U_C_Poloshirt_blue",250],
		["U_C_Poloshirt_burgundy",275],
		["U_C_Poloshirt_tricolour",350],
		["U_I_G_Story_Protagonist_F",500],
		["U_I_G_resistanceLeader_F",500],
		["U_OG_Guerilla3_1",500],
		["U_OG_Guerilla3_2",500],
		["U_IG_Guerilla2_1",500],
		["U_IG_Guerilla2_2",650],
		["U_OrestesBody",1100],
		["U_IG_Guerilla2_3",1200],
		["U_C_HunterBody_grn",1500],
		["U_NikosBody",1500],
		["U_NikosAgedBody",1500],
		["U_C_WorkerCoveralls",2500],
		
		//Hats
		["H_Cap_red",50],
		["H_Cap_blu",50],
		["H_Cap_oli",50],
		["H_Cap_grn",50],
		["H_Cap_tan",50],
		["H_Cap_blk",50],
		["H_Cap_blk_CMMG",50],
		["H_Cap_blk_ION",50],
		["H_Cap_pmc",50],
		["H_Booniehat_grn",50],
		["H_Booniehat_tan",50],
		["H_Booniehat_dirty",50],
		["H_Bandanna_surfer",50],
		["H_Bandanna_khk",50],
		["H_Bandanna_cbr",50],
		["H_Bandanna_sgg",50],
		["H_Bandanna_gry",50],
		["H_StrawHat",50],
		["H_StrawHat_dark",50],
		["H_Hat_blue",50],
		["H_Hat_brown",50],
		["H_Hat_grey",50],
		["H_Watchcap_blk",50],
		["H_Watchcap_khk",50],
		["H_Watchcap_sgg",50],
		["H_Watchcap_camo",50],
		["H_Hat_checker",50],

		//Vests
		["V_Rangemaster_belt", 3000],
		["V_BandollierB_cbr",4500]
	];

	_backpacks = _backpacks + [
		//Backpacks
		//20 slots
		//30 slots
		["B_AssaultPack_blk",2000],
		["B_AssaultPack_cbr",2000],
		["B_AssaultPack_khk",2000],
		["B_AssaultPack_sgg",2000],
		["B_AssaultPack_rgr",2000],
		["B_AssaultPack_Kerry",2000],
		//40 slots
		["B_FieldPack_ocamo",1000],
		["B_FieldPack_cbr",4000],
		["B_FieldPack_blk",4000],
		["B_Kitbag_mcamo",4000],
		//55 slots
		["B_Kitbag_sgg",7000],
		["B_Kitbag_cbr",7000],
		["B_Bergen_sgg",7000],
		//70 slots
		["B_Carryall_oucamo",10000],
		["B_Carryall_oli",10000],
		["B_Carryall_cbr",10000],
		["B_Carryall_khk",10000]
	];

	if (license_civ_dive) then
	{
		_items = _items + [
			["U_B_Wetsuit",2000],
			["G_Diving",500],
			["V_RebreatherB",5000]
		];
	};

	if (_shop in ["gun","hunter","gangster","gang","rebel","donator"]) then
	{
		if (license_civ_gun OR _shop in ["rebel","gang"]) then
		{
			_weapons = _weapons + [
				["arifle_SDAR_F",60000],
				["hgun_PDW2000_F",40000],
				["SMG_01_Holo_F",40000],
				["hgun_Rook40_F",10000],
				["hgun_P07_F",9500],
				["hgun_Pistol_Signal_F",10000]
			];

			_magazines = _magazines + [
				["30Rnd_556x45_Stanag",200],
				["30Rnd_9x21_Mag",200],
				["30Rnd_45ACP_Mag_SMG_01",200],
				["16Rnd_9x21_Mag",100],
				["6Rnd_GreenSignal_F",500],
				["6Rnd_RedSignal_F",500]
			];

			_items = _items + [
				["optic_ACO_grn_smg",2000]
			];

			//Ajouts donateurs
			if (__GETC__(life_donator) > 0) then
			{
				_weapons = _weapons + [
					["Rangefinder",10000],
					["arifle_TRG20_F",100000],
					["arifle_TRG21_GL_F",120000],
					["hgun_Pistol_heavy_02_F",20000]
				];

				_magazines = _magazines + [
					["UGL_FlareWhite_F",2000],
					["UGL_FlareGreen_F",2000],
					["UGL_FlareRed_F",2000],
					["UGL_FlareYellow_F",2000],
					["UGL_FlareCIR_F",2000],
					["6Rnd_45ACP_Cylinder",200]
				];

				_items = _items + [
					["NVGoggles_OPFOR",2000],
					["optic_ACO_grn",2000],
					["optic_Aco",2000],
					["optic_Holosight",2000]
				];
			};
		}
		else
		{
			if (_shop == "gun") exitWith {hint "Tu n'as pas la licence de port d'armes."; [[],[],[],[]];};
		};
	};
};



switch(_shop) do
{
	case "cop_shop":
	{
		if (playerSide != west) exitWith {hint "Tu n'es pas Gendarme."; [[],[],[],[]];};

		//Equipement GAV
		if (__GETC__(life_coplevel) >= 1) then
		{
			_weapons = [
				["Rangefinder",2000],
				["arifle_sdar_F",50000],
				["SMG_02_ACO_F",100000],
				["arifle_TRG21_F",nil,100000]
			];
			_magazines = [
				["30Rnd_556x45_Stanag",50],
				["20Rnd_556x45_UW_mag",125],
				["30Rnd_9x21_Mag",50]
			];
			_items = [
				//Viseurs
				["optic_Aco",1200],
				["optic_Hamr",8000],
				//Objets
				["Binocular",150],
				["ItemMap",50],
				["ItemCompass",50],
				["ItemWatch",50],
				["ItemGPS",100],
				["ToolKit", 2000],
				["NVGoggles",2000],
				["NVGoggles_INDEP",2000],
				["Chemlight_red",300],
				["Chemlight_green",300],
				["Chemlight_blue",300],
				["ItemRadio",50],
				//Hats
				["H_Cap_police",0],
				//Vests
				["V_Rangemaster_belt",0],
				["V_Press_F",0],
				["V_BandollierB_oli",0],
				["V_BandollierB_blk",0]
			];

			_backpacks = _backpacks + [
				["B_AssaultPack_rgr",0],
				["B_AssaultPack_blk",0],
				["B_Kitbag_mcamo",0],
				["B_Bergen_blk",0],
				["B_Bergen_mcamo",0],
				["B_TacticalPack_oli",0],
				["B_Respawn_Sleeping_bag_blue_F",0],
				["B_Respawn_Sleeping_bag_F",0],
				["B_TacticalPack_mcamo",0],
				["B_TacticalPack_blk",0],
				["B_TacticalPack_rgr",0],
				["B_Carryall_mcamo",0],
				["B_Carryall_khk",0],
				["B_AssaultPack_Kerry",0],
				["B_Kitbag_rgr",0],
				["B_Carryall_cbr",0],
				["B_Carryall_oli",0],
				["B_Parachute",0]
			];
		};

		//Equipement Brigadier
		if (__GETC__(life_coplevel) >= 2) then
		{
			_weapons = _weapons + [

			];
			_items = _items + [
				//Viseurs
				["optic_Holosight",1200],
				["optic_ACO_grn",1200],
				//Objets
				["3Rnd_UGL_FlareWhite_F",10000],
				["3Rnd_UGL_FlareGreen_F",10000],
				["3Rnd_UGL_FlareRed_F",10000],
				["3Rnd_UGL_FlareYellow_F",10000],
				["3Rnd_UGL_FlareCIR_F",10000],
				["SmokeShell",100],
				["B_UavTerminal",150],
				["muzzle_snds_H",10000],
				["muzzle_snds_B",10000],
				["muzzle_snds_L",10000],
				["muzzle_snds_M",10000],
				["muzzle_snds_H_MG",10000],
				["acc_flashlight",750],
				//Hats
				["H_Watchcap_blk",0],
				["H_MilCap_blue",0],
				["H_CrewHelmetHeli_B",0],
				["H_MilCap_dgtl",0],
				//Vests
				["V_Chestrig_blk",0],
				["V_RebreatherB",0],
				["V_TacVest_blk_POLICE",0]
			];
		};

		//Equipement Brigadier Chef
		if (__GETC__(life_coplevel) >= 3) then
		{
			_weapons = _weapons + [
				["arifle_MXC_F",107000]
			];

			_magazines = _magazines + [
				["30Rnd_65x39_caseless_mag",50]
			];

			_items = _items + [
				//Hats
				["H_HelmetB_plain_mcamo",0],
				["H_HelmetIA",0],
				//Vests
				["V_Chestrig_oli",0]
			];
		};

		//Equipement Gendarme
		if (__GETC__(life_coplevel) >= 4) then
		{
			_weapons = _weapons + [
				["arifle_MX_F",135000]
			];

			_magazines = _magazines + [

			];

			_items = _items + [
				//Hats
				["H_Cap_tan_specops_US",0],
				["H_HelmetB_plain_blk",0],
				["H_HelmetB_black",0],
				["H_HelmetSpecB_blk",0],
				["H_PilotHelmetHeli_B",0],
				//Vests
				["V_PlateCarrier1_rgr",nil,0],
				["V_PlateCarrier2_rgr",nil,0],
				["V_TacVest_oli",nil,0]
			];
		};

		//Equipement Adjudant
		if (__GETC__(life_coplevel) >= 5) then
		{
			_weapons = _weapons + [

			];

			_magazines = _magazines + [

			];

			_items = _items + [

				//Hats
				["H_MilCap_mcamo",0],
				["H_Cap_brn_SPECOPS",0],
				["H_Cap_khaki_specops_UK",0],
				["H_HelmetB_camo",0],
				["H_HelmetB_light_black",0],
				["H_Cap_headphones",0],
				//Vests
				["V_TacVestIR_blk",nil,0],
				["V_TacVest_blk",nil,0]
			];
		};

		//Equipement Adjudant Chef
		if (__GETC__(life_coplevel) >= 6) then
		{
			_weapons = _weapons + [

			];

			_magazines = _magazines + [

			];

			_items = _items + [
				["H_MilCap_gry",0]
			];
		};

		//Equipement Major
		if (__GETC__(life_coplevel) >= 7) then
		{
			_weapons = _weapons + [

			];

			_items = _items + [
				["optic_DMS",2000],
				["optic_NVS",3000],
				["optic_Hamr",8000],
				["optic_MRCO",8000],
				["optic_Arco",8000]
			];
		};

		//Equipement Sous-Lieutenant
		case (__GETC__(life_coplevel) >= 8):
		{
			_weapons = _weapons + [
				["arifle_MXM_Black_F",175000],
				["LMG_Mk200_F",185000]
			];

			_magazines = _magazines + [
				["30Rnd_65x39_caseless_mag",50],
				["200Rnd_65x39_cased_Box",700]
			];

			_items = _items + [
			];
		};

		//Equipement Lieutenant
		if (__GETC__(life_coplevel) >= 9) then
		{
			_weapons = _weapons + [
				["arifle_MX_SW_Black_F",200000]
			];

			_magazines = _magazines + [
				["100Rnd_65x39_caseless_mag",700]
			];

			_items = _items + [
				["U_I_G_Story_Protagonist_F",0],
				//Vests
				["V_PlateCarrier1_blk",0]
			];
		};

		//Equipement Capitaine
		if (__GETC__(life_coplevel) >= 10) then
		{
			_weapons = _weapons + [
				["srifle_EBR_F",350000]
			];

			_magazines = _magazines + [
				["20Rnd_762x51_Mag",250]
			];
		};

		//Equipement Lieutenant-Colonel
		if (__GETC__(life_coplevel) == 11) then
		{
			_weapons = _weapons + [

			];

			_magazines = _magazines + [

			];

			_items = _items + [
				["H_Beret_blk",0],
				["H_Beret_02",0],
				//Vests
				["V_TacVest_camo",0]
			];
		};

		//Equipements Colonel
		if (__GETC__(life_coplevel) >= 12) then
		{
			_weapons = _weapons + [
				["srifle_LRR_F",600000],
				["srifle_LRR_camo_F",600000]
			];

			_magazines = _magazines + [
				["7Rnd_408_Mag",2000]
			];

			_items = _items + [

			];
		};

		//Equipement Général
		if (__GETC__(life_coplevel) >= 13) then
		{
			_items = _items + [
				["Beret_Red",0]
			];
		};
	};

	case "bac_shop":
	{
		if (!license_cop_bac) exitWith {hint "Tu ne fais pas partie de la BAC !"; [[],[],[],[]];};

		_weapons = [
			["Rangefinder",2000],
			//Armes de poing
			["hgun_Pistol_heavy_02_F",7500],
			//Fusils
			["srifle_EBR_F",350000],
			["arifle_TRG21_F",100000],
			["SMG_01_F",40000],
			["hgun_PDW2000_F",40000],
			["arifle_Katiba_F",150000],
			["arifle_Mk20_F",85000],
			["arifle_TRG20_F",100000],
			//Pistolets Légers
			["hgun_Rook40_F",10000],
			["hgun_P07_F",9500]
		];
		_magazines = [
			["6Rnd_45ACP_Cylinder",100],
			["20Rnd_762x51_Mag",250],
			["30Rnd_556x45_Stanag",50],
			["30Rnd_45ACP_Mag_SMG_01",200],
			["30Rnd_9x21_Mag",200],
			["30Rnd_65x39_caseless_green",300],
			["30Rnd_556x45_Stanag",200],
			["16Rnd_9x21_Mag",100],
			["30Rnd_9x21_Mag",100]
		];
		_items = [
			//Viseurs
			["optic_Holosight",1200],
			["optic_ACO_grn",1200],
			["optic_Aco",1200],
			["optic_DMS",2000],
			["optic_NVS",3000],
			["optic_Hamr",8000],
			["optic_MRCO",8000],
			["optic_Arco",8000],
			//Objets
			["Binocular",150],
			["ItemMap",50],
			["ItemCompass",50],
			["ItemWatch",50],
			["ItemGPS",100],
			["SmokeShell",100],
			["ToolKit", 2000],
			["NVGoggles",2000],
			["NVGoggles_INDEP",2001],
			["muzzle_snds_H",10000],
			["muzzle_snds_B",10000],
			["muzzle_snds_L",10000],
			["muzzle_snds_M",10000],
			["muzzle_snds_H_MG",10000],
			["Chemlight_red",300],
			["Chemlight_green",300],
			["Chemlight_blue",300],
			["acc_flashlight",750],
			["ItemRadio",50],
			//Uniforms
			["U_O_Wetsuit",0],
			["U_NikosAgedBody",0],
			["U_I_G_Story_Protagonist_F",0],
			//Hats
			["H_Cap_brn_SPECOPS",0],
			["H_Cap_tan_specops_US",0],
			["H_Cap_khaki_specops_UK",0],
			["H_Cap_blk_Raven",0],
			["H_Bandanna_cbr",0],
			["H_Bandanna_khk",0],
			["H_Bandanna_mcamo",0],
			["H_Bandanna_gry",0],
			//Vests
			["V_RebreatherB",0],
			["V_I_G_resistanceLeader_F",0],
			["V_BandollierB_cbr",0],
			["V_BandollierB_oli",0],
			["V_Chestrig_oli",0],
			["V_PlateCarrier1_rgr",0],
			["V_TacVest_blk",0],
			["V_BandollierB_oli",0]
		];

		_backpacks = _backpacks + [
			//20 slots
			["B_FieldPack_ocamo",0],
			//30 slots
			["B_AssaultPack_blk",0],
			["B_AssaultPack_cbr",0],
			["B_AssaultPack_khk",0],
			["B_AssaultPack_sgg",0],
			["B_AssaultPack_rgr",0],
			["B_AssaultPack_Kerry",0],
			//40 slots
			["B_FieldPack_cbr",0],
			["B_FieldPack_blk",0],
			["B_Kitbag_mcamo",0],
			//55 slots
			["B_Kitbag_sgg",0],
			["B_Kitbag_cbr",0],
			["B_Bergen_sgg",0],
			//70 slots
			["B_Carryall_oucamo",0],
			["B_Carryall_ocamo",0],
			["B_Carryall_oli",0],
			["B_Carryall_cbr",0],
			["B_Carryall_khk",0],
			["B_Parachute",0]
		];
	};

	case "med_basic":
	{
		if ((playerSide != independent) || (__GETC__(life_medicLevel) == 0)) exitWith {hint "Tu n'es pas médecin !"; [[],[],[],[]];};

		_weapons = [
			["Rangefinder",2000]
		];
		_magazines = [
		];
		_items = [
			//Objets
			["ItemMap",50],
			["ItemGPS",100],
			["Binocular",150],
			["ToolKit",250],
			["NVGoggles",1200],
			["Chemlight_yellow",255],
			["ItemRadio",50],
			//Uniforms
			["U_C_Scientist",0],
			["U_B_Wetsuit",0],
			//Hats
			["H_PilotHelmetHeli_O",0],
			["H_MilCap_gry",0],
			//Glasses
			//Vests
			["V_BandollierB_cbr",0],
			["V_RebreatherB",0]
		];
		_backpacks = _backpacks + [
			//Backpacks
			["B_AssaultPack_rgr",0],
			["B_AssaultPack_blk",0],
			["B_Kitbag_mcamo",0],
			["B_Bergen_blk",0],
			["B_Bergen_mcamo",0],
			["B_TacticalPack_mcamo",0],
			["B_TacticalPack_blk",0],
			["B_TacticalPack_rgr",0],
			["B_Carryall_mcamo",0],
			["B_Carryall_khk",0]
		];
	};

	case "rebel":
	{
		if (playerSide != civilian) then {hint "Vous n'etes pas un civil !"; [[],[],[],[]];};
		if (!license_civ_rebel) then {hint "Tu n'as pas ta licence d'entrainement Rebelle!"; [[],[],[],[]];};

		_weapons = _weapons + [
			["Rangefinder",10000],
			//Snipers
			["srifle_EBR_F",650000],
			["srifle_DMR_01_F",550000],
			//Fusils d'assault Haut niveau
			["arifle_Katiba_F",350000],
			//Fusils bas de gamme
			["arifle_Mk20_F",100000],
			["arifle_Mk20_GL_F",120000],
			//Pistolets Lourds
			["hgun_Pistol_heavy_01_F",18000],
			["hgun_Pistol_heavy_02_F",20000]
		];

		_magazines = _magazines + [
			["20Rnd_762x51_Mag",1000],
			["10Rnd_762x51_Mag",1000],
			//Fusils d'assault Haut niveau
			["30Rnd_65x39_caseless_green",300],
			//Fusils d'assault moyen
			//Pistolets Lourds
			["11Rnd_45ACP_Mag",200],
			["6Rnd_45ACP_Cylinder",200],
			//Grenades
			["UGL_FlareWhite_F",2000],
			["UGL_FlareGreen_F",2000],
			["UGL_FlareRed_F",2000],
			["UGL_FlareYellow_F",2000],
			["UGL_FlareCIR_F",2000]
		];

		_items = _items + [
			//VISEURS
			["optic_DMS",10000],
			["optic_NVS",10000],
			["optic_Arco",6000],
			["optic_Hamr",6000],
			["optic_MRCO",3000],
			["optic_Holosight",2000],
			//Accessoires
			["acc_pointer_IR",1000],
			["acc_flashlight",1000],
			["muzzle_snds_B",1000],
			["muzzle_snds_H",1000],
			["muzzle_snds_M",1000],
			["muzzle_snds_H_MG",1500],
			//Accessoires Arme Secondaire
			["optic_Yorris",1000],
			["optic_MRD",1000],
			["muzzle_snds_L",1000],
			["muzzle_snds_acp",1000],
			//Divers
			["Chemlight_green",255],
			["Chemlight_blue",255],
			//Uniforms
			["U_IG_Guerilla1_1",5000],
			["U_I_CombatUniform_tshirt",15500],
			["U_O_CombatUniform_oucamo",17500],
			["U_O_SpecopsUniform_blk",17500],
			["U_O_OfficerUniform_ocamo",17500],
			["U_O_PilotCoveralls",15600],
			["U_IG_leader",15500],
			["U_I_OfficerUniform",16000],
			["U_O_GhillieSuit",80000],
			["U_I_GhillieSuit",80000],
			["U_B_GhillieSuit",80000],
			["U_B_FullGhillie_lsh",nil,100000],
			["U_B_FullGhillie_sard",nil,100000],
			["U_B_FullGhillie_ard",nil,100000],
			["U_O_FullGhillie_lsh",nil,100000],
			["U_O_FullGhillie_sard",nil,100000],
			["U_O_FullGhillie_ard",nil,100000],
			["U_I_FullGhillie_lsh",nil,100000],
			["U_I_FullGhillie_sard",nil,100000],
			["U_I_FullGhillie_ard",nil,100000],
			["U_B_GhillieSuit",nil,80000],
			//Hats
			["H_ShemagOpen_tan",850],
			["H_Shemag_olive",850],
			["H_ShemagOpen_khk",800],
			["H_Shemag_tan",800],
			["H_Shemag_olive_hs",750],
			["H_HelmetO_ocamo",2500],
			["H_MilCap_oucamo",1200],
			["H_HelmetCrew_I",500],
			["H_Bandanna_camo",650],
			["H_Booniehat_dgtl",650],
			["H_Cap_brn_SPECOPS",650],
			["H_Cap_tan_specops_US",650],
			["H_Cap_khaki_specops_UK",650],
			["H_Cap_blk_Raven",650],
			["H_Bandanna_mcamo",650],
			//Glasses
			["G_Balaclava_lowprofile",1000],
			["G_Balaclava_combat",1000],
			["G_Bandanna_aviator",1500],
			["G_Bandanna_sport",1500],
			["G_Bandanna_oli",1500],
			["G_Bandanna_shades",1500],
			["G_Combat",55],
			//Vests
			["V_PlateCarrierGL_rgr",17500],
			["V_PlateCarrierIAGL_dgtl",15000],
			["V_Chestrig_oli",12500],
			["V_TacVest_camo",12500],
			["V_I_G_resistanceLeader_F",7500]
		];

		_backpacks = _backpacks + [
			//55 slots
			["B_TacticalPack_ocamo",7000],
			["B_TacticalPack_oli",7000],
			//70 slots
			["B_Carryall_ocamo",10000],
			["B_Parachute",2500]
		];

		if (_isGangShop) then
		{
			_weapons = _weapons + [
				//Mitrailleuses
				["LMG_Zafir_F",700000 / 0.9],
				//Snipers
				["srifle_GM6_F",1000000 / 0.9],
				["srifle_GM6_camo_F",1000000 / 0.9]
			];

			_magazines = _magazines + [
				["150Rnd_762x51_Box",3000],
				["5Rnd_127x108_Mag",3000]
			];
		};
	};

	case "hunter":
	{
		if (playerSide != civilian) exitWith {hint "Tu n'es pas Civil."; [[],[],[],[]];};
		if (!license_civ_gun) exitWith {hint "Tu n'as pas le permis de port d'arme."; [[],[],[],[]];};
		if (!license_civ_bounty_hunter) exitWith {hint "Tu n'es pas chasseur de primes !"; [[],[],[],[]];};

		_weapons = _weapons + [
			["Rangefinder",10000],
			//Non lethal
			//arme 6.5mm exclusif gendarmerie & chasseur de prime
			["arifle_MXC_F",200000],
			["arifle_MX_Black_F",200000]
		];
		_magazines = _magazines + [
			["30Rnd_556x45_Stanag",1000],
			["30Rnd_65x39_caseless_mag",1000]
		];
		_items = _items + [
			["optic_NVS",10000],
			["optic_Arco",6000],
			["optic_Hamr",6000],
			["optic_MRCO",3000],
			["optic_ACO_grn",2000],
			["optic_Aco",2000],
			["optic_Holosight",2000],
			//Silencieux
			["muzzle_snds_acp",2000],
			["muzzle_snds_H",7000],
			["muzzle_snds_M",4000]
			//Objet spéciaux
			//Uniforms
			//Hats
			//Glasses
			//Vests
		];

		_backpacks = _backpacks + [
			["B_Parachute",0]
		];
	};

	case "presse":
	{
		if (playerSide != civilian) exitWith {hint "Tu n'es pas Civil."; [[],[],[],[]];};
		if (!license_civ_presse) exitWith {hint "Tu n'as pas ta carte de presse !"; [[],[],[],[]];};

		_weapons = _weapons + [
			["Rangefinder",10000],
			["PMC_Titan_short_F",20000]
		];

		_items = [
			["sab_CUAV_Terminal",1000],
			["Binocular",150],
			["ItemMap",50],
			["ItemCompass",50],
			["ItemGPS",100],
			["ToolKit",2000],
			["ItemRadio",50],
			//Uniforms
			["U_C_Journalist",100],
			["U_Marshal",100],
			//Vests
			["V_Press_F",1000],
			//Hats
			["H_Cap_press",100]
			//Goggles
		];

		_backpacks = _backpacks + [

		];
	};

	case "gangster":
	{
		if (playerSide != civilian) exitWith {hint "Interdit aux civils !"; [[],[],[],[]];};
		if (!license_civ_gangster) exitWith {hint "Tu n'es pas gangster!"; [[],[],[],[]];};

		_weapons = _weapons + [
			["Rangefinder",10000],
			//Sniper
			//Fusils d'assault haut niveau
			["arifle_Katiba_F",350000],
			//Fusils d'assault moyens
			//Fusils bas de gamme
			["arifle_Mk20_F",100000],
			["arifle_Mk20_GL_F",120000],
			["arifle_TRG20_F",100000],
			["arifle_TRG21_GL_F",120000],
			//SMGs
			//Pistolets Lourds
			["hgun_ACPC2_F",18000]
			//Pistolets Légers
		];

		_magazines = _magazines + [
			["30Rnd_65x39_caseless_green",500],
			["UGL_FlareWhite_F",2000],
			["UGL_FlareGreen_F",2000],
			["UGL_FlareRed_F",2000],
			["UGL_FlareYellow_F",2000],
			["UGL_FlareCIR_F",2000],
			["30Rnd_9x21_Mag",200],
			["9Rnd_45ACP_Mag",100]
		];

		_items = _items + [
			//VISEURS
			["optic_DMS",10000],
			["optic_NVS",10000],
			["optic_Arco",6000],
			["optic_Hamr",6000],
			["optic_MRCO",3000],
			["optic_ACO_grn",2000],
			["optic_Aco",2000],
			["optic_Holosight",2000],
			//Silencieux
			["muzzle_snds_M",1000],
			["muzzle_snds_H",1000],
			//Accessoires Arme Secondaire
			["optic_Yorris",1000],
			["optic_MRD",1000],
			["muzzle_snds_L",1000],
			["muzzle_snds_acp",1000],
			//OBJETS
			["NVGoggles_OPFOR",2000],
			//Uniforms
			//Hats
			["H_Bandanna_camo",650],
			["H_Booniehat_dgtl",650],
			["H_Cap_brn_SPECOPS",650],
			["H_Cap_tan_specops_US",650],
			["H_Cap_khaki_specops_UK",650],
			["H_Cap_blk_Raven",650],
			["H_Bandanna_mcamo",650],
			//Glasses
			["G_Balaclava_lowprofile",1000],
			["G_Balaclava_combat",1000],
			["G_Bandanna_aviator",1500],
			["G_Bandanna_sport",1500],
			["G_Bandanna_oli",1500],
			["G_Bandanna_shades",1500],
			//Vest
			["V_PlateCarrierGL_rgr",17500],
			["V_PlateCarrierIAGL_dgtl",15000]
			//["V_TacVest_camo",12500],
			//["V_I_G_resistanceLeader_F",7500]
		];

		_backpacks = _backpacks + [
			//Backpacks
			//20 slots
			//70 slots
			["B_Parachute",2500]
		];
	};

	case "depan":
	{
		if (playerSide != independent) exitWith {hint "Tu ne fais pas partie des slots dépanneurs!"; [[],[],[],[]];};
		if (__GETC__(life_depanLevel) == 0) exitWith {hint "Tu ne fais pas partie des slots dépanneurs!"; [[],[],[],[]];};

		_weapons = [
			["Rangefinder",10000]
		];

		_items = [
			["Binocular",150],
			["ItemMap",50],
			["ItemCompass",50],
			["ItemWatch",50],
			["ItemGPS",100],
			["ToolKit",0],
			["NVGoggles",2000],
			["ItemRadio",50],
			//Uniforms
			["U_Dep",0],
			//Hats
			["H_Cap_marshal",0],
        	["H_Cap_pmc",0],
        	["H_Capbw_pmc",0],
        	["H_Cap_surfer",0],
        	["H_PilotHelmetHeli_B",0],
        	//Glasses
			["G_Sport_Blackred",0],
			["LBG_Shemagh_OD",0],
			["G_Sport_Checkered",0],
			["G_Sport_Blackyellow",0],
			["G_Sport_BlackWhite",0],
			//Vests
			["V_BandollierB_blk",0]
		];

		_backpacks = _backpacks + [
			//Backpacks
			["B_AssaultPack_rgr",0],
			["B_AssaultPack_blk",0],
			["B_Kitbag_mcamo",0],
			["B_Bergen_blk",0],
			["B_Bergen_mcamo",0],
			["B_TacticalPack_mcamo",0],
			["B_TacticalPack_blk",0],
			["B_TacticalPack_rgr",0],
			["B_Carryall_mcamo",0],
			["B_Carryall_khk",0]
		];
	};

//////////////////////////////////////////////////////////////////////////////
////////////////	BORNHOLM	//////////////////////
//////////////////////////////////////////////////////////////////////////////
	case "rebel_b":
	{
		if (playerSide != civilian) then {hint "Vous n'etes pas un civil !"; [[],[],[],[]];};
		if (!license_civ_rebel) then {hint "Tu n'as pas ta licence d'entrainement Rebelle!"; [[],[],[],[]];};

		_weapons = _weapons + [
			["Rangefinder",10000],
			//Fusils d'assault Haut niveau
			["arifle_Katiba_F",350000],
			//Fusils d'assault Moyen
			//Fusils bas de gamme
			["arifle_Mk20_F",100000],
			["arifle_Mk20_GL_F",120000],
			//Pistolets Lourds
			["hgun_Pistol_heavy_02_F",20000]
		];

		_magazines = _magazines + [
			//Fusils d'assault Haut niveau
			["30Rnd_65x39_caseless_green",300],
			//Fusils d'assault Moyen
			//Fusils d'assault bas de gamme
			//Pistolets Lourds
			["6Rnd_45ACP_Cylinder",200]
		];

		_items = _items + [
			//VISEURS
			["optic_ACO_grn",2000],
			["optic_Aco",2000],
			["optic_Holosight",2000],
			//Accessoires
			["acc_pointer_IR",1000],
			["acc_flashlight",1000],
			//Accessoires Arme Secondaire
			["optic_Yorris",1000],
			["optic_MRD",1000],
			//Divers
			["ToolKit",200],
			["NVGoggles_OPFOR",2002],
			["itemgps",50],
			["itemCompass",50],
			//Uniforms
			["U_IG_Guerilla1_1",5000],
			["U_I_CombatUniform_tshirt",15500],
			["U_O_CombatUniform_oucamo",17500],
			["U_O_SpecopsUniform_blk",17500],
			["U_O_OfficerUniform_ocamo",17500],
			["U_O_PilotCoveralls",15600],
			["U_IG_leader",15500],
			["U_I_OfficerUniform",16000],
			["U_O_GhillieSuit",80000],
			//Hats
			["H_ShemagOpen_tan",850],
			["H_Shemag_olive",850],
			["H_ShemagOpen_khk",800],
			["H_Shemag_tan",800],
			["H_Shemag_olive_hs",750],
			["H_HelmetO_ocamo",2500],
			["H_MilCap_oucamo",1200],
			["H_HelmetCrew_I",500],
			["H_Bandanna_camo",650],
			["H_Booniehat_dgtl",650],
			["H_Cap_brn_SPECOPS",650],
			["H_Cap_tan_specops_US",650],
			["H_Cap_khaki_specops_UK",650],
			["H_Cap_blk_Raven",650],
			["H_Bandanna_mcamo",650],
			//Glasses
			["G_Balaclava_lowprofile",1000],
			["G_Balaclava_combat",1000],
			["G_Bandanna_aviator",1500],
			["G_Bandanna_sport",1500],
			["G_Bandanna_oli",1500],
			["G_Bandanna_shades",1500],
			["G_Combat",55],
			//Vests
			["V_PlateCarrierGL_rgr",17500],
			["V_PlateCarrierIAGL_dgtl",15000],
			["V_Chestrig_oli",12500],
			["V_TacVest_camo",12500],
			["V_I_G_resistanceLeader_F",7500]
		];

		_backpacks = _backpacks + [
			//55 slots
			["B_TacticalPack_ocamo",7000],
			["B_TacticalPack_oli",7000],
			//70 slots
			["B_Carryall_ocamo",10000],
			["B_Parachute",2500]
		];
	};

	case "hunter_b":
	{
		if (playerSide != civilian) exitWith {hint "Tu n'es pas Civil."; [[],[],[],[]];};
		if (!license_civ_gun) exitWith {hint "Tu n'as pas le permis de port d'arme."; [[],[],[],[]];};
		if (!license_civ_bounty_hunter) exitWith {hint "Tu n'es pas chasseur de primes !"; [[],[],[],[]];};

		_weapons = _weapons + [
			["Rangefinder",10000],
			//Non lethal
			//arme 6.5mm exclusif gendarmerie & chasseur de prime
			["arifle_MXC_F",350000],
			["arifle_MX_Black_F",350000]
		];
		_magazines = _magazines + [
			["30Rnd_65x39_caseless_mag",1000]
		];
		_items = _items + [
			["optic_ACO_grn",2000],
			["optic_Aco",2000],
			["optic_Holosight",2000],
			//Silencieux
			["muzzle_snds_H",7000],
			["muzzle_snds_M",4000]
			//Objet spéciaux
			//Uniforms
			//PACK MOD PMC
			//Hats
			//Glasses
			//Vests
		];

		_backpacks = _backpacks + [
			["B_Parachute",0]
		];
	};

	case "gangster_b":
	{
		if (playerSide != civilian) exitWith {hint "Interdit aux civils !"; [[],[],[],[]];};
		if (!license_civ_gangster) exitWith {hint "Tu n'es pas gangster!"; [[],[],[],[]];};

		_weapons = _weapons + [
			["Rangefinder",10000],
			//Fusils haut de gamme
			//Fusils bas de gamme
			["arifle_Mk20_F",100000],
			["arifle_Mk20_GL_F",120000],
			["arifle_TRG20_F",100000],
			["arifle_TRG21_GL_F",120000],
			//SMGs
			//Pistolets Lourds
			["hgun_ACPC2_F",18000]
			//Pistolets Légers
		];

		_magazines = _magazines + [
			//Fusils
			//SMGs
			["30Rnd_9x21_Mag",200]
			//Pistolets Lourds
			//Pistolets Légers
		];

		_items = _items + [
			//VISEURS
			["optic_ACO_grn",2000],
			["optic_Aco",2000],
			["optic_Holosight",2000],
			//Accessoires Arme Secondaire
			["optic_Yorris",1000],
			["optic_MRD",1000],
			//OBJETS
			["NVGoggles_OPFOR",2000],
			//Uniforms
			//Hats
			["H_Bandanna_camo",650],
			["H_Booniehat_dgtl",650],
			["H_Cap_brn_SPECOPS",650],
			["H_Cap_tan_specops_US",650],
			["H_Cap_khaki_specops_UK",650],
			["H_Cap_blk_Raven",650],
			["H_Bandanna_mcamo",650],
			//Glasses
			["G_Balaclava_lowprofile",1000],
			["G_Balaclava_combat",1000],
			["G_Bandanna_aviator",1500],
			["G_Bandanna_sport",1500],
			["G_Bandanna_oli",1500],
			["G_Bandanna_shades",1500],
			//Vest
			["V_PlateCarrierGL_rgr",17500],
			["V_PlateCarrierIAGL_dgtl",15000]
		];

		_backpacks = _backpacks + [
			//Backpacks

			["B_AssaultPack_blk",2000],
			["B_AssaultPack_cbr",2000],
			["B_AssaultPack_khk",2000],
			["B_AssaultPack_sgg",2000],
			["B_AssaultPack_rgr",2000],

			["B_FieldPack_cbr",4000],
			["B_FieldPack_blk",4000],
			["B_Kitbag_mcamo",4000],

			["B_Kitbag_sgg",7000],
			["B_Kitbag_cbr",7000],
			["B_Bergen_sgg",7000],

			["B_Carryall_oucamo",10000],
			["B_Carryall_oli",10000],
			["B_Carryall_cbr",10000],
			["B_Carryall_khk",10000],
			["B_Parachute",2500]
		];
	};

	case "cop_shop_b":
	{
		if (playerSide != west) exitWith {hint "Tu n'es pas Gendarme."; [[],[],[],[]];};

		//Equipement GAV
		if (__GETC__(life_coplevel) >= 1) then
		{
			_weapons = [
				["Rangefinder",2000],
				["arifle_sdar_F",5000],
				["SMG_02_F",10000]
			];
			_magazines = [
				["30Rnd_9x21_Mag",50],
				["20Rnd_556x45_UW_mag",50]
			];
			_items = [
				//Viseurs
				["optic_Aco",1200],
				//Objets
				["ItemMap",50],
				["ItemCompass",50],
				["ItemWatch",50],
				["ItemGPS",100],
				["ToolKit", 2000],
				["Chemlight_red",300],
				["Chemlight_green",300],
				["Chemlight_blue",300],
				["ItemRadio",50],
				//Uniforms
				["U_O_Wetsuit",0],
				//Hats
				["H_Cap_blk",0],
				//Glasses
				["G_Diving",0],
				//Vests
				["V_RebreatherB",0]
			];

			_backpacks = _backpacks + [
				["B_Kitbag_rgr",0],
				["B_Parachute",0]
			];
		};

		//Equipement Gendarme
		if (__GETC__(life_coplevel) >= 4) then
		{
			_weapons = _weapons + [

			];

			_magazines = _magazines + [

			];

			_items = _items + [
				//Viseurs
				["optic_Hamr",1200],
				//Objets
				["SmokeShell",100],
				["acc_flashlight",750],
				//Hats
				["H_Beret_blk",0]
				//lunettes
				//Medical
			];
		};

		//Equipement Adjudant
		if (__GETC__(life_coplevel) >= 5) then
		{
			_weapons = _weapons + [
				["arifle_MX_Black_F",107000]
			];

			_magazines = _magazines + [
				["30Rnd_65x39_caseless_mag",50]
			];

			_items = _items + [
				//viseurs
				//Hats
				["Beret_Brown",0]
				//Vests
			];
		};

		//Equipement Major
		if (__GETC__(life_coplevel) >= 7) then
		{
			_weapons = _weapons + [

			];

			_magazines = _magazines + [

			];

			_items = _items + [
				//objets
				["acc_pointer_IR",1000],
				//Hats
				["Beret_Red",0]
			];
		};

		//Equipement Lieutenant
		if (__GETC__(life_coplevel) >= 9) then
		{
			_weapons = _weapons + [

			];

			_items = _items + [
				//viseurs
				// ["optic_DMS",10000], en attente
				//Hats
				["Beret_Blue",0]
				//Vest
			];
		};

		//Equipement Capitaine
		if (__GETC__(life_coplevel) >= 10) then
		{
			_weapons = _weapons + [
				["arifle_MX_SW_Black_F",375000]
			];

			_magazines = _magazines + [
				["100Rnd_65x39_caseless_mag_Tracer",700]
			];

			_items = _items + [
				["muzzle_snds_H",1000],
				// ["optic_NVS",10000], en attente
				["Beret_Green",0]
			];
		};

		//Equipement Colonel
		if (__GETC__(life_coplevel) >= 12) then
		{
			_weapons = _weapons + [
				["arifle_MXM_Black_F",400000]
			];

			_items = _items + [
				["H_Beret_02",0]
			];
		};

		//Equipement General
		if (__GETC__(life_coplevel) >= 13) then
		{
			_items = _items + [
				//beret
				["H_Beret_Colonel",0]
				//tenues
				//vest
			];
		};
	};
};
//Donator & gang area discount

_coef = 1;
if (playerSide == civilian) then
{
	switch (__GETC__(life_donator)) do {
    	case 0: {_coef = 1;};
    	case 1: {_coef = 0.85;};
    	case 2: {_coef = 0.80;};
    	case 3: {_coef = 0.75;};
	};
	if (_isGangShop) then {_coef = _coef * 0.9;};
};

if (_coef < 1) then
{
	{
		_weapons set [_forEachIndex, [_x select 0, round((_x select 1) * _coef)]];
	} forEach _weapons;
};

_return = [_weapons];
_return pushBack _magazines;
_return pushBack _items;
_return pushBack _backpacks;

_return;