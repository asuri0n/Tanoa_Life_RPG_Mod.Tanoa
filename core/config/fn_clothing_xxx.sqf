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
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		];
	};

	//Hats
	case 1:
	{
		[
			["H_HelmetSpecO_blk",nil,500]
		];
	};

	//Glasses
	case 2:
	{
		[
		];
	};

	//Vest
	case 3:
	{
		[
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_blk","30 places",2000],
			["B_FieldPack_blk","40 places",4000]
		];
	};
};