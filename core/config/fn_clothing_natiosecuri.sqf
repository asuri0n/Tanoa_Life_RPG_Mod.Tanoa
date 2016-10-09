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
ctrlSetText[3103,"Magasin National Security"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_Marshal",nil,10000]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_MilCap_gry",nil,2500]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Squares_Tinted",nil,5000]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_PlateCarrier2_blk",nil,17500]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_ViperLightHarness_blk_F",nil,6000]
		];
	};
};