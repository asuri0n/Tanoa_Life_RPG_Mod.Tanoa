#include <macro.h>
/*
	File: fn_clothing_med.sqf
	Author: F.Serrat

	Description:
	Master config file for Med clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"SAMU"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret =
		[
			["U_Rangemaster","Uniforme",0],
			["U_B_Wetsuit","Uniforme de Plongé",0]
		];
	};
	//Hats
	case 1:
	{
		_ret =
		[
			["H_PilotHelmetHeli_O",nil,0],
			["H_Cap_headphones",nil,0],
			["H_RacingHelmet_1_white_F",nil,0],
			["H_MilCap_gry",nil,0]
		];
	};
	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Tactical_Clear",nil,0],
			["G_Diving",nil,0]
		];
	};
	//Vest
	case 3:
	{
		_ret =
		[
			["V_TacVestIR_blk",nil,5000],
			["V_RebreatherB",nil,0]
		];
	};
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_ViperHarness_blk_F",nil,0]
		];
	};
};

_ret;