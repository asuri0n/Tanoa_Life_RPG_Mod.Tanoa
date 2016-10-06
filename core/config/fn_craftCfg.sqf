#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch (true) do
		{
			case (license_civ_rebel): {
				["Equipements rebelles",
					[
					// ARMES
							["hgun_ACPC2_F", ["life_inv_ironp",5,"life_inv_plastiquep",7, "life_inv_goldp",2]],
								["9Rnd_45ACP_Mag", ["life_inv_poudrenoirp",1]],

							["hgun_Pistol_heavy_01_F", ["life_inv_ironp",5,"life_inv_plastiquep",7, "life_inv_goldp",2]],
								["11Rnd_45ACP_Mag", ["life_inv_poudrenoirp",1]],

							["hgun_Pistol_heavy_02_F", ["life_inv_ironp",5,"life_inv_plastiquep",7, "life_inv_goldp",2]],
								["6Rnd_45ACP_Cylinder", ["life_inv_poudrenoirp",1]],

							["arifle_CTAR_hex_F", ["life_inv_ironp",30,"life_inv_plastiquep",50,"life_inv_goldp",10]],
								["30Rnd_580x42_Mag_F", ["life_inv_poudrenoirp",1]],

							["arifle_Mk20_F", ["life_inv_ironp",5,"life_inv_plastiquep",10,"life_inv_goldp",5]],
							["arifle_SDAR_F", ["life_inv_ironp",5,"life_inv_plastiquep",10,"life_inv_goldp",5]],
							["arifle_SPAR_01_khk_F", ["life_inv_ironp",10,"life_inv_plastiquep",20,"life_inv_goldp",10]],
							["arifle_SPAR_01_snd_F", ["life_inv_ironp",10,"life_inv_plastiquep",20,"life_inv_goldp",10]],
								["30Rnd_556x45_Stanag", ["life_inv_poudrenoirp",1]],

							["arifle_AKS_F", ["life_inv_ironp",10,"life_inv_plastiquep",20,"life_inv_goldp",5]],
								["30Rnd_545x39_Mag_F", ["life_inv_poudrenoirp",1]],

							// VISEURS
							["optic_MRCO", ["life_inv_diamantpurp",1,"life_inv_plastiquep",2]],
							["optic_Arco", ["life_inv_diamantpurp",1,"life_inv_plastiquep",2]],
							["optic_Hamr", ["life_inv_diamantpurp",1,"life_inv_plastiquep",2]],
							["optic_ACO_grn", ["life_inv_diamantpurp",1,"life_inv_plastiquep",2]],
							["optic_Aco", ["life_inv_diamantpurp",1,"life_inv_plastiquep",2]],
							["optic_Holosight", ["life_inv_diamantpurp",1,"life_inv_plastiquep",2]],
							["optic_DMS", ["life_inv_diamantpurp",5,"life_inv_plastiquep",10]],
							["optic_NVS", ["life_inv_diamantpurp",1,"life_inv_plastiquep",2]],

							// SILENCIEUX
							["muzzle_snds_58_wdm_F", ["life_inv_ironp",3,"life_inv_tissup",5,"life_inv_plastiquep",5]],
							["muzzle_snds_B_snd_F", ["life_inv_ironp",3,"life_inv_tissup",5,"life_inv_plastiquep",5]],
							["muzzle_snds_B_khk_F", ["life_inv_ironp",3,"life_inv_tissup",5,"life_inv_plastiquep",5]],
							["muzzle_snds_65_TI_ghex_F", ["life_inv_ironp",3,"life_inv_tissup",5,"life_inv_plastiquep",5]],
							["muzzle_snds_65_TI_hex_F", ["life_inv_ironp",3,"life_inv_tissup",5,"life_inv_plastiquep",5]],

							// UNIFORMES

							["U_B_Wetsuit", ["life_inv_tissup",4,"life_inv_plastiquep",2]],
							["U_OG_Guerilla1_1", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_BG_leader", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_BG_Guerilla2_1", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_BG_Guerilla2_2", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_BG_Guerilla2_3", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_I_C_Soldier_Para_1_F", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_I_C_Soldier_Para_2_F", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_I_C_Soldier_Para_3_F", ["life_inv_tissup",7,"life_inv_plastiquep",2]],
							["U_I_C_Soldier_Para_4_F", ["life_inv_tissup",7,"life_inv_plastiquep",2]],

							["U_I_CombatUniform_shortsleeve", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_B_CombatUniform_mcam_worn", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_I_OfficerUniform", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_I_CombatUniform", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_PilotCoveralls", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_OfficerUniform_ocamo", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_CombatUniform_oucamo", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_CombatUniform_ocamo", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_B_CTRG_Soldier_2_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_B_CTRG_Soldier_3_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_T_Soldier_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_T_Officer_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_V_Soldier_Viper_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_O_V_Soldier_Viper_hex_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_I_C_Soldier_Camo_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_B_CTRG_Soldier_urb_2_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_B_CTRG_Soldier_urb_1_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],
							["U_B_CTRG_Soldier_urb_3_F", ["life_inv_tissup",10,"life_inv_plastiquep",2]],

							["U_O_T_Sniper_F", ["life_inv_tissup",30,"life_inv_plastiquep",20,"life_inv_diamantpurp",1]],
							["U_B_T_FullGhillie_tna_F", ["life_inv_tissup",50,"life_inv_plastiquep",25,"life_inv_diamantpurp",5]],
							["U_O_T_FullGhillie_tna_F", ["life_inv_tissup",50,"life_inv_plastiquep",25,"life_inv_diamantpurp",5]],
							["U_O_FullGhillie_ard", ["life_inv_tissup",50,"life_inv_plastiquep",25,"life_inv_diamantpurp",5]],

							// CHAPEAUX

							["H_Shemag_tan", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_Shemag_olive", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_Shemag_olive_hs", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_ShemagOpen_khk", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_ShemagOpen_tan", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_BandMask_reaper", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetB_snakeskin", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetB_grass", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetB_sand", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetCrew_I", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetCrew_O", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetLeaderO_ocamo", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetLeaderO_oucamo", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetSpecB_blk", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetB_camo", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_MilCap_ocamo", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetSpecB", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_MilCap_dgtl", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetB_plain_blk", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_Cap_blk", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_MilCap_gry", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_Helmet_Skate", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetB_TI_tna_F", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetB_Light_tna_F", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetSpecO_ghex_F", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetLeaderO_ghex_F", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetO_ghex_F", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_HelmetCrew_O_ghex_F", ["life_inv_tissup",1,"life_inv_planchep",2]],
							["H_MilCap_ghex_F", ["life_inv_tissup",1,"life_inv_planchep",2]],

							// LUNETTES / MASQUES

							["G_Balaclava_blk", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Balaclava_lowprofile", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Balaclava_combat", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Balaclava_oli", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_aviator", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_beast", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_tan", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_sport", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_blk", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_oli", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_shades", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Bandanna_khk", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["G_Combat", ["life_inv_tissup",2,"life_inv_plastiquep",1]],

							// VESTES

							["V_RebreatherB", ["life_inv_tissup",3,"life_inv_plastiquep",1,"life_inv_ironp",1]],

							["V_BandollierB_oli", ["life_inv_tissup",1,"life_inv_plastiquep",1]],
							["V_Rangemaster_belt", ["life_inv_tissup",1,"life_inv_plastiquep",1]],
							["V_BandollierB_blk", ["life_inv_tissup",1,"life_inv_plastiquep",1]],
							["V_BandollierB_ghex_F", ["life_inv_tissup",1,"life_inv_plastiquep",1]],

							["V_HarnessO_ghex_F", ["life_inv_tissup",4,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_HarnessOGL_ghex_F", ["life_inv_tissup",4,"life_inv_plastiquep",1,"life_inv_ironp",1]],

							["V_HarnessOGL_brn", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_HarnessOGL_gry", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_Chestrig_khk", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_Chestrig_oli", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_Chestrig_rgr", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_HarnessO_gry", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_HarnessO_brn", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],
							["V_Chestrig_blk", ["life_inv_tissup",5,"life_inv_plastiquep",1,"life_inv_ironp",1]],

							["V_PlateCarrier1_rgr", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],
							["V_PlateCarrier_Kerry", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],
							["V_PlateCarrierIA1_dgtl", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],
							["V_PlateCarrier2_rgr_noflag_F", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],
							["V_PlateCarrier1_blk", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],
							["V_TacVest_blk", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],
							["V_TacVestIR_blk", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],
							["V_PlateCarrier1_rgr_noflag_F", ["life_inv_tissup",5,"life_inv_plastiquep",3,"life_inv_ironp",1]],

							// BACKPACKS

							["B_Parachute", ["life_inv_tissup",1,"life_inv_plastiquep",1]],

							["B_AssaultPack_khk", ["life_inv_tissup",2]],
							["B_AssaultPack_dgtl", ["life_inv_tissup",2]],
							["B_AssaultPack_rgr", ["life_inv_tissup",2]],
							["B_AssaultPack_sgg", ["life_inv_tissup",2]],
							["B_AssaultPack_blk", ["life_inv_tissup",2]],
							["B_AssaultPack_cbr", ["life_inv_tissup",2]],
							["B_AssaultPack_mcamo", ["life_inv_tissup",2]],

							["B_FieldPack_blk", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["B_FieldPack_ocamo", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["B_FieldPack_oucamo", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["B_FieldPack_cbr", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["B_Bergen_blk", ["life_inv_tissup",2,"life_inv_plastiquep",1]],
							["B_FieldPack_ghex_F", ["life_inv_tissup",2,"life_inv_plastiquep",1]],

							["B_Kitbag_cbr", ["life_inv_tissup",3,"life_inv_plastiquep",1]],
							["B_Kitbag_mcamo", ["life_inv_tissup",3,"life_inv_plastiquep",1]],
							["B_Kitbag_sgg", ["life_inv_tissup",3,"life_inv_plastiquep",1]],
							["B_Carryall_khk", ["life_inv_tissup",3,"life_inv_plastiquep",1]],

							["B_ViperHarness_hex_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_ViperLightHarness_khk_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_ViperLightHarness_hex_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_ViperLightHarness_oli_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_ViperLightHarness_ghex_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_ViperHarness_oli_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_ViperHarness_khk_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_ViperHarness_ghex_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_ocamo", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_oucamo", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_mcamo", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_oli", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_cbr", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_ghex_F", ["life_inv_tissup",3,"life_inv_plastiquep",2]],

							["B_Bergen_hex_F", ["life_inv_tissup",5,"life_inv_plastiquep",3]],
							["B_Bergen_dgtl_F", ["life_inv_tissup",5,"life_inv_plastiquep",3]],
							["B_Bergen_mcamo_F", ["life_inv_tissup",5,"life_inv_plastiquep",3]]
					]
				];
			};
			case (license_civ_gun): {
				["Equipements civiles",
					[
					// ARMES
							["hgun_P07_F", ["life_inv_ironp",2,"life_inv_plastiquep",2, "life_inv_goldp",1]],
							["hgun_Rook40_F", ["life_inv_ironp",2,"life_inv_plastiquep",2, "life_inv_goldp",1]],
								["16Rnd_9x21_Mag", ["life_inv_poudrenoirp",1]],

							["hgun_ACPC2_F", ["life_inv_ironp",2,"life_inv_plastiquep",2, "life_inv_goldp",1]],
								["9Rnd_45ACP_Mag", ["life_inv_poudrenoirp",1]],

							["hgun_Pistol_heavy_01_F", ["life_inv_ironp",2,"life_inv_plastiquep",2, "life_inv_goldp",1]],
								["11Rnd_45ACP_Mag", ["life_inv_poudrenoirp",1]],

							["hgun_Pistol_heavy_02_F", ["life_inv_ironp",2,"life_inv_plastiquep",2, "life_inv_goldp",1]],
								["6Rnd_45ACP_Cylinder", ["life_inv_poudrenoirp",1]],

							["hgun_PDW2000_F", ["life_inv_ironp",5,"life_inv_plastiquep",5,"life_inv_goldp",2]],
								["30Rnd_9x21_Mag", ["life_inv_poudrenoirp",1]],

							//["arifle_Mk20_plain_F", ["life_inv_ironp",10,"life_inv_plastiquep",5,"life_inv_goldp",4]],
							//["arifle_TRG21_F", ["life_inv_ironp",7,"life_inv_plastiquep",15,"life_inv_goldp",5]],
							//["arifle_SDAR_F", ["life_inv_ironp",10,"life_inv_plastiquep",5,"life_inv_goldp",4]],
							//	["30Rnd_556x45_Stanag", ["life_inv_poudrenoirp",1]],

							["SMG_05_F", ["life_inv_ironp",2,"life_inv_plastiquep",8,"life_inv_goldp",2]],
								["30Rnd_9x21_Mag_SMG_02", ["life_inv_poudrenoirp",1]]
					]
				];
			};
				case (playerside == west): {
				["",
					[

					]
				];
			};

			default {
				["Equipements",
					[
							// UNIFORMES
							["U_C_Scientist", ["life_inv_tissup",1,"life_inv_plastiquep",3]],

							["U_IG_Guerilla3_1", ["life_inv_tissup",1,"life_inv_plastiquep",1]],
							["U_IG_Guerilla2_3", ["life_inv_tissup",2]],
							["U_IG_Guerilla2_2", ["life_inv_tissup",2]],
							["U_OG_Guerilla2_3", ["life_inv_tissup",2]],
							["U_IG_Guerilla2_1", ["life_inv_tissup",2]],
							["U_C_HunterBody_grn", ["life_inv_tissup",2]],
							["U_I_G_Story_Protagonist_F", ["life_inv_tissup",2]],
							["U_I_G_resistanceLeader_F", ["life_inv_tissup",2]],
							["U_Competitor", ["life_inv_tissup",2]],
							["U_C_Journalist", ["life_inv_tissup",2]],
							["U_IG_Guerilla3_2", ["life_inv_tissup",2]],
							["U_C_WorkerCoveralls", ["life_inv_tissup",2]],
							["U_OrestesBody", ["life_inv_tissup",2]],
							["U_Marshal", ["life_inv_tissup",2]],
							["U_NikosAgedBody", ["life_inv_tissup",2]],
							["U_I_C_Soldier_Para_5_F", ["life_inv_tissup",2]],
							["U_I_C_Soldier_Bandit_1_F", ["life_inv_tissup",2]],
							["U_I_C_Soldier_Bandit_2_F", ["life_inv_tissup",2]],
							["U_I_C_Soldier_Bandit_3_F", ["life_inv_tissup",2]],
							["U_I_C_Soldier_Bandit_4_F", ["life_inv_tissup",2]],
							["U_I_C_Soldier_Bandit_5_F", ["life_inv_tissup",2]],
							["U_C_man_sport_1_F", ["life_inv_tissup",2]],
							["U_C_man_sport_2_F", ["life_inv_tissup",2]],
							["U_C_man_sport_3_F", ["life_inv_tissup",2]],
							["U_C_Man_casual_1_F", ["life_inv_tissup",2]],
							["U_C_Man_casual_2_F", ["life_inv_tissup",2]],
							["U_C_Man_casual_3_F", ["life_inv_tissup",2]],
							["U_C_Man_casual_4_F", ["life_inv_tissup",2]],
							["U_C_Man_casual_5_F", ["life_inv_tissup",2]],
							["U_C_Man_casual_6_F", ["life_inv_tissup",2]],

							// CASQUES
							["H_Cap_blk", ["life_inv_tissup",2]],
							["H_Cap_grn", ["life_inv_tissup",2]],
							["H_Cap_oli", ["life_inv_tissup",2]],
							["H_Cap_tan", ["life_inv_tissup",2]],
							["H_Cap_blk_Raven", ["life_inv_tissup",2]],
							["H_Cap_brn_SPECOPS", ["life_inv_tissup",2]],
							["H_Cap_blu", ["life_inv_tissup",2]],
							["H_Cap_red", ["life_inv_tissup",2]],
							["H_Cap_blk_CMMG", ["life_inv_tissup",2]],
							["H_Cap_blk_ION", ["life_inv_tissup",2]],
							["H_Cap_grn_BI", ["life_inv_tissup",2]],
							["H_Cap_press", ["life_inv_tissup",2]],
							["H_Cap_khaki_specops_UK", ["life_inv_tissup",2]],
							["H_Cap_tan_specops_US", ["life_inv_tissup",2]],
							["H_Hat_tan", ["life_inv_tissup",2]],
							["H_Hat_grey", ["life_inv_tissup",2]],
							["H_Hat_brown", ["life_inv_tissup",2]],
							["H_Hat_checker", ["life_inv_tissup",2]],
							["H_Hat_blue", ["life_inv_tissup",2]],
							["H_Hat_camo", ["life_inv_tissup",2]],
							["H_StrawHat", ["life_inv_tissup",2]],
							["H_StrawHat_dark", ["life_inv_tissup",2]],
							["H_Bandanna_camo", ["life_inv_tissup",2]],
							["H_Bandanna_cbr", ["life_inv_tissup",2]],
							["H_Bandanna_gry", ["life_inv_tissup",2]],
							["H_Bandanna_khk", ["life_inv_tissup",2]],
							["H_Bandanna_mcamo", ["life_inv_tissup",2]],
							["H_Bandanna_sgg", ["life_inv_tissup",2]],
							["H_Bandanna_surfer", ["life_inv_tissup",2]],
							["H_Booniehat_tan", ["life_inv_tissup",2]],
							["H_Booniehat_grn", ["life_inv_tissup",2]],
							["H_Booniehat_mcamo", ["life_inv_tissup",2]],
							["H_Booniehat_indp", ["life_inv_tissup",2]],

							// VESTES
							["V_Press_F", ["life_inv_tissup",1,"life_inv_plastiquep",1]],

							["V_BandollierB_cbr", ["life_inv_tissup",5,"life_inv_plastiquep",1]],
							["V_BandollierB_blk", ["life_inv_tissup",5,"life_inv_plastiquep",1]],
							["V_BandollierB_khk", ["life_inv_tissup",5,"life_inv_plastiquep",1]],
							["V_BandollierB_oli", ["life_inv_tissup",5,"life_inv_plastiquep",1]],
							["V_BandollierB_rgr", ["life_inv_tissup",5,"life_inv_plastiquep",1]],

							// BACKPACKS
							["B_AssaultPack_khk", ["life_inv_tissup",2]],
							["B_AssaultPack_dgtl", ["life_inv_tissup",2]],
							["B_AssaultPack_rgr", ["life_inv_tissup",2]],
							["B_AssaultPack_sgg", ["life_inv_tissup",2]],
							["B_AssaultPack_blk", ["life_inv_tissup",2]],
							["B_AssaultPack_cbr", ["life_inv_tissup",2]],
							["B_AssaultPack_mcamo", ["life_inv_tissup",2]],

							["B_FieldPack_blk", ["life_inv_tissup",1,"life_inv_plastiquep",1]],
							["B_FieldPack_ocamo", ["life_inv_tissup",1,"life_inv_plastiquep",1]],
							["B_FieldPack_oucamo", ["life_inv_tissup",1,"life_inv_plastiquep",1]],
							["B_FieldPack_cbr", ["life_inv_tissup",1,"life_inv_plastiquep",1]],

							["B_Carryall_ocamo", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_oucamo", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_mcamo", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_oli", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_khk", ["life_inv_tissup",3,"life_inv_plastiquep",2]],
							["B_Carryall_cbr", ["life_inv_tissup",3,"life_inv_plastiquep",2]],

							["B_Parachute", ["life_inv_tissup",2]]
					]
				];
			};
		};
	};
};


