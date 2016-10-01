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
		];
	};

	//Hats
	case 1:
	{
		[
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
		];
	};
};