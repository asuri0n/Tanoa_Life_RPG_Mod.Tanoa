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

//CIVIL CAR
	case "B_Quadbike_01_F": {25};
	case "A3L_CVBlack": {35};
	case "A3L_CVBlue": {35};
	case "A3L_CVGrey": {35};
	case "A3L_CVPink": {35};
	case "A3L_CVRed": {35};
	case "A3L_CVWhite": {35};
	case "C_Hatchback_01_F": {40};
	case "C_Offroad_01_F": {65};
	case "A3L_VolksWagenGolfGTiblack": {48};
	case "A3L_VolksWagenGolfGTiblue": {48};
	case "A3L_VolksWagenGolfGTired": {48};
	case "A3L_VolksWagenGolfGTiwhite": {48};
	case "C_SUV_01_F": {50};
	case "A3L_PuntoBlack": {51};
	case "A3L_PuntoGrey": {51};
	case "A3L_PuntoBlue": {51};
	case "A3L_PuntoRed": {51};
	case "A3L_PuntoWhite": {51};
	case "C_Van_01_transport_F": {90};
	case "DAR_FusionCivBlack": {40};
	case "DAR_FusionCivBlue": {40};
	case "DAR_FusionCivRed": {40};
	case "DAR_FusionCiv": {40};
	case "A3L_RX7_Black": {54};
	case "A3L_RX7_Red": {54};
	case "A3L_RX7_White": {54};
	case "A3L_RX7_Blue": {54};
	case "A3L_GrandCaravanBlk": {100};
	case "A3L_GrandCaravanBlue": {100};
	case "A3L_GrandCaravanGreen": {100};
	case "A3L_GrandCaravanPurple": {100};
	case "A3L_GrandCaravanRed": {100};
	case "cl3_transit_yellow": {110};
	case "cl3_transit_black": {110};
	case "cl3_transit_blue": {110};
	case "cl3_transit_aqua": {110};
	case "cl3_transit_babypink": {110};
	case "cl3_transit_red": {110};
	case "cl3_transit_burgundy": {110};
	case "cl3_transit_cardinal": {110};
	case "cl3_transit_dark_green": {110};
	case "cl3_transit_gold": {110};
	case "cl3_transit_green": {110};
	case "cl3_transit_grey": {110};
	case "cl3_transit_lavender": {110};
	case "cl3_transit_light_blue": {110};
	case "cl3_transit_light_yellow": {110};
	case "cl3_transit_lime": {110};
	case "cl3_transit_marina_blue": {110};
	case "cl3_transit_navy_blue": {110};
	case "cl3_transit_orange": {110};
	case "cl3_transit_purple": {110};
	case "cl3_transit_sand": {110};
	case "cl3_transit_silver": {110};
	case "cl3_transit_white": {110};
	case "cl3_transit_violet": {110};
	case "A3L_F350Black": {120};
	case "A3L_F350Blue": {120};
	case "A3L_F350Red": {120};
	case "A3L_F350White": {120};
	case "DAR_TahoeCivBlack": {65};
	case "DAR_TahoeCivBlue": {65};
	case "DAR_TahoeCivRed": {65};
	case "DAR_TahoeCivSilver": {65};
	case "DAR_TahoeCiv": {65};
	case "BMW_M5Black": {56};
	case "BMW_M5Blue": {56};
	case "BMW_M5Red": {56};
	case "DAR_TaurusCivBlack": {45};
	case "DAR_TaurusCivBlue": {45};
	case "DAR_TaurusCiv": {45};
	case "A3L_ChargerBlack": {60};
	case "A3L_ChargerBlue": {60};
	case "A3L_ChargerRed": {60};
	case "A3L_ChargerWhite": {60};
	case "A3L_TaurusBlack": {62};
	case "A3L_TaurusBlue": {62};
	case "A3L_TaurusRed": {62};
	case "A3L_TaurusWhite": {62};
	case "DAR_ChallengerCivBlack": {64};
	case "DAR_ChallengerCivOrange": {64};
	case "DAR_ChallengerCivRed": {64};
	case "DAR_ChallengerCivWhite": {64};
	case "tal_wrangler_black": {93};
	case "tal_wrangler_white": {93};
	case "tal_wrangler_grey": {93};
	case "tal_wrangler_orange": {93};
	case "tal_wrangler_red": {93};
	case "tal_wrangler_blue": {93};
	case "tal_wrangler_green": {93};
	case "tal_wrangler_purple": {93};
	case "tal_wrangler_yellow": {93};
	case "tal_wrangler_lightblue": {93};
	case "tal_wrangler_lime": {93};
	case "tal_wrangler_pink": {93};
	case "S_Skyline_Black": {68};
	case "S_Skyline_Blue": {68};
	case "S_Skyline_Purple": {68};
	case "S_Skyline_Red": {68};
	case "S_Skyline_White": {68};
	case "S_Skyline_Yellow": {68};
	case "DAR_ChargerCiv": {45};
	case "DAR_Charger_Blue": {70};
	case "C_Offroad_02_unarmed_F": {40};
	case "shounka_a3_cliors_civ": {40};
	case "DAR_TahoeCiv": {60};
	case "shounka_a3_ds4_civ": {50};
	case "shounka_a3_spr_civ": {160};
	case "DAR_ImpalaPoliceDet": {45};
	case "shounka_a3_rs5_civ": {60};
	case "I_C_Van_01_transport_brown_F": {90};
	case "I_C_Van_01_transport_olive_F": {90};

