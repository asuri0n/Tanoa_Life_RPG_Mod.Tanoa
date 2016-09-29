/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Reb shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack["U_B_Wetsuit",nil,10000];
		_ret pushBack["U_O_Wetsuit",nil,10000];


		_ret pushBack["U_BG_leader",nil,17000];
		_ret pushBack["U_I_CombatUniform_shortsleeve",nil,17000];
		_ret pushBack["U_B_CombatUniform_mcam_worn",nil,17000];
		_ret pushBack["U_I_OfficerUniform",nil,17000];
		_ret pushBack["U_I_CombatUniform",nil,17000];
		_ret pushBack["U_O_PilotCoveralls",nil,17000];
		_ret pushBack["U_O_OfficerUniform_ocamo",nil,17000];
		_ret pushBack["U_O_CombatUniform_oucamo",nil,17000];
		_ret pushBack["U_O_CombatUniform_ocamo",nil,17000];
		_ret pushBack["U_B_CTRG_Soldier_2_F",nil,17000];
		_ret pushBack["U_B_CTRG_Soldier_3_F",nil,17000];
		_ret pushBack["U_O_T_Soldier_F",nil,17000];
		_ret pushBack["U_O_T_Officer_F",nil,17000];
		_ret pushBack["U_I_C_Soldier_Camo_F",nil,17000];
		_ret pushBack["U_B_CTRG_Soldier_urb_2_F",nil,17000];
		_ret pushBack["U_B_CTRG_Soldier_urb_1_F",nil,17000];
		_ret pushBack["U_B_CTRG_Soldier_urb_3_F",nil,17000];
		_ret pushBack["U_B_CombatUniform_mcam",nil,17000];
		_ret pushBack["U_B_CombatUniform_mcam_tshirt",nil,17000];
		_ret pushBack["U_O_SpecopsUniform_ocamo",nil,17000];
		_ret pushBack["U_B_CombatUniform_mcam_vest",nil,17000];
		_ret pushBack["U_B_survival_uniform",nil,17000];
		_ret pushBack["U_B_CTRG_3",nil,17000];
		_ret pushBack["U_B_CTRG_1",nil,17000];
		_ret pushBack["U_B_CTRG_2",nil,17000];
		_ret pushBack["U_BG_Guerilla2_3",nil,17000];

		_ret pushBack["U_O_T_Sniper_F",nil,100000];
		_ret pushBack["U_B_T_Sniper_F",nil,100000];
		_ret pushBack["U_I_GhillieSuit",nil,100000];
		_ret pushBack["U_O_GhillieSuit",nil,100000];
		_ret pushBack["U_B_GhillieSuit",nil,100000];

		_ret pushBack["U_I_FullGhillie_ard",nil,150000];
		_ret pushBack["U_O_FullGhillie_ard",nil,150000];
		_ret pushBack["U_B_FullGhillie_ard",nil,150000];
		_ret pushBack["U_I_FullGhillie_lsh",nil,150000];
		_ret pushBack["U_B_FullGhillie_lsh",nil,150000];
		_ret pushBack["U_I_FullGhillie_sard",nil,150000];
		_ret pushBack["U_O_FullGhillie_sard",nil,150000];
		_ret pushBack["U_B_FullGhillie_sard",nil,150000];
		_ret pushBack["U_O_FullGhillie_lsh",nil,150000];

		_ret pushBack["U_B_T_FullGhillie_tna_F",nil,150000];
		_ret pushBack["U_O_T_FullGhillie_tna_F",nil,150000];

		// if(primaryWeapon player == "srifle_GM6_camo_F" OR primaryWeapon player == "srifle_mas_lrr" OR primaryWeapon player == "srifle_mas_svd") then
		// {
		// 	_ret pushBack["U_O_FullGhillie_ard",nil,200000];
		// };
	};

	//Hats
	case 1:
	{
		_ret =
		[
			["H_Shemag_tan",nil,2500],
			["H_Shemag_olive",nil,2500],
			["H_Shemag_olive_hs",nil,2500],
			["H_ShemagOpen_khk",nil,2500],
			["H_BandMask_reaper",nil,2500],
			["H_HelmetB_snakeskin",nil,2500],
			["H_HelmetB_grass",nil,2500],
			["H_HelmetB_sand",nil,2500],
			["H_HelmetCrew_I",nil,2500],
			["H_HelmetCrew_O",nil,2500],
			["H_HelmetLeaderO_ocamo",nil,2500],
			["H_HelmetLeaderO_oucamo",nil,2500],
			["H_HelmetSpecB_blk",nil,2500],
			["H_HelmetB_camo",nil,2500],
			["H_MilCap_ocamo",nil,2500],
			["H_HelmetSpecB",nil,2500],
			["H_ShemagOpen_tan",nil,2500],
			["H_MilCap_dgtl",nil,2500],
			["H_HelmetB_plain_blk",nil,2500],
			["H_Cap_blk",nil,2500],
			["H_MilCap_gry",nil,2500],
			["H_Helmet_Skate",nil,2500],
			["H_HelmetB_TI_tna_F",nil,2500],
			["H_HelmetB_Light_tna_F",nil,2500],
			["H_HelmetSpecO_ghex_F",nil,2500],
			["H_HelmetLeaderO_ghex_F",nil,2500],
			["H_HelmetO_ghex_F",nil,2500],
			["H_HelmetCrew_O_ghex_F",nil,2500],
			["H_MilCap_ghex_F",nil,2500]
		];
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_I_Diving",nil,5000],
			["G_O_Diving",nil,5000],
			["G_Balaclava_blk",nil,5000],
			["G_Balaclava_lowprofile",nil,5000],
			["G_Balaclava_combat",nil,5000],
			["G_Balaclava_oli",nil,5000],
			["G_Bandanna_aviator",nil,5000],
			["G_Bandanna_beast",nil,5000],
			["G_Bandanna_tan",nil,5000],
			["G_Bandanna_sport",nil,5000],
			["G_Bandanna_blk",nil,5000],
			["G_Bandanna_oli",nil,5000],
			["G_Bandanna_shades",nil,5000],
			["G_Bandanna_khk",nil,5000],
            ["G_Combat",nil,5000]
		];
	};

	//Vest
	case 3:
	{
		_ret =
		[
			["V_RebreatherB",nil,10000],
			["V_RebreatherIR",nil,10000],

			["V_BandollierB_oli",nil,4500],
			["V_Rangemaster_belt",nil,4500],
			["V_BandollierB_blk",nil,4500],
			["V_BandollierB_ghex_F",nil,4500],

			["V_HarnessO_ghex_F",nil,7500],
			["V_HarnessOGL_ghex_F",nil,7500],


			["V_HarnessOGL_brn",nil,12500],
			["V_HarnessOGL_gry",nil,12500],
			["V_Chestrig_khk",nil,12500],
			["V_Chestrig_oli",nil,12500],
			["V_Chestrig_rgr",nil,12500],
			["V_HarnessO_gry",nil,12500],
			["V_HarnessO_brn",nil,12500],
			["V_Chestrig_blk",nil,12500],

			["V_PlateCarrierL_CTRG",nil,17500],
			["V_PlateCarrierH_CTRG",nil,17500],
			["V_PlateCarrier_Kerry",nil,17500],
			["V_PlateCarrierIA1_dgtl",nil,17500],
			["V_PlateCarrier2_rgr_noflag_F",nil,17500],
			["V_PlateCarrier1_blk",nil,17500],
			["V_PlateCarrier1_rgr",nil,17500],
			["V_PlateCarrier1_tna_F",nil,17500],
			["V_TacVest_blk",nil,17500],
			["V_TacVestIR_blk",nil,17500],
			["V_PlateCarrier1_rgr_noflag_F",nil,17500]
		];
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute",nil,5000],

			["B_AssaultPack_khk",nil,2500],
			["B_AssaultPack_dgtl",nil,2500],
			["B_AssaultPack_rgr",nil,2500],
			["B_AssaultPack_sgg",nil,2500],
			["B_AssaultPack_blk",nil,2500],
			["B_AssaultPack_cbr",nil,2500],
			["B_AssaultPack_mcamo",nil,2500],

			["B_FieldPack_blk",nil,5000],
			["B_FieldPack_ocamo",nil,5000],
			["B_FieldPack_oucamo",nil,5000],
			["B_FieldPack_cbr",nil,5000],
			["B_Bergen_blk",nil,5000],
			["B_FieldPack_ghex_F",nil,5000],

			["B_Kitbag_cbr",nil,7000],
			["B_Kitbag_mcamo",nil,7000],
			["B_Kitbag_sgg",nil,7000],
			["B_Carryall_khk",nil,7000],

			["B_ViperHarness_hex_F",nil,10000],
			["B_ViperLightHarness_khk_F",nil,10000],
			["B_ViperLightHarness_hex_F",nil,10000],
			["B_ViperLightHarness_oli_F",nil,10000],
			["B_ViperLightHarness_ghex_F",nil,10000],
			["B_ViperHarness_khk_F",nil,10000],
			["B_ViperHarness_ghex_F",nil,10000],
			["B_Carryall_ocamo",nil,10000],
			["B_Carryall_oucamo",nil,10000],
			["B_Carryall_mcamo",nil,10000],
			["B_Carryall_oli",nil,10000],
			["B_Carryall_cbr",nil,10000],
			["B_Carryall_ghex_F",nil,10000],

			["B_Bergen_hex_F",nil,15000],
			["B_Bergen_dgtl_F",nil,15000],
			["B_Bergen_mcamo_F",nil,15000]
		];
	};
};

_ret;