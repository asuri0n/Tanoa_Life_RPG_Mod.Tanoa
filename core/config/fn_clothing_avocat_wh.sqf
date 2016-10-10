/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Avocats cabinet"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_I_G_resistanceLeader_F",nil,3000]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_Cap_headphones",nil,500]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Bandanna_khk",nil,500]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_TacVest_blk",nil,10000]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_ViperHarness_blk_F",nil,10000]
		];
	};
};