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
	// Civil - Voiture base arma
	case "B_Quadbike_01_F": {35}; 				// Quad
	case "C_Hatchback_01_F": {50};				// Hayon
	case "C_Hatchback_01_sport_F": {50};		// Hayon sport
	case "C_SUV_01_F": {50};					// SUV
	case "C_Offroad_01_F": {60};				// Pickup
	case "B_G_Offroad_01_F": {60};				// Pickup Rebelle
	case "C_Offroad_02_unarmed_F": {70};		// MB 4WD
	case "C_Van_01_transport_F": {90};			// Fourgonette
	case "I_C_Van_01_transport_F": {90};		// Fourgonette Camo
	case "I_C_Van_01_transport_brown_F": {90};  // Fourgonette Marron
	case "I_C_Van_01_transport_olive_F": {90};	// Fourgonette Verte
	case "C_Van_01_box_F": {150};				// Fourgon caisse

	// Civil - camion base arma
	case "C_Truck_02_fuel_F": {250};			// Zamak Fuel
	case "C_Truck_02_transport_F": {200};		// Zamak Transport
	case "C_Truck_02_covered_F": {250};			// Zamak Transport Couvert
	case "B_Truck_01_transport_F": {300};		// HEMTT Transport
	case "B_Truck_01_covered_F": {350};			// HEMTT Couvert
	case "O_Truck_03_device_F": {350};			// Tempest Matériel (Minage auto)
	case "B_Truck_01_box_F": {700};				// HEMTT Cargaison
	case "B_Truck_01_fuel_F": {700};			// HEMTT Fuel

	// Civil + SMT - Hélicoptères/Avions
	case "B_Heli_Light_01_F": {20}; 			// Hummingbird
	case "C_Heli_Light_01_civil_F": {20};		// M-900
	case "O_Heli_Light_02_unarmed_F": {20}; 	// Gendarmerie : Orca
	case "I_Heli_Transport_02_F": {50};			// Mohawk

    // Civil + Gendarmerie - Bateau
	case "C_Rubberboat": {50};					// canot pneumatique
	case "B_G_Boat_Transport_01_F": {50};		// canot pneumatique gendarmerie
	case "I_C_Boat_Transport_02_F": {150};		// RHIB
	case "C_Boat_Civil_01_F": {150};			// Hors-bord
	case "C_Boat_Civil_01_police_F": {150};		// Hors-bord gendarmerie
	case "C_Boat_Civil_01_rescue_F": {150};		// Hors-bord orange rescue

    // Civil + Gendarmerie - véhicules blindés
	case "B_MRAP_01_F": {65};					// hunter
	case "O_MRAP_02_F": {60};					// Ifrit
	case "I_MRAP_03_F": {58};					// Strider

	// Véhicules modés
	case "Mrshounka_twingo_p": {50};
	case "Mrshounka_twingo_p_noir": {50};
	case "Mrshounka_twingo_p_bf": {50};
	case "Mrshounka_twingo_p_r": {50};
	case "Mrshounka_twingo_p_j": {50};
	case "Mrshounka_twingo_p_rose": {50};
	case "Mrshounka_twingo_p_g": {50};
	case "Mrshounka_twingo_p_v": {50};
	case "Mrshounka_twingo_p_o": {50};

	case "Mrshounka_megane_rs_2015_civ": {50};
	case "Mrshounka_megane_rs_2015_noir": {50};
	case "Mrshounka_megane_rs_2015_bleufonce": {50};
	case "Mrshounka_megane_rs_2015_rouge": {50};
	case "Mrshounka_megane_rs_2015_jaune": {50};
	case "Mrshounka_megane_rs_2015_rose": {50};
	case "Mrshounka_megane_rs_2015_grise": {50};
	case "Mrshounka_megane_rs_2015_violet": {50};
	case "Mrshounka_megane_rs_2015_orange": {50};

	case "Mrshounka_cayenne_p_civ": {40};
	case "Mrshounka_cayenne_p_bleufonce": {40};
	case "Mrshounka_cayenne_p_grise": {40};
	case "Mrshounka_cayenne_p_jaune": {40};
	case "Mrshounka_cayenne_p_noir": {40};
	case "Mrshounka_cayenne_p_orange": {40};
	case "Mrshounka_cayenne_p_rose": {40};
	case "Mrshounka_cayenne_p_rouge": {40};
	case "Mrshounka_cayenne_p_violet": {40};

	case "Mrshounka_a3_gtr_civ": {30};
	case "Mrshounka_a3_gtr_civ_noir": {30};
	case "Mrshounka_a3_gtr_civ_bleu": {30};

	case "shounka_clk": {25};
	case "shounka_clk_noir": {25};
	case "shounka_clk_bleufonce": {25};
	case "shounka_clk_rouge": {25};
	case "shounka_clk_jaune": {25};
	case "shounka_clk_rose": {25};
	case "shounka_clk_grise": {25};
	case "shounka_clk_violet": {25};
	case "shounka_clk_orange": {25};

	case "Mrshounka_c63_2015_civ": {25};
	case "Mrshounka_c63_2015_mat": {25};
	case "Mrshounka_c63_2015_noir": {25};
	case "Mrshounka_c63_2015_mat_n": {25};
	case "Mrshounka_c63_2015_bleufonce": {25};
	case "Mrshounka_c63_2015_mat_b": {25};
	case "Mrshounka_c63_2015_rouge": {25};
	case "Mrshounka_c63_2015_jaune": {25};
	case "Mrshounka_c63_2015_rose": {25};
	case "Mrshounka_c63_2015_grise": {25};
	case "Mrshounka_c63_2015_violet": {25};
	case "Mrshounka_c63_2015_orange": {25};

	case "Mrshounka_evox_civ": {30};
	case "Mrshounka_evox_bleufonce": {30};
	case "Mrshounka_evox_grise": {30};
	case "Mrshounka_evox_jaune": {30};
	case "Mrshounka_evox_noir": {30};
	case "Mrshounka_evox_orange": {30};
	case "Mrshounka_evox_rose": {30};
	case "Mrshounka_evox_rouge": {30};
	case "Mrshounka_evox_violet": {30};

	case "Mrshounka_jeep_blinde_noir": {40};
	case "Mrshounka_jeep_blinde_noir_mat": {40};
	case "Mrshounka_jeep_blinde_bleu": {40};
	case "Mrshounka_jeep_blinde_bleu_mat": {40};
	case "Mrshounka_jeep_blinde_blanc": {40};
	case "Mrshounka_jeep_blinde_blanc_mat": {40};
	case "Mrshounka_jeep_blinde_violet": {40};
	case "Mrshounka_jeep_blinde_violet_mat": {40};
	case "Mrshounka_jeep_blinde_rouge": {40};
	case "Mrshounka_jeep_blinde_rouge_mat": {40};

	case "Mrshounka_cherokee_noir": {40};
	case "Mrshounka_cherokee_noir_mat": {40};
	case "Mrshounka_cherokee_noir_bleu": {40};
	case "Mrshounka_cherokee_noir_bleu_mat": {40};
	case "Mrshounka_cherokee_noir_blanc": {40};
	case "Mrshounka_cherokee_noir_blanc_mat": {40};
	case "Mrshounka_cherokee_noir_violet": {40};
	case "Mrshounka_cherokee_noir_violet_mat": {40};
	case "Mrshounka_cherokee_noir_rouge": {40};
	case "Mrshounka_cherokee_noir_rouge_mat": {40};

	case "Mrshounka_hummer_civ": {60};
	case "Mrshounka_hummer_civ_noir": {60};
	case "Mrshounka_hummer_civ_bleufonce": {60};
	case "Mrshounka_hummer_civ_rouge": {60};
	case "Mrshounka_hummer_civ_jaune": {60};
	case "Mrshounka_hummer_civ_rose": {60};
	case "Mrshounka_hummer_civ_grise": {60};
	case "Mrshounka_hummer_civ_violet": {60};
	case "Mrshounka_hummer_civ_orange": {60};

	case "shounka_h2": {60};
	case "shounka_h2_noir": {60};
	case "shounka_h2_bleufonce": {60};
	case "shounka_h2_rouge": {60};
	case "shounka_h2_jaune": {60};
	case "shounka_h2_rose": {60};
	case "shounka_h2_grise": {60};
	case "shounka_h2_violet": {60};
	case "shounka_h2_orange": {60};

	case "Mrshounka_Vandura_civ": {80};
	case "Mrshounka_Vandura_civ_noir": {80};
	case "Mrshounka_Vandura_civ_bleufonce": {80};
	case "Mrshounka_Vandura_civ_rouge": {80};
	case "Mrshounka_Vandura_civ_jaune": {80};
	case "Mrshounka_Vandura_civ_rose": {80};
	case "Mrshounka_Vandura_civ_grise": {80};
	case "Mrshounka_Vandura_civ_violet": {80};
	case "Mrshounka_Vandura_civ_orange": {80};

	case "Mrshounka_raptor_civ": {30};
	case "Mrshounka_raptor_noir": {30};
	case "Mrshounka_raptor_bleufonce": {30};
	case "Mrshounka_raptor_rouge": {30};
	case "Mrshounka_raptor_jaune": {30};
	case "Mrshounka_raptor_rose": {30};
	case "Mrshounka_raptor_grise": {30};
	case "Mrshounka_raptor_violet": {30};
	case "Mrshounka_raptor_orange": {30};

	case "shounka_nemo": {80};
	case "shounka_nemo_noir": {80};
	case "shounka_nemo_bleufonce": {80};
	case "shounka_nemo_rouge": {80};
	case "shounka_nemo_jaune": {80};
	case "shounka_nemo_rose": {80};
	case "shounka_nemo_grise": {80};
	case "shounka_nemo_violet": {80};
	case "shounka_nemo_orange": {80};

	case "Mrshounka_c4_p_civ": {30};
	case "Mrshounka_c4_p_bleufonce": {30};
	case "Mrshounka_c4_p_grise": {30};
	case "Mrshounka_c4_p_jaune": {30};
	case "Mrshounka_c4_p_noir": {30};
	case "Mrshounka_c4_p_orange": {30};
	case "Mrshounka_c4_p_rose": {30};
	case "Mrshounka_c4_p_rouge": {30};
	case "Mrshounka_c4_p_violet": {30};

	case "shounka_avalanche": {70};
	case "shounka_avalanche_noir": {70};
	case "shounka_avalanche_bleufonce": {70};
	case "shounka_avalanche_rouge": {70};
	case "shounka_avalanche_jaune": {70};
	case "shounka_avalanche_rose": {70};
	case "shounka_avalanche_grise": {70};
	case "shounka_avalanche_violet": {70};
	case "shounka_avalanche_orange": {70};

	case "Mrshounka_Bowler_c": {60};
	case "Mrshounka_Bowler_c_noir": {60};
	case "Mrshounka_Bowler_c_bleufonce": {60};
	case "Mrshounka_Bowler_c_rouge": {60};
	case "Mrshounka_Bowler_c_jaune": {60};
	case "Mrshounka_Bowler_c_rose": {60};
	case "Mrshounka_Bowler_c_grise": {60};
	case "Mrshounka_Bowler_c_violet": {60};
	case "Mrshounka_Bowler_c_orange": {60};

	// Maison & Autres
	case "Land_Box_AmmoOld_F": {350};			// Petite caisse de stockage
	case "B_supplyCrate_F": {700};				// Grande caisse de stockage

	default {-1};
};