/*
	File: fn_shopMenus.sqf
	Author: Bryan "Tonic" Boardwine
	Traduction : Skydred
	Description:
	Master config for a thing that will be gone eventually..
	OBSOLETE
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0;};

if(!dialog) then
{
	if(!(createDialog "shop_menu")) exitWith {};
};
disableSerialization;
ctrlSetText[601,format["Argent: $%1",[life_liquide] call life_fnc_numberText]];

switch (_shop) do
{
	case "reb":
	{
		ctrlSetText[2505,"Magasin rebelle"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "dep":
	{
		ctrlSetText[2505,"Magasin dépanneur"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "gangster":
	{
		ctrlSetText[2505,"Magasin de gangster"]; //Ajout 08/09/14 Johnny
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "hunter":
	{
		ctrlSetText[2505,"Magasin de chasseurs de primes"]; //Ajout 22/11/14 Johnny
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "cop":
	{
		ctrlSetText[2505,"Magasin gendarme"];
		ctrlShow[2503,false];
	};

	case "gun":
	{
		ctrlSetText[2505,"Magasin d'armes"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "gang":
	{
		ctrlSetText[2505,"Magasin de gang"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "dive":
	{
		ctrlSetText[2505,"Magasin de plongé"];
		ctrlShow[2503,false];
		ctrlShow[2510,false];
		ctrlShow[2511,false];
		ctrlShow[2513,false];
	};

	case "donator":
	{
		ctrlSetText[2505,"Magasin donateur"];
	};

	case "sergeant":
	{
		ctrlSetText[2505,"Magasin sergent"];
		ctrlShow[2503,false];
	};

	case "gen":
	{
		ctrlSetText[2505,"Magasin général"];
		ctrlShow[2503,false];
	};

	case "officer":
	{
		ctrlSetText[2505,"Magasin officier"];
		ctrlShow[2503,false];
	};

	case "admin":
	{
		ctrlSetText[2505,"Magasin admin"];
	};
};

["guns"] call life_fnc_shops_changeMenu;