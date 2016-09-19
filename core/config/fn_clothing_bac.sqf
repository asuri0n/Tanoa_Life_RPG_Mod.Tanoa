/*
	File: fn_clothing_bac.sqf
	Author: Johnny

	Description:
	Master configuration file for Bac shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
            ["U_OG_Guerilla1_1",nil,0],			
			["U_BG_leader",nil,0],			
			["U_BG_Guerilla2_1",nil,0],
			["U_BG_Guerilla2_2",nil,0],
			["U_BG_Guerilla2_3",nil,0],			
			["U_BG_Guerilla1_1",nil,0],			
			["U_I_CombatUniform_shortsleeve",nil,0],
			["U_I_OfficerUniform",nil,0],
			["U_O_OfficerUniform_ocamo",nil,0],
			["U_O_CombatUniform_oucamo",nil,0],
			["U_O_CombatUniform_ocamo",nil,0],
            ["U_B_GhillieSuit","Ghillie",0],
            ["U_O_GhillieSuit","Ghillie",0],
            ["U_I_GhillieSuit","Ghillie",0],			
            ["U_O_FullGhillie_ard","Ghillie 2.0",0],
            ["U_O_FullGhillie_lsh","Ghillie 2.0",0],
            ["U_O_FullGhillie_sard","Ghillie 2.0",0],			
			["U_C_Poloshirt_blue", "ImInvolved", 0],		
			["U_C_Poloshirt_burgundy", "Lion", 0],
			["U_C_Poloshirt_redwhite", "Volcom", 0],
			["U_C_Poloshirt_salmon", "Superman", 0],
			["U_C_Poloshirt_stripped", "Nuage", 0],
			["U_C_Poloshirt_tricolour", "Francois Hollande", 0],
			["U_C_Commoner_shorts", "Toulouse", 0],
			["U_C_ShirtSurfer_shorts", "MakeLoveNotWar", 0],		
			["U_C_Commoner1_1", "LaCoste", 0],
			["U_C_Commoner1_2", "LOSCFoot", 0],
			["U_C_Commoner1_3", "Heisenberg", 0],		
			["U_C_TeeSurfer_shorts_1", "Kaporal", 0],
			["U_C_TeeSurfer_shorts_2", "YMCMB", 0],		
			["U_IG_Guerilla3_1", nil, 0],
			["U_IG_Guerilla2_3", nil, 0],	
			["U_IG_Guerilla2_2", nil, 0],		
			["U_OG_Guerilla2_3", nil, 0],
			["U_IG_Guerilla2_1", nil, 0],
			["U_C_HunterBody_grn", "Chasseur", 0],
			["U_I_G_Story_Protagonist_F", nil, 0],
			["U_I_G_resistanceLeader_F", nil, 0],
			["U_Competitor", nil, 0],
			["U_C_Journalist", "Journaliste", 0],
			["U_IG_Guerilla3_2", nil, 0],
			["U_C_WorkerCoveralls", nil, 0],
			["U_OrestesBody", "Surfer", 0],
			["U_Marshal", "Marshal", 0],
			["U_NikosAgedBody", nil, 0],
			["U_NikosBody", nil, 0]		
		];
	};

	//Hats
	case 1:
	{
		[
			["H_Shemag_khk",nil,0],
			["H_Shemag_tan",nil,0],
			["H_Shemag_olive",nil,0],
			["H_Shemag_olive_hs",nil,0],
			["H_ShemagOpen_khk",nil,0],			
			["H_Helmeto_Ocamo ",nil,0],
			["H_Helmeto_Oucamo",nil,0],
			["H_HelmetB_snakeskin",nil,0],		
			["H_Cap_blk", nil, 0],
			["H_Cap_grn", nil, 0],
			["H_Cap_oli", nil, 0],
			["H_Cap_tan", nil, 0],
			["H_Cap_blk_Raven", nil, 0],
			["H_Cap_brn_SPECOPS", nil, 0],
			["H_Cap_blu", nil, 0],
			["H_Cap_red", nil, 0],
			["H_Cap_blk_CMMG", nil, 0],
			["H_Cap_blk_ION", nil, 0],
			["H_Cap_grn_BI", nil, 0],
			["H_Cap_press", nil, 0],
			["H_Cap_khaki_specops_UK", nil, 0],
			["H_Cap_tan_specops_US", nil, 0],			
			["H_BandMask_blk", "KESAKO", 0],
			["H_Hat_tan", nil, 0],
			["H_Hat_grey", nil, 0],
			["H_Hat_brown", nil, 0],
			["H_Hat_checker", nil, 0],
			["H_Hat_blue", nil, 0],
			["H_Hat_camo", nil, 0],
			["H_StrawHat", nil, 0],
			["H_StrawHat_dark", nil, 0],
			["H_TurbanO_blk", "KESAKO", 0],			
			["H_Bandanna_camo", nil, 0],
			["H_Bandanna_cbr", nil, 0],
			["H_Bandanna_gry", nil, 0],
			["H_Bandanna_khk", nil, 0],
			["H_Bandanna_mcamo", nil, 0],
			["H_Bandanna_sgg", nil, 0],
			["H_Bandanna_surfer", nil, 0],
			["H_Booniehat_tan", nil, 0],
			["H_Booniehat_grn", nil, 0],
			["H_Booniehat_mcamo", nil, 0],
			["H_Booniehat_indp", nil, 0]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Balaclava_blk",nil,0],
			["G_Balaclava_lowprofile",nil,0],
			["G_Balaclava_combat",nil,0],
			["G_Balaclava_oli",nil,0],			
			["G_Bandanna_aviator",nil,0],
			["G_Bandanna_beast",nil,0],
			["G_Bandanna_tan",nil,0],
			["G_Bandanna_sport",nil,0],
			["G_Bandanna_blk",nil,0],
			["G_Bandanna_oli",nil,0],
			["G_Bandanna_shades",nil,0],
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0],
			["G_Aviator",nil,0],
			["G_Lady_Mirror",nil,0],
			["G_Lady_Dark",nil,0],
			["G_Lady_Blue",nil,0],
			["G_Spectacles_Tinted",nil,0],
			["G_Spectacles",nil,0]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_HarnessOGL_brn",nil,0],
			["V_HarnessOGL_gry",nil,0],			
			["V_Chestrig_blk",nil,0],
			["V_Chestrig_khk",nil,0],
			["V_Chestrig_oli",nil,0],
			["V_Chestrig_rgr",nil,0],			
			["V_HarnessO_gry",nil,0],
			["V_HarnessO_brn",nil,0],			
			["V_PlateCarrierIA1_dgtl",nil,0],			
			["V_TacVest_blk",nil,0],
			["V_TacVest_brn",nil,0],
			["V_TacVest_camo",nil,0],
			["V_TacVest_khk",nil,0],
			["V_TacVest_oli",nil,0],
			["V_TacVestCamo_khk",nil,0],
			["V_TacVestIR_blk",nil,0],
			["V_Press_F",nil,0],
			["V_BandollierB_cbr",nil,0],
			["V_BandollierB_blk",nil,0],
			["V_BandollierB_khk",nil,0],
			["V_BandollierB_oli",nil,0],
			["V_BandollierB_rgr",nil,0]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_khk",nil,0],
			["B_AssaultPack_dgtl",nil,0],
			["B_AssaultPack_rgr",nil,0],
			["B_AssaultPack_sgg",nil,0],
			["B_AssaultPack_blk",nil,0],
			["B_AssaultPack_cbr",nil,0],
			["B_AssaultPack_mcamo",nil,0],			
			["B_FieldPack_blk",nil,0],
			["B_FieldPack_ocamo",nil,0],
			["B_FieldPack_oucamo",nil,0],
			["B_FieldPack_cbr",nil,0],			
			["B_Kitbag_cbr",nil,0],
			["B_Kitbag_mcamo",nil,0],
			["B_Kitbag_sgg",nil,0],			
			["B_Carryall_ocamo",nil,0],
			["B_Carryall_oucamo",nil,0],
			["B_Carryall_mcamo",nil,0],
			["B_Carryall_oli",nil,0],
			["B_Carryall_khk",nil,0],
			["B_Carryall_cbr",nil,0],			
			["B_Parachute",nil,0],
			["B_AssaultPack_khk",nil,0],
			["B_AssaultPack_dgtl",nil,0],
			["B_AssaultPack_rgr",nil,0],
			["B_AssaultPack_sgg",nil,0],
			["B_AssaultPack_blk",nil,0],
			["B_AssaultPack_cbr",nil,0],
			["B_AssaultPack_mcamo",nil,0],			
			["B_FieldPack_blk",nil,0],
			["B_FieldPack_ocamo",nil,0],
			["B_FieldPack_oucamo",nil,0],
			["B_FieldPack_cbr",nil,0],			
			["B_Carryall_ocamo",nil,0],
			["B_Carryall_oucamo",nil,0],
			["B_Carryall_mcamo",nil,0],
			["B_Carryall_oli",nil,0],
			["B_Carryall_khk",nil,0],
			["B_Carryall_cbr",nil,0],			
			["B_Parachute",nil,0]
		];
	};
};