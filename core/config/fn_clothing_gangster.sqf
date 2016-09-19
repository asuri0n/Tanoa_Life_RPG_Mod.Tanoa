/*
	File: fn_clothing_gangster.sqf
	Author: Johnny

	Description:
	Configuration pour le magasin de vêtement gangster //Added 08/09/14 Johnny

	REFAIRE COMPLETEMENT SHOP GANGSTER
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Magasin Gangster"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_PMC_IndUniformRS_BSBPBB",nil,12500],
			["U_PMC_IndUniformRS_TSTPTB",nil,12500],
			["U_PMC_IndUniformRS_GSTPTB",nil,12500],
			["U_PMC_IndUniformRS_TSGPTB",nil,12500],
			["U_PMC_IndUniformRS_BSTPTB",nil,12500],
			["U_PMC_IndUniformRS_TSBPTB",nil,12500],
			["U_PMC_IndUniformRS_BSGPBB",nil,12500],
			["U_PMC_IndUniformRS_BSYPTB",nil,12500],
			["U_PMC_IndUniformRS_GSGPBB",nil,12500],
			["U_PMC_IndUniformRS_GSBPBB",nil,12500],
			["U_PMC_IndUniformRS_GSYPTB",nil,12500],
			["U_PMC_IndUniformRS_YSYPTB",nil,12500],
			["U_PMC_IndUniformRS_YSBPBB",nil,12500],
			["U_PMC_IndUniformRS_YSGPTB",nil,12500],
			["U_PMC_IndUniformLS_BSBPBB",nil,12500],
			["U_PMC_CombatUniformLS_BSGPBB",nil,12500],
			["U_PMC_CombatUniformLS_SSGPSB",nil,12500],
			["U_PMC_CombatUniformLS_ChckDBS_GPSB",nil,12500],
			["U_PMC_CombatUniformLS_ChckLB_GPBB",nil,12500],
			["U_PMC_CombatUniformLS_ChckLR_SPBB",nil,12500],
			["U_PMC_CombatUniformLS_ChckP_BPBB",nil,12500],
			["U_PMC_CombatUniformLS_BSGPSB",nil,12500],
			["U_PMC_CombatUniformLS_BSSPBB",nil,12500],
			["U_PMC_CombatUniformLS_GSBPBB",nil,12500],
			["U_PMC_CombatUniformLS_IndPBSBB",nil,12500],
			["U_PMC_CombatUniformRS_ChckDBS_GPSB",nil,12500],
			["U_PMC_CombatUniformRS_ChckLB_GPBB",nil,12500],
			["U_PMC_CombatUniformRS_ChckLR_SPBB",nil,12500],
			["U_PMC_CombatUniformRS_ChckP_BPBB",nil,12500],
			["U_PMC_CombatUniformLS_GSSPBB",nil,12500],
			["U_PMC_CombatUniformLS_SSGPBB",nil,12500],
			["U_Bblue",nil,12500],
			["UVF_Soldier_Outfit_2",nil,12500],
			["IRA_Soldier_Outfit_4",nil,12500],
			["IRA_Soldier_Outfit_11",nil,12500],
			["IRA_Soldier_Outfit_2",nil,12500],
			["IRA_Soldier_Outfit_3",nil,12500],
			["IRA_Soldier_Outfit_1",nil,12500],
			["IRA_Soldier_Outfit_7",nil,12500],
			["IRA_Soldier_Outfit_5",nil,12500],
			["UVF_Soldier_Outfit_7",nil,12500],
			["IRA_Soldier_Outfit_9",nil,12500],
			["U_BG_Guerrilla_6_1",nil,12500],
			["U_Guerilla_blue",nil,12500],
			["U_Guerilla_blk",nil,12500],
			["U_BG_Guerilla2_3",nil,12500],
			["U_BG_Guerilla2_1",nil,12500],
			["U_I_G_Story_Protagonist_F",nil,12500],
			["IRA_Soldier_Outfit_6",nil,12500],
			["UVF_Soldier_Outfit_8",nil,12500],
			["IRA_Soldier_Outfit_8",nil,12500],
			["UVF_Soldier_Outfit_5",nil,12500],
			["UVF_Soldier_Outfit_6",nil,12500],
			["U_I_G_Story_Protagonist_F",nil,12500]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_Booniehat_grn",nil,50],
			["H_Booniehat_tan",nil,50],
			["H_Booniehat_dirty",nil,50],
			["H_Bandanna_khk",nil,50],
			["H_Bandanna_cbr",nil,50],
			["H_Bandanna_sgg",nil,50],
			["H_Bandanna_gry",nil,50],
			["H_Watchcap_blk",nil,50],
			["H_Watchcap_khk",nil,50],
			["H_Watchcap_sgg",nil,50],
			["H_Watchcap_camo",nil,50],
			["H_Bandanna_camo",nil,650],
			["H_Booniehat_dgtl",nil,650],
			["H_Cap_brn_SPECOPS",nil,650],
			["H_Cap_tan_specops_US",nil,650],
			["H_Cap_khaki_specops_UK",nil,650],
			["H_Cap_blk_Raven",nil,650],
			["H_Bandanna_mcamo",nil,650]
		];
	};

	//Glasses
	case 2:
	{
		[	
			["G_mas_wpn_bala",nil,700],
			["G_mas_wpn_bala_gog_b",nil,700],
			["G_mas_wpn_bala_b",nil,700],
			["G_Bandanna_aviator",nil,700],
			["G_mas_wpn_shemag_gog",nil,700],
			["G_mas_wpn_shemag_mask",nil,700],
			["G_mas_wpn_shemag_w",nil,700],
			["G_mas_wpn_shemag",nil,700],
			["G_mas_wpn_wrap_b",nil,700],
			["G_mas_wpn_wrap_gog_g",nil,700],
			["G_mas_wpn_wrap_gog_c",nil,700],
			["G_mas_wpn_wrap_g",nil,700],
			["G_mas_wpn_wrap_c",nil,700],
			["G_mas_wpn_wrap_t",nil,700],
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Balaclava_blk",nil,1000],
			["G_Balaclava_lowprofile",nil,1000],
			["G_Balaclava_combat",nil,1000],
			["G_Balaclava_oli",nil,1000],
			["G_Bandanna_aviator",nil,1500],
			["G_Bandanna_beast",nil,1500],
			["G_Bandanna_tan",nil,1500],
			["G_Bandanna_sport",nil,1500],
			["G_Bandanna_blk",nil,1500],
			["G_Bandanna_oli",nil,1500],
			["G_Bandanna_shades",nil,1500],			
			["G_mas_wpn_wrap_gog_c",nil,1500],
			["G_mas_wpn_wrap_mask_c",nil,1500],
			["G_mas_wpn_wrap_c",nil,1500],
			["G_mas_wpn_shemag_r",nil,1500],			
			["G_Combat",nil,55]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_BandollierB_cbr",nil,4500],			
			["V_BandollierB_cbr",nil,4500],
			["V_BandollierB_khk",nil,4500],
			["V_BandollierB_blk",nil,4500],
			["V_BandollierB_oli",nil,4500],
			["V_BandollierB_rgr",nil,4500],
			["V_Rangemaster_belt",nil,4500],
			["V_TacVest_khk",nil,15000],
			["V_TacVest_brn",nil,15000],
			["V_TacVest_oli",nil,15000],
			["V_I_G_resistanceLeader_F",nil,15000],
			["V_PlateCarrierIAGL_dgtl",nil,17500]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_FieldPack_ocamo","20 places",1000],

			["B_AssaultPack_blk","30 places",2000],
			["B_AssaultPack_cbr","30 places",2000],
			["B_AssaultPack_khk","30 places",2000],
			["B_AssaultPack_sgg","30 places",2000],
			["B_AssaultPack_rgr","30 places",2000],

			["B_FieldPack_cbr","40 places",4000],
			["B_FieldPack_blk","40 places",4000],
			["B_Kitbag_mcamo","40 places",4000],

			["B_Kitbag_sgg","55 places",7000],
			["B_Kitbag_cbr","55 places",7000],
			["B_Bergen_sgg","55 places",7000],

			["B_Carryall_oucamo","70 places",10000],
			["B_Carryall_oli","70 places",10000],
			["B_Carryall_cbr","70 places",10000],
			["B_Carryall_khk","70 places",10000],
			["B_Parachute",nil,2500]
		];
	};
};