//CIVIL AIR > Default -> 10
	case "B_Heli_Light_01_F": {20};
	case "C_Heli_Light_01_civil_F": {20};
	case "O_Heli_Light_02_unarmed_F": {75};
	case "I_Heli_Transport_02_F": {150};

	case "atm_C130_HEC": {10};
	case "atm_C130_JC": {10};
	case "GR_UH1N_1": {10};
	case "O_Heli_Transport_04_covered_F": {10};
	case "O_Heli_Transport_04_box_F": {10};


//CIVIL TRUCK
	case "C_Van_01_box_F": {150};
	case "I_Truck_02_transport_F": {200};
	case "I_Truck_02_covered_F": {250};
	case "B_Truck_01_transport_F": {300};
	case "B_Truck_01_covered_F": {350};
	case "O_Truck_03_device_F": {350};
	case "A3L_Dumptruck": {400};
	case "B_Truck_01_box_F": {700};
	case "B_Truck_01_fuel_F": {700};
	case "O_Truck_02_Ammo_F": {750};
	case "Mrshounka_a3_iveco_f": {600};
	case "shounka_a3_spr_civ": {150};
	case "shounka_a3_renaultmagnum_f": {500};
	case "shounka_a3_dafxf_euro6_f": {200};
	case "C_Truck_02_fuel_F": {250};
	case "C_Truck_02_covered_F": {250};
	case "C_Truck_02_transport_F": {200};

//EMT
	case "I_Truck_02_medical_F": {30};
	case "O_Truck_03_medical_F": {30};
	case "B_Truck_01_medical_F": {30};
	case "A3L_AmberLamps": {75};
	case "A3L_CVPILBFD": {30};
	case "tal_murci_red": {50};
	case "O_Heli_Transport_04_medevac_F": {30};
	case "O_Heli_Transport_04_repair_F": {30};
	case "GR_Bell412_2": {50};
	case "GR_Bell412_1": {50};
	case "B_Truck_01_mover_F": {30};
	case "A3L_Towtruck": {30};
	case "A3L_Hyster60": {10};
	case "DAR_TahoeEMS": {60};
	case "shounka_a3_pompier_sprinter": {100};

//GANGSTER
	case "LandRover_ACR": {75};
	case "LandRover_CZ_EP1": {75};
	case "BAF_Offroad_W": {75};
	case "BAF_Offroad_D": {75};
	case "LandRover_TK_CIV_EP1": {75};

//REBEL CAR
	case "B_G_Offroad_01_F": {65};
	case "O_MRAP_02_F": {40};
	case "DAR_4X4": {170};
	case "DAR_MK27": {220};
	case "DAR_MK23": {270};
	case "DAR_MK27T": {370};
	case "DAR_LHS_16": {520};
	case "DAR_M1151WoodlandUA": {45};
	case "DAR_M1152": {45};
	case "DAR_M1152Woodland": {45};

//REBEL AIR Default -> 10
/*
	case "C130_JC_CAMO": {100};
	case "C130_HC_CAMO": {100};
	case "C130_HEC_CAMO": {100};
	case "C130_HE_CAMO": {125};
	case "C130_JEC_CAMO": {100};
	case "C130_JT_CAMO": {100};
	case "C130_JE_CAMO": {125};
	case "C130_J_CAMO": {125};
	case "GR_UH1H_1": {46};
	case "GR_UH1H_4": {42};*/

//DONATOR
	case "I_Heli_Transport_02_F": {150};
	case "O_Heli_Transport_04_covered_F": {100};
	case "O_Heli_Transport_04_box_F": {100};
	case "atm_C130_HE": {100};
	case "atm_C130_J": {125};
	case "GR_UH1N_2": {42};
	case "A3L_EvoXBlack": {64};
	case "A3L_EvoXRed": {64};
	case "A3L_EvoXWhite": {64};
	case "DAR_MF1Civ": {66};
	case "DAR_MF1Burgundy": {66};
	case "DAR_MF1Orange": {66};
	case "DAR_MF1Red": {66};
	case "DAR_MF1Silver": {66};
	case "tal_murci_white": {68};
	case "tal_murci_grey": {68};
	case "tal_murci_orange": {68};
	case "tal_murci_blue": {68};
	case "tal_murci_green": {68};
	case "tal_murci_purple": {68};
	case "tal_murci_yellow": {68};
	case "tal_murci_PC": {68};
	case "tal_murci_lightblue": {68};
	case "tal_murci_lime": {68};
	case "tal_murci_pink": {68};

//BOAT
	case "C_Rubberboat": {170};
	case "C_Boat_Civil_01_F": {250};
	case "B_CBS_WaterShadow730_F": {100};
	case "O_CBS_WaterShadow730_F": {100};
	case "I_CBS_WaterShadow730_F": {100};
	case "Burnes_MK10_1": {0};

//UMBRELLA
	case "shounka_a3_renaultmagnum_f": {600};

	case "shounka_a3_spr_civ_orange": {150};
	case "shounka_a3_spr_civ_violet": {150};
	case "shounka_a3_spr_civ_grise": {150};
	case "shounka_a3_spr_civ_rose": {150};
	case "shounka_a3_spr_civ_jaune": {150};
	case "shounka_a3_spr_civ_rouge": {150};
	case "shounka_a3_spr_civ_bleufonce": {150};
	case "shounka_a3_spr_civ_noir": {150};

	case "shounka_limo_civ_orange": {50};
	case "shounka_limo_civ_violet": {50};
	case "shounka_limo_civ_grise": {50};
	case "shounka_limo_civ_rose": {50};
	case "shounka_limo_civ_jaune": {50};
	case "shounka_limo_civ_rouge": {50};
	case "shounka_limo_civ_bleufonce": {50};
	case "shounka_limo_civ_noir": {50};

// GENDARMERIE
	case "DAR_TaurusPoliceStateSlick": {45};
	case "DAR_TaurusPoliceState": {45};
	case "C_Offroad_02_unarmed_F": {40};
	case "DAR_TahoePoliceDet": {60};
	case "DAR_ExplorerPoliceStealth": {50};
	case "B_T_LSV_01_unarmed_F": {50};
	case "DAR_ChargerPoliceStateSlick": {50};
	case "DAR_ChargerPoliceState": {50};
	case "B_MRAP_01_F": {30};

// NEW

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









//AUTRE
	case "Land_Box_AmmoOld_F": {700};
    case "B_supplyCrate_F": {1000};

	default {20};
};