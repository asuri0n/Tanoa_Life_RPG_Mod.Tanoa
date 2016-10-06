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
			["U_I_G_Story_Protagonist_F", nil, 1000],

			["U_IG_Guerilla3_1", nil, 1000],
			["U_BG_Guerilla3_1", nil, 1000],
			["U_IG_Guerilla2_3", nil, 1000],
			["U_IG_Guerilla2_2", nil, 1000],
			["U_OG_Guerilla2_3", nil, 1000],
			["U_IG_Guerilla2_1", nil, 1000],

			["U_IG_Guerilla3_2", nil, 1000],

			["U_I_C_Soldier_Para_5_F", nil, 2000],
			["U_I_C_Soldier_Bandit_1_F", nil, 2000],
			["U_I_C_Soldier_Bandit_2_F", nil, 2000],
			["U_I_C_Soldier_Bandit_3_F", nil, 2000],
			["U_I_C_Soldier_Bandit_4_F", nil, 2000],
			["U_I_C_Soldier_Bandit_5_F", nil, 2000],

			["U_OG_Guerilla1_1", nil, 2000],
			["U_BG_Guerilla2_1", nil, 2000],
			["U_BG_Guerilla2_2", nil, 2000],
			["U_BG_Guerilla2_3", nil, 2000]

		];
	};

	//Hats
	case 1:
	{
		[
			["H_Cap_blk_Raven", nil, 2000],
			["H_Cap_brn_SPECOPS", nil, 2000],

			["H_Cap_khaki_specops_UK", nil, 2000],
			["H_Cap_tan_specops_US", nil, 2000],

			["H_Hat_camo", nil, 2000],

			["H_Bandanna_camo", nil, 2000],
			["H_Bandanna_khk", nil, 2000],

			["H_Bandanna_mcamo", nil, 2000],
			["H_Booniehat_mcamo", nil, 2000],
			["H_Booniehat_indp", nil, 2000]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Combat",nil,200]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_Rangemaster_belt",nil,4500],

			["V_HarnessO_ghex_F",nil,7500],
			["V_HarnessOGL_ghex_F",nil,7500]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_dgtl",nil,2500],
			["B_AssaultPack_mcamo",nil,2500],

			["B_FieldPack_ocamo",nil,5000],
			["B_FieldPack_oucamo",nil,5000],

			["B_Carryall_ocamo",nil,10000],
			["B_Carryall_oucamo",nil,10000],
			["B_Carryall_mcamo",nil,10000]
		];
	};
};