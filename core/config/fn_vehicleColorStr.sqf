/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Monster"};
			case 1: {_color = "Nature"};
			case 2: {_color = "Night"};
			case 3: {_color = "Youtube"};
			case 4: {_color = "Poly"};
			case 5: {_color = "SMT"};
		};
	};

	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Gendarmerie"};
		};
	};

	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Jaune";};
			case 2: {_color = "Blanc";};
			case 3: {_color = "Bleu";};
			case 4: {_color = "Rouge foncé";};
			case 5: {_color = "Bleu"};
			case 6: {_color = "Noir"};
			case 7: {_color = "Jaune"};
			case 8: {_color = "Cyan"};
			case 9: {_color = "Depanneur"};
			case 10: {_color = "Medecin"};
		};
	};

	case "O_Truck_02_Ammo_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune";};
			case 1: {_color = "Jaune";};
			case 2: {_color = "Camouflage";};
			case 3: {_color = "Camouflage";};
		};
	};

	case "B_Truck_01_mover_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Dépanneur";};
		};
	};

	case "O_Heli_Transport_04_box_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Rebelle";};
		};
	};

	case "O_Heli_Transport_04_covered_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Rebelle";};
		};
	};

	case "O_Heli_Transport_04_medevac_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
		};
	};

	case "O_Heli_Transport_04_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
		};
	};

	case "O_Heli_Transport_04_repair_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
		};
	};

	case "I_Heli_light_03_unarmed_F" :
	{
		switch (_index) do
		{
			//case 0: {_color = "Gendarmerie"};
		};
	};

	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge foncé";};
			case 1: {_color = "Argent";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Taxi";};
			case 4: {_color = "Médical";};
			case 5: {_color = "Hello Kitty";};
			case 6: {_color = "Vert Speed";};
			case 7: {_color = "Camouflé";};
			case 8: {_color = "Staff";};
			case 9: {_color = "Ferrari";};
			case 10: {_color = "Vacation";};
			case 11: {_color = "Cube";};
			case 12: {_color = "Donuts";};
			case 13: {_color = "Homer jaune";};
			case 14: {_color = "Polygone gris";};
			case 15: {_color = "BFM TV";};
			case 16: {_color = "Rebelle";};
			case 17: {_color = "Noir";};
			case 18: {_color = "Vert";};
			case 19: {_color = "Banalisée Argent";};
			case 20: {_color = "Banalisée Orange";};
			case 21: {_color = "Banalisée Rebelle";};
			case 22: {_color = "Banalisée Grise";};
		};
	};

	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
			case 2: {_color = "SMT"};
		};
	};

	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};

	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Gendarmerie"};
			case 1: {_color = "Digital desert"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge"};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Digital Vert"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
			case 9: {_color = "SMT"};
		};
	};

	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Gendarmerie"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Civ Bleu"};
			case 3: {_color = "Civ Rouge"};
			case 4: {_color = "Digi Vert"};
			case 5: {_color = "Bleuline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Bleu"};
			case 9: {_color = "Speedy Rougeline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Bleu"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "Rebel Army"};
			case 15: {_color = "Rebel Camo"};
			case 16: {_color = "SMT"};
			case 17: {_color = "Tigre"};
			case 18: {_color = "Dépanneur"};
			case 19: {_color = "Banalisé Bleu"};
			case 20: {_color = "Banalisé Rouge"};
			case 21: {_color = "Camouflage rebelle"};
			case 22: {_color = "Noir"};
			case 23: {_color = "Cookie"};
			case 24: {_color = "Hawai"};
			case 25: {_color = "Stickerbom"};
		};
	};

	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Gendarmerie"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Civ Bleu"};
			case 3: {_color = "Civ Rouge"};
			case 4: {_color = "Digi Vert"};
			case 5: {_color = "Bleuline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Bleu"};
			case 9: {_color = "Speedy Rougeline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Bleu"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "Rebel Army"};
			case 15: {_color = "Rebel Camo"};
			case 16: {_color = "SMT"};
			case 17: {_color = "Tigre"};
			case 18: {_color = "Dépanneur"};
			case 19: {_color = "Banalisé Bleu"};
			case 20: {_color = "Banalisé Rouge"};
			case 21: {_color = "Camouflage rebelle"};
			case 22: {_color = "Noir"};
			case 23: {_color = "Cookie"};
			case 24: {_color = "Hawai"};
			case 25: {_color = "Stickerbom"};
			case 26: {_color = "Infini"};
		};
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Blanc / Bleu"};
			case 2: {_color = "Digi Vert"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "Rebel Camo"};
			case 5: {_color = "SMT"};
			case 7: {_color = "Gendarmerie"};
			case 9: {_color = "Camouflé Noir"};
			case 10: {_color = "Noir"};
		};
	};

	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 1: {_color = "Noir"};
			case 2: {_color = "Rebelle"};
			case 3: {_color = "Rouge"};
			case 4: {_color = "Rose"};
		};
	};

	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sable"};
			case 1: {_color = "Jaune Orange"};
			case 2: {_color = "Gris Blanc"};
			case 3: {_color = "Vert Foret"};
			case 4: {_color = "Rouge Gris"};
			case 5: {_color = "Noir"};
			case 6: {_color = "Rose"};
		};
	};

	case "B_G_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebelle"};
		};
	};


	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Barbie"};
			case 3: {_color = "Coca"};
			case 4: {_color = "Weed"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Jaune"};
			case 7: {_color = "Banalisé Orange"};
			case 8: {_color = "Camouflage Weed"};
		};
	};

	case "B_G_Offroad_01_armed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Camo 1"};
			case 2: {_color = "Camo 2"};
			case 3: {_color = "Camo 3"};
			case 4: {_color = "Camo 4"};
			case 5: {_color = "Camo 5"};
			case 6: {_color = "Camo 6"};
			case 7: {_color = "Camo 7"};
			case 8: {_color = "Camo 8"};
			case 9: {_color = "Camo 9"};
			case 10: {_color = "Camo 10"};
		};
	};

	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "USMC"};
			case 3: {_color = "Noir"};
			case 4: {_color = "EMT"};
		};
	};

	case "C_Offroad_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Gendarmerie"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Bleu"};
			case 3: {_color = "Vert"};
			case 4: {_color = "Orange"};
			case 5: {_color = "Rouge"};
			case 6: {_color = "Marron"};
			case 7: {_color = "Blanc"};
			case 8: {_color = "Olive"};
		};
	};
};
_color;