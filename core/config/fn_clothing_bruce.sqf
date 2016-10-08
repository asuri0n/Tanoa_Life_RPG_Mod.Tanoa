#include <macro.h>

/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Scientist","Protection Contre Les Radiations",10000],
			["U_C_Poloshirt_blue","Tenue Vacation Gaming",500],
			["U_C_HunterBody_grn", "Chasseur", 1000],
			["U_I_G_resistanceLeader_F", nil, 1000],
			["U_Competitor", nil, 1000],
			["U_C_Journalist", "Journaliste", 1000],
			["U_C_Poloshirt_burgundy", nil, 1000],
			["U_C_Poloshirt_salmon", nil, 1000],
			["U_C_Poloshirt_tricolour", nil, 1000],

			["U_C_WorkerCoveralls", nil, 1500],
			["U_I_HeliPilotCoveralls", nil, 1500],

			["U_OrestesBody", "Surfer", 2000],
			["U_C_man_sport_1_F", nil, 2000],
			["U_C_man_sport_2_F", nil, 2000],
			["U_C_man_sport_3_F", nil, 2000],
			["U_C_Man_casual_1_F", nil, 2000],
			["U_C_Man_casual_2_F", nil, 2000],
			["U_C_Man_casual_3_F", nil, 2000],
			["U_C_Man_casual_4_F", nil, 2000],
			["U_C_Man_casual_5_F", nil, 2000],
			["U_C_Man_casual_6_F", nil, 2000],

			["U_Marshal", "Marshal", 3000],

			["U_C_Driver_2", nil, 3000],
			["U_C_Driver_1_blue", nil, 3000],
			["U_C_Driver_1_white", nil, 3000],
			["U_C_Driver_1", nil, 3000],
			["U_C_Driver_1_yellow", nil, 3000],
			["U_C_Driver_1_black", nil, 3000],
			["U_C_Driver_1_orange", nil, 3000],
			["U_C_Driver_1_red", nil, 3000],
			["U_C_Driver_1_green", nil, 3000],

			["U_C_Driver_3", nil, 5000],
			["U_C_Driver_4", nil, 5000],

			["U_NikosAgedBody", nil, 4000]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_RacingHelmet_1_F", nil, 3000],
			["H_RacingHelmet_1_yellow_F", nil, 3000],
			["H_RacingHelmet_1_black_F", nil, 3000],
			["H_RacingHelmet_1_orange_F", nil, 3000],
			["H_RacingHelmet_1_red_F", nil, 3000],
			["H_RacingHelmet_1_green_F", nil, 3000],
			["H_RacingHelmet_1_blue_F", nil, 3000],
			["H_RacingHelmet_1_white_F", nil, 3000],

			["H_RacingHelmet_4_F", nil, 5000],
			["H_RacingHelmet_3_F", nil, 5000],
			["H_RacingHelmet_2_F", nil, 5000],

			["H_Helmet_Skate", nil, 1000],

			["H_Cap_blk", nil, 2000],
			["H_Cap_grn", nil, 2000],
			["H_Cap_oli", nil, 2000],
			["H_Cap_tan", nil, 2000],
			["H_Cap_blu", nil, 2000],
			["H_Cap_red", nil, 2000],
			["H_Cap_blk_CMMG", nil, 2000],
			["H_Cap_blk_ION", nil, 2000],
			["H_Cap_grn_BI", nil, 2000],
			["H_Cap_press", nil, 2000],
			["H_Hat_tan", nil, 2000],
			["H_Hat_grey", nil, 2000],
			["H_Hat_brown", nil, 2000],
			["H_Hat_checker", nil, 2000],
			["H_Hat_blue", nil, 2000],
			["H_StrawHat", nil, 2000],
			["H_StrawHat_dark", nil, 2000],
			["H_Bandanna_cbr", nil, 2000],
			["H_Bandanna_gry", nil, 2000],
			["H_Bandanna_sgg", nil, 2000],
			["H_Bandanna_surfer", nil, 2000],
			["H_Booniehat_tan", nil, 2000],
			["H_Booniehat_grn", nil, 2000]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,200],
			["G_Shades_Blue",nil,200],
			["G_Sport_Blackred",nil,200],
			["G_Sport_Checkered",nil,200],
			["G_Sport_Blackyellow",nil,200],
			["G_Sport_BlackWhite",nil,200],
			["G_Squares",nil,200],
			["G_Lowprofile",nil,200],
			["G_Aviator",nil,200],
			["G_Lady_Mirror",nil,200],
			["G_Lady_Dark",nil,200],
			["G_Lady_Blue",nil,200],
			["G_Spectacles_Tinted",nil,200],
			["G_Spectacles",nil,200]
		];
	};

	//Vest
	case 3:
	{
		[

			["V_Press_F",nil,5000],
			["V_BandollierB_cbr",nil,10000],
			["V_BandollierB_blk",nil,10000],
			["V_BandollierB_khk",nil,10000],
			["V_BandollierB_oli",nil,10000],
			["V_BandollierB_rgr",nil,10000]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_khk",nil,2500],
			["B_AssaultPack_rgr",nil,2500],
			["B_AssaultPack_sgg",nil,2500],
			["B_AssaultPack_blk",nil,2500],
			["B_AssaultPack_cbr",nil,2500],

			["B_FieldPack_blk",nil,5000],
			["B_FieldPack_cbr",nil,5000],

			["B_Carryall_oli",nil,10000],
			["B_Carryall_khk",nil,10000],
			["B_Carryall_cbr",nil,10000],

			["B_Parachute",nil,2500]
		];
	};
};