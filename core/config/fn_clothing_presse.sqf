/*
	File: fn_clothing_presse.sqf
	Author: Johnny

	Description:
	Master configuration file for Presse shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Magasin Presse"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Journalist",nil,100],
			["U_Marshal",nil,100]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_Cap_press",nil,100]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Tactical_Clear",nil,100]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_Press_F",nil,1000]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["sab_CUAV_BP",nil,50000]
		];
	};
};