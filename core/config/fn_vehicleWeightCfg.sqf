/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/

private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	/**
	 * [REVIEWED] Civil - Kart
	**/
    case "C_Kart_01_F": {20};
    case "C_Kart_01_Fuel_F": {20};
    case "C_Kart_01_Blu_F": {20};
    case "C_Kart_01_Red_F": {20};
    case "C_Kart_01_Vrana_F": {20};

	/**
	 * [REVIEWED] Civil - Voiture
	**/
	case "B_Quadbike_01_F": {25}; 				// Quad
	case "C_Hatchback_01_F": {40};				// Hayon
	case "C_Hatchback_01_sport_F": {45};		// Hayon sport
	case "C_SUV_01_F": {50};					// SUV
	case "C_Offroad_01_F": {65};				// Pickup
	case "C_Offroad_02_unarmed_F": {70};		// MB 4WD
	case "C_Van_01_box_F": {85};				// Fourgon caisse
	case "C_Van_01_transport_F": {100};			// Fourgonette
	case "I_C_Van_01_transport_F": {100};		// Fourgonette Camo
	case "I_C_Van_01_transport_brown_F": {100}; // Fourgonette Marron
	case "I_C_Van_01_transport_olive_F": {100};	// Fourgonette Verte

	/**
	 * [REVIEWED] Civil - Camion
	**/
    // zamak
    case "O_Truck_02_transport_F": {150};
    case "O_Truck_02_covered_F": {200};
    case "O_Truck_02_fuel_F": {250};
    // Tempest
    case "O_Truck_03_transport_F": {300};
    case "O_Truck_03_covered_F": {350};
    case "O_Truck_03_fuel_F": {400};
    case "O_Truck_03_ammo_F": {450};
    // HEMTT
    case "B_Truck_01_transport_F": {500};
    case "B_Truck_01_covered_F": {550};
    case "B_Truck_01_fuel_F": {600};
    case "B_Truck_01_box_F": {650};
    // SPECIAL
    case "O_Truck_03_device_F": {350};
    case "O_Truck_02_Ammo_F": {350};

	/**
	 * [REVIEWED] Civil - Hélicopters
	**/
    case "C_Heli_Light_01_civil_F": {15};
    case "O_Heli_Light_02_unarmed_F": {15};
    case "I_Heli_Transport_02_F": {15};

	/**
	 * [REVIEWED] Civil - Avions
	**/
    case "C_Plane_Civil_01_racing_F": {500};
    case "C_Plane_Civil_01_F": {500};

	/**
	 * [REVIEWED] Civil - Bateau
	**/
    case "C_Rubberboat": {50};
    case "C_Boat_Civil_01_F": {150};
    case "C_Scooter_Transport_01_F": {15};
    case "C_Boat_Transport_02_F": {250};

	/**
	 * [REVIEWED] Rebelle - Voitures
	**/
    case "B_G_Offroad_01_F": {65};
    case "O_LSV_02_unarmed_F": {60};
    case "B_G_Offroad_01_armed_F": {65};
    case "B_CTRG_LSV_01_light_F": {50};

	/**
	 * [REVIEWED] blindés
	**/
	case "B_MRAP_01_F": {65};					// hunter
	case "O_MRAP_02_F": {60};					// Ifrit
	case "I_MRAP_03_F": {58};					// Strider

	/**
	 * [REVIEWED] Rebelle - Air
	**/
    case "B_Heli_Light_01_F": {15};
    case "C_Heli_Light_01_civil_F": {15};
    case "O_Heli_Light_02_v2_F": {15};
    case "O_Heli_Transport_04_covered_F": {15};
    case "O_Heli_Transport_04_F": {15};

	/**
	 * [REVIEWED] Gendarmes - Boat
	**/
	case "B_G_Boat_Transport_01_F": {50};		// canot pneumatique gendarmerie
	case "C_Boat_Civil_01_police_F": {150};		// Hors-bord gendarmerie
	case "C_Boat_Civil_01_rescue_F": {150};		// Hors-bord orange rescue

	// Maison & Autres
	case "Land_Box_AmmoOld_F": {350};			// Petite caisse de stockage
	case "B_supplyCrate_F": {700};				// Grande caisse de stockage

	default {-1};
};