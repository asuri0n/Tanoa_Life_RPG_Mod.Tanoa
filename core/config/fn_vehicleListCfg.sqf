#include <macro.h>
/*
    File:
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
    case "kart_shop":
    {
        _return =
        [
            ["C_Kart_01_F",20000],
            ["C_Kart_01_Fuel_F",20000],
            ["C_Kart_01_Blu_F",20000],
            ["C_Kart_01_Red_F",20000],
            ["C_Kart_01_Vrana_F",20000]
        ];
    };

    case "civ_car":
    {
        _return =
        [
            ["B_Quadbike_01_F",1667],

            //["Mrshounka_a3_smart_civ",3333],
            //["Mrshounka_a3_smart_civ_noir",3333],
            //["Mrshounka_a3_smart_civ_bleu",3333],

            //["Mrshounka_twingo_p",20000],
            //["Mrshounka_twingo_p_noir",20000],
            //["Mrshounka_twingo_p_bf",20000],
            //["Mrshounka_twingo_p_r",20000],
            //["Mrshounka_twingo_p_j",20000],
            //["Mrshounka_twingo_p_rose",20000],
            //["Mrshounka_twingo_p_g",20000],
            //["Mrshounka_twingo_p_v",20000],
            //["Mrshounka_twingo_p_o",20000],

            ["C_Offroad_01_F", 30000],
            ["I_C_Offroad_02_unarmed_F", 30000],

            ["C_SUV_01_F", 32000],

            //["Mrshounka_207_civ",36667],
            //["Mrshounka_207_noir",36667],
            //["Mrshounka_207_bleufonce",36667],
            //["Mrshounka_207_rouge",36667],
            //["Mrshounka_207_jaune",36667],
            //["Mrshounka_207_rose",36667],
            //["Mrshounka_207_grise",36667],
            //["Mrshounka_207_violet",36667],
            //["Mrshounka_207_orange",36667],

            //["Mrshounka_c4_p_civ",40000],
            //["Mrshounka_c4_p_bleufonce",40000],
            //["Mrshounka_c4_p_grise",40000],
            //["Mrshounka_c4_p_jaune",40000],
            //["Mrshounka_c4_p_noir",40000],
            //["Mrshounka_c4_p_orange",40000],
            //["Mrshounka_c4_p_rose",40000],
            //["Mrshounka_c4_p_rouge",40000],
            //["Mrshounka_c4_p_violet",40000],

            //["Mrshounka_a3_ds3_civ",40000],
            //["Mrshounka_a3_ds3_civ_noir",40000],
            //["Mrshounka_a3_ds3_civ_bleufonce",40000],
            //["Mrshounka_a3_ds3_civ_civ_rouge",40000],
            //["Mrshounka_a3_ds3_civ_civ_jaune",40000],
            //["Mrshounka_a3_ds3_civ_civ_rose",40000],
            //["Mrshounka_a3_ds3_civ_civ_grise",40000],
            //["Mrshounka_a3_ds3_civ_civ_violet",40000],
            //["Mrshounka_a3_ds3_civ_civ_orange",40000],

            //["shounka_a3_cliors_civ",43500],

            //["Mrshounka_a3_308_civ",46667],
            //["Mrshounka_a3_308_civ_noir",46667],
            //["Mrshounka_a3_308_civ_bleufonce",46667],
            //["Mrshounka_a3_308_civ_rouge",46667],
            //["Mrshounka_a3_308_civ_jaune",46667],
            //["Mrshounka_a3_308_civ_rose",46667],
            //["Mrshounka_a3_308_civ_grise",46667],
            //["Mrshounka_a3_308_civ_violet",46667],
            //["Mrshounka_a3_308_civ_orange",46667],

            //["shounka_nemo",50000],
            //["shounka_nemo_noir",50000],
            //["shounka_nemo_bleufonce",50000],
            //["shounka_nemo_rouge",50000],
            //["shounka_nemo_jaune",50000],
            //["shounka_nemo_rose",50000],
            //["shounka_nemo_grise",50000],
            //["shounka_nemo_violet",50000],
            //["shounka_nemo_orange",50000],

            //["Mrshounka_golfvi_civ",50000],
            //["Mrshounka_golfvi_noir",50000],
            //["Mrshounka_golfvi_bleufonce",50000],
            //["Mrshounka_golfvi_rouge",50000],
            //["Mrshounka_golfvi_jaune",50000],
            //["Mrshounka_golfvi_rose",50000],
            //["Mrshounka_golfvi_grise",50000],
            //["Mrshounka_golfvi_violet",50000],
            //["Mrshounka_golfvi_orange",50000],

            //["DAR_TaurusCivBlack",55333],
            //["DAR_TaurusCivBlue",55333],
            //["DAR_TaurusCiv",55333],

            //["DAR_FusionCivBlack",60000],
            //["DAR_FusionCivBlue",60000],
            //["DAR_FusionCivRed",60000],
            //["DAR_FusionCiv",60000],

            //["shounka_a3_ds4_civ",60000],
            ["C_Hatchback_01_F",60000],

            ["C_Van_01_transport_F",65333],
            ["I_C_Van_01_transport_brown_F",65333],
            ["I_C_Van_01_transport_olive_F",65333],

            //["shounka_a3_peugeot508_civ",66667],
            //["shounka_a3_peugeot508_civ_noir",66667],
            //["shounka_a3_peugeot508_civ_bleufonce",66667],
            //["shounka_a3_peugeot508_civ_rouge",66667],
            //["shounka_a3_peugeot508_civ_jaune",66667],
            //["shounka_a3_peugeot508_civ_rose",66667],
            //["shounka_a3_peugeot508_civ_grise",66667],
            //["shounka_a3_peugeot508_civ_violet",66667],
            //["shounka_a3_peugeot508_civ_orange",66667],

            //["DAR_TahoeCiv",69333],

            //["Mrshounka_mercedes_190_p_civ",70000],
            //["Mrshounka_mercedes_190_p_noir",70000],
            //["Mrshounka_mercedes_190_p_bleufonce",70000],
            //["Mrshounka_mercedes_190_p_rouge",70000],
            //["Mrshounka_mercedes_190_p_jaune",70000],
            //["Mrshounka_mercedes_190_p_rose",70000],
            //["Mrshounka_mercedes_190_p_grise",70000],
            //["Mrshounka_mercedes_190_p_violet",70000],
            //["Mrshounka_mercedes_190_p_orange",70000],

            ["C_Van_01_box_F",73333]

            //["shounka_a3_spr_civ",80000],

            //["Mrshounka_evox_civ",93333],
            //["Mrshounka_evox_bleufonce",93333],
            //["Mrshounka_evox_grise",93333],
            //["Mrshounka_evox_jaune",93333],
            //["Mrshounka_evox_noir",93333],
            //["Mrshounka_evox_orange",93333],
            //["Mrshounka_evox_rose",93333],
            //["Mrshounka_evox_rouge",93333],
            //["Mrshounka_evox_violet",93333],

            //["Mrshounka_a3_308_rcz",106667],
            //["Mrshounka_a3_308_rcz_noir",106667],
            //["Mrshounka_a3_308_rcz_bleufonce",106667],
            //["Mrshounka_a3_308_rcz_rouge",106667],
            //["Mrshounka_a3_308_rcz_jaune",106667],
            //["Mrshounka_a3_308_rcz_rose",106667],
            //["Mrshounka_a3_308_rcz_grise",106667],
            //["Mrshounka_a3_308_rcz_violet",106667],
            //["Mrshounka_a3_308_rcz_orange",106667],

            //["Mrshounka_raptor_civ",120000],
            //["Mrshounka_raptor_noir",120000],
            //["Mrshounka_raptor_bleufonce",120000],
            //["Mrshounka_raptor_rouge",120000],
            //["Mrshounka_raptor_jaune",120000],
            //["Mrshounka_raptor_rose",120000],
            //["Mrshounka_raptor_grise",120000],
            //["Mrshounka_raptor_violet",120000],
            //["Mrshounka_raptor_orange",120000],

            //["Mrshounka_subaru08_civ",126667],
            //["Mrshounka_subaru08_noir",126667],
            //["Mrshounka_subaru08_bleufonce",126667],
            //["Mrshounka_subaru08_rouge",126667],
            //["Mrshounka_subaru08_jaune",126667],
            //["Mrshounka_subaru08_rose",126667],
            //["Mrshounka_subaru08_grise",126667],
            //["Mrshounka_subaru08_violet",126667],
            //["Mrshounka_subaru08_orange",126667],

            //["Mrshounka_megane_rs_2015_civ",126667],
            //["Mrshounka_megane_rs_2015_noir",126667],
            //["Mrshounka_megane_rs_2015_bleufonce",126667],
            //["Mrshounka_megane_rs_2015_rouge",126667],
            //["Mrshounka_megane_rs_2015_jaune",126667],
            //["Mrshounka_megane_rs_2015_rose",126667],
            //["Mrshounka_megane_rs_2015_grise",126667],
            //["Mrshounka_megane_rs_2015_violet",126667],
            //["Mrshounka_megane_rs_2015_orange",126667],

            //["shounka_avalanche",133333],
            //["shounka_avalanche_noir",133333],
            //["shounka_avalanche_bleufonce",133333],
            //["shounka_avalanche_rouge",133333],
            //["shounka_avalanche_jaune",133333],
            //["shounka_avalanche_rose",133333],
            //["shounka_avalanche_grise",133333],
            //["shounka_avalanche_violet",133333],
            //["shounka_avalanche_orange",133333],

            //["Mrshounka_rs4_civ",150000],
            //["Mrshounka_rs4_civ_noir",150000],
            //["Mrshounka_rs4_civ_bleufonce",150000],
            //["Mrshounka_rs4_civ_rouge",150000],
            //["Mrshounka_rs4_civ_jaune",150000],
            //["Mrshounka_rs4_civ_rose",150000],
            //["Mrshounka_rs4_civ_grise",150000],
            //["Mrshounka_rs4_civ_violet",150000],
            //["Mrshounka_rs4_civ_orange",150000],

            //["Mrshounka_bmwm1_civ",173333],
            //["Mrshounka_bmwm1_civ_noir",173333],
            //["Mrshounka_bmwm1_civ_bleufonce",173333],
            //["Mrshounka_bmwm1_civ_rouge",173333],
            //["Mrshounka_bmwm1_civ_jaune",173333],
            //["Mrshounka_bmwm1_civ_rose",173333],
            //["Mrshounka_bmwm1_civ_grise",173333],
            //["Mrshounka_bmwm1_civ_violet",173333],
            //["Mrshounka_bmwm1_civ_orange",173333],

            //["DAR_ChargerCiv",110000],

            //["Mrshounka_Bowler_c",183333],
            //["Mrshounka_Bowler_c_noir",183333],
            //["Mrshounka_Bowler_c_bleufonce",183333],
            //["Mrshounka_Bowler_c_rouge",183333],
            //["Mrshounka_Bowler_c_jaune",183333],
            //["Mrshounka_Bowler_c_rose",183333],
            //["Mrshounka_Bowler_c_grise",183333],
            //["Mrshounka_Bowler_c_violet",183333],
            //["Mrshounka_Bowler_c_orange",183333],

            //["shounka_rs6",186667],
            //["shounka_rs6_noir",186667],
            //["shounka_rs6_bleufonce",186667],
            //["shounka_rs6_rouge",186667],
            //["shounka_rs6_jaune",186667],
            //["shounka_rs6_rose",186667],
            //["shounka_rs6_grise",186667],
            //["shounka_rs6_violet",186667],
            //["shounka_rs6_orange",186667],

            //["Mrshounka_mustang_civ",193333],
            //["Mrshounka_mustang_mat",193333],
            //["Mrshounka_mustang_noir",193333],
            //["Mrshounka_mustang_mat_n",193333],
            //["Mrshounka_mustang_bleufonce",193333],
            //["Mrshounka_mustang_mat_b",193333],
            //["Mrshounka_mustang_rouge",193333],
            //["Mrshounka_mustang_jaune",193333],
            //["Mrshounka_mustang_rose",193333],
            //["Mrshounka_mustang_grise",193333],
            //["Mrshounka_mustang_violet",193333],
            //["Mrshounka_mustang_orange",193333]

        ];
    };

    case "civ_luxe":
    {
        _return =
        [
        //NEW
            //["Mrshounka_yamaha_p",40000],
            //["Mrshounka_yamaha_p_noir",40000],
            //["Mrshounka_yamaha_p_bf",40000],
            //["Mrshounka_yamaha_p_r",40000],
            //["Mrshounka_yamaha_p_j",40000],
            //["Mrshounka_yamaha_p_rose",40000],
            //["Mrshounka_yamaha_p_g",40000],
            //["Mrshounka_yamaha_p_v",40000],
            //["Mrshounka_yamaha_p_o",40000],

            //["Mrshounka_ducati_p",100000],
            //["Mrshounka_ducati_p_noir",100000],
            //["Mrshounka_ducati_p_bf",100000],
            //["Mrshounka_ducati_p_r",100000],
            //["Mrshounka_ducati_p_j",100000],
            //["Mrshounka_ducati_p_rose",100000],
            //["Mrshounka_ducati_p_g",100000],
            //["Mrshounka_ducati_p_v",100000],
            //["Mrshounka_ducati_p_o",100000],

            //["Mrshounka_c63_2015_civ",153333],
            //["Mrshounka_c63_2015_mat",153333],
            //["Mrshounka_c63_2015_noir",153333],
            //["Mrshounka_c63_2015_mat_n",153333],
            //["Mrshounka_c63_2015_bleufonce",153333],
            //["Mrshounka_c63_2015_mat_b",153333],
            //["Mrshounka_c63_2015_rouge",153333],
            //["Mrshounka_c63_2015_jaune",153333],
            //["Mrshounka_c63_2015_rose",153333],
            //["Mrshounka_c63_2015_grise",153333],
            //["Mrshounka_c63_2015_violet",153333],
            //["Mrshounka_c63_2015_orange",153333],

            //["Mrshounka_hummer_civ",193333],
            //["Mrshounka_hummer_civ_noir",193333],
            //["Mrshounka_hummer_civ_bleufonce",193333],
            //["Mrshounka_hummer_civ_rouge",193333],
            //["Mrshounka_hummer_civ_jaune",193333],
            //["Mrshounka_hummer_civ_rose",193333],
            //["Mrshounka_hummer_civ_grise",193333],
            //["Mrshounka_hummer_civ_violet",193333],
            //["Mrshounka_hummer_civ_orange",193333],

            //["shounka_porsche911",193333],
            //["shounka_porsche911_noir",193333],
            //["shounka_porsche911_bleufonce",193333],
            //["shounka_porsche911_rouge",193333],
            //["shounka_porsche911_jaune",193333],
            //["shounka_porsche911_rose",193333],
            //["shounka_porsche911_grise",193333],
            //["shounka_porsche911_violet",193333],
            //["shounka_porsche911_orange",193333],

            //["shounka_transam",200000],
            //["shounka_transam_noir",200000],
            //["shounka_transam_bleufonce",200000],
            //["shounka_transam_rouge",200000],
            //["shounka_transam_jaune",200000],
            //["shounka_transam_rose",200000],
            //["shounka_transam_grise",200000],
            //["shounka_transam_violet",200000],
            //["shounka_transam_orange",200000],

            //["Mrshounka_a3_dodge15_civ",240000],
            //["Mrshounka_a3_dodge15_civ_noir",240000],
            //["Mrshounka_a3_dodge15_civ_bleufonce",240000],
            //["Mrshounka_a3_dodge15_civ_rouge",240000],
            //["Mrshounka_a3_dodge15_civ_jaune",240000],
            //["Mrshounka_a3_dodge15_civ_rose",240000],
            //["Mrshounka_a3_dodge15_civ_grise",240000],
            //["Mrshounka_a3_dodge15_civ_violet",240000],
            //["Mrshounka_a3_dodge15_civ_orange",240000],

            //["Mrshounka_a3_gtr_civ",250000],
            //["Mrshounka_a3_gtr_civ_noir",250000],
            //["Mrshounka_a3_gtr_civ_bleu",250000],

            //["Mrshounka_cayenne_p_civ",300000],
            //["Mrshounka_cayenne_p_bleufonce",300000],
            //["Mrshounka_cayenne_p_grise",300000],
            //["Mrshounka_cayenne_p_jaune",300000],
            //["Mrshounka_cayenne_p_noir",300000],
            //["Mrshounka_cayenne_p_orange",300000],
            //["Mrshounka_cayenne_p_rose",300000],
            //["Mrshounka_cayenne_p_rouge",300000],
            //["Mrshounka_cayenne_p_violet",300000],

            //["shounka_a3_rs5_civ",300000],

            //["shounka_f430_spider",433333],
            //["shounka_f430_spider_noir",433333],
            //["shounka_f430_spider_bleufonce",433333],
            //["shounka_f430_spider_rouge",433333],
            //["shounka_f430_spider_jaune",433333],
            //["shounka_f430_spider_rose",433333],
            //["shounka_f430_spider_grise",433333],
            //["shounka_f430_spider_violet",433333],
            //["shounka_f430_spider_orange",433333],

            //["Mrshounka_huracan_c",600000],

            //["shounka_mp4",733333],
            //["shounka_mp4_noir",733333],
            //["shounka_mp4_bleufonce",733333],
            //["shounka_mp4_rouge",733333],
            //["shounka_mp4_jaune",733333],
            //["shounka_mp4_rose",733333],
            //["shounka_mp4_grise",733333],
            //["shounka_mp4_violet",733333],
            //["shounka_mp4_orange",733333]

        ];
    };

    case "civ_truck":
    {
        _return =
        [
            //["shounka_a3_dafxf_euro6_f",153333],
            ["C_Truck_02_fuel_F",186667],
            ["C_Truck_02_transport_F",166667],
            ["C_Truck_02_covered_F",186667],
            ["B_Truck_01_transport_F",266667],
            ["B_Truck_01_covered_F",300000],
            //["shounka_a3_renaultmagnum_f",333333],
            ["B_Truck_01_box_F",466667],
            ["B_Truck_01_fuel_F",466667],
            ["O_Truck_03_device_F",500000]
            //["O_Truck_02_Ammo_F",5333333]
        ];
    };

    case "civ_air":
    {
        _return =
        [
            ["B_Heli_Light_01_F",666666],
            ["C_Heli_Light_01_civil_F",666666],
            ["C_Plane_Civil_01_F",500000],
            ["O_Heli_Light_02_unarmed_F",666666]
        ];
    };

    case "civ_ship":
    {
        _return =
        [
            ["C_Rubberboat",33333],
            ["I_C_Boat_Transport_02_F",50000],
            ["C_Boat_Civil_01_F",100000]
        ];
    };

    case "reb_car":
    {
        _return =
        [
            ["B_G_Offroad_01_F",30000],
            ["C_SUV_01_F",32000],
            ["O_G_Van_01_fuel_F",80000],
            ["O_G_Van_01_transport_F",80000],

            //["Mrshounka_Vandura_civ",96667],
            //["Mrshounka_Vandura_civ_noir",96667],
            //["Mrshounka_Vandura_civ_bleufonce",96667],
            //["Mrshounka_Vandura_civ_rouge",96667],
            //["Mrshounka_Vandura_civ_jaune",96667],
            //["Mrshounka_Vandura_civ_rose",96667],
            //["Mrshounka_Vandura_civ_grise",96667],
            //["Mrshounka_Vandura_civ_violet",96667],
            //["Mrshounka_Vandura_civ_orange",96667],

            //["Mrshounka_cherokee_noir",173333],
            //["Mrshounka_cherokee_noir_mat",173333],
            //["Mrshounka_cherokee_noir_bleu",173333],
            //["Mrshounka_cherokee_noir_bleu_mat",173333],
            //["Mrshounka_cherokee_noir_blanc",173333],
            //["Mrshounka_cherokee_noir_blanc_mat",173333],
            //["Mrshounka_cherokee_noir_violet",173333],
            //["Mrshounka_cherokee_noir_violet_mat",173333],
            //["Mrshounka_cherokee_noir_rouge",173333],
            //["Mrshounka_cherokee_noir_rouge_mat",173333],

            ["O_T_LSV_02_unarmed_F",200000],
            ["O_Truck_03_transport_F",200000], // REBELLES
            ["O_Truck_03_covered_F",233333], // REBELLES
            //["DAR_LHS_16",350000],
            //["DAR_M1151WoodlandUA",350000],
            //["DAR_M1152",350000],
            //["DAR_M1152Woodland",350000],
            ["I_G_Offroad_01_armed_F",400000],
            //["DAR_MK27",433333],
            //["DAR_MK27T",500000],
            ["I_MRAP_03_F",1000000],
            ["O_MRAP_02_F",666666]

        ];
    };

    case "reb_air":
    {
        _return =
        [
            ["B_Heli_Light_01_F",666666], //20
            ["O_Heli_Light_02_unarmed_F",1866666], //75
            ["I_Heli_Transport_02_F",3333333] //150
        ];
    };

    case "donateur":
    {
        switch(true) do
        {
            case (__GETC__(life_donator) != 0) :
            {
                _return =
                [

			["I_Heli_Transport_02_F",333333],
			["C_Hatchback_01_sport_F",250000]


            //["Skyline_Bus_10_F",20000],

                    //NEW
            //["Mrshounka_corbillard_c",33333],
            //["Mrshounka_corbillard_c_noir",33333],
            //["Mrshounka_corbillard_c_bleufonce",33333],
            //["Mrshounka_corbillard_c_rouge",33333],
            //["Mrshounka_corbillard_c_jaune",33333],
            //["Mrshounka_corbillard_c_rose",33333],
            //["Mrshounka_corbillard_c_grise",33333],
            //["Mrshounka_corbillard_c_violet",33333],
            //["Mrshounka_corbillard_c_orange",33333],

            //["Mrshounka_r5_civ",40000],
            //["Mrshounka_r5_bleufonce",40000],
            //["Mrshounka_r5_grise",40000],
            //["Mrshounka_r5_jaune",40000],
            //["Mrshounka_r5_noir",40000],
            //["Mrshounka_r5_orange",40000],
            //["Mrshounka_r5_rose",40000],
            //["Mrshounka_r5_rouge",40000],
            //["Mrshounka_r5_violet",40000],

            //["shounka_a3_peugeot508_civ",100000],

            //["DAR_ChallengerCivWhite",130000],
			//["DAR_ChallengerCivRed",130000],
			//["DAR_ChallengerCivBlack",130000],
			//["DAR_ChallengerCivOrange",130000],


            //["Mrshounka_raptor2_civ",133333],
            //["Mrshounka_raptor2_noir",133333],
            //["Mrshounka_raptor2_bleufonce",133333],
            //["Mrshounka_raptor2_rouge",133333],
            //["Mrshounka_raptor2_jaune",133333],
            //["Mrshounka_raptor2_rose",133333],
            //["Mrshounka_raptor2_grise",133333],
            //["Mrshounka_raptor2_violet",133333],
            //["Mrshounka_raptor2_orange",133333],

            //["Mrshounka_Volkswagen_Touareg_civ",133333],
            //["Mrshounka_Volkswagen_Touareg_noir",133333],
            //["Mrshounka_Volkswagen_Touareg_bleufonce",133333],
            //["Mrshounka_Volkswagen_Touareg_rouge",133333],
            //["Mrshounka_Volkswagen_Touareg_jaune",133333],
            //["Mrshounka_Volkswagen_Touareg_rose",133333],
            //["Mrshounka_Volkswagen_Touareg_grise",133333],
            //["Mrshounka_Volkswagen_Touareg_violet",133333],
            //["Mrshounka_Volkswagen_Touareg_orange",133333],

            //["shounka_clk",153333],
            //["shounka_clk_noir",153333],
            //["shounka_clk_bleufonce",153333],
            //["shounka_clk_rouge",153333],
            //["shounka_clk_jaune",153333],
            //["shounka_clk_rose",153333],
            //["shounka_clk_grise",153333],
            //["shounka_clk_violet",153333],
            //["shounka_clk_orange",153333],

            //["Mrshounka_lincoln_civ",166667],
            //["Mrshounka_lincoln_noir",166667],
            //["Mrshounka_lincoln_bleufonce",166667],
            //["Mrshounka_lincoln_rouge",166667],
            //["Mrshounka_lincoln_jaune",166667],
            //["Mrshounka_lincoln_rose",166667],
            //["Mrshounka_lincoln_grise",166667],
            //["Mrshounka_lincoln_violet",166667],
            //["Mrshounka_lincoln_orange",166667],

            //["shounka_h2",193333],
            //["shounka_h2_noir",193333],
            //["shounka_h2_bleufonce",193333],
            //["shounka_h2_rouge",193333],
            //["shounka_h2_jaune",193333],
            //["shounka_h2_rose",193333],
            //["shounka_h2_grise",193333],
            //["shounka_h2_violet",193333],
            //["shounka_h2_orange",193333],

            //["shounka_buggy",200000],
            //["shounka_buggy_noir",200000],
            //["shounka_buggy_bleufonce",200000],
            //["shounka_buggy_rouge",200000],
            //["shounka_buggy_jaune",200000],
            //["shounka_buggy_rose",200000],
            //["shounka_buggy_grise",200000],
            //["shounka_buggy_violet",200000],
            //["shounka_buggy_orange",200000],

            //["Mrshounka_bmwm6_civ",216667],
            //["Mrshounka_bmwm6_noir",216667],
            //["Mrshounka_bmwm6_bleufonce",216667],
            //["Mrshounka_bmwm6_rouge",216667],
            //["Mrshounka_bmwm6_jaune",216667],
            //["Mrshounka_bmwm6_rose",216667],
            //["Mrshounka_bmwm6_grise",216667],
            //["Mrshounka_bmwm6_violet",216667],
            //["Mrshounka_bmwm6_orange",216667],

            //["shounka_monsteur",266667],
            //["shounka_monsteur_noir",266667],
            //["shounka_monsteur_bleufonce",266667],
            //["shounka_monsteur_rouge",266667],
            //["shounka_monsteur_jaune",266667],
            //["shounka_monsteur_rose",266667],
            //["shounka_monsteur_grise",266667],
            //["shounka_monsteur_violet",266667],
            //["shounka_monsteur_orange",266667],

            //["Mrshounka_jeep_blinde_noir",266667],
            //["Mrshounka_jeep_blinde_noir_mat",266667],
            //["Mrshounka_jeep_blinde_bleu",266667],
            //["Mrshounka_jeep_blinde_bleu_mat",266667],
            //["Mrshounka_jeep_blinde_blanc",266667],
            //["Mrshounka_jeep_blinde_blanc_mat",266667],
            //["Mrshounka_jeep_blinde_violet",266667],
            //["Mrshounka_jeep_blinde_violet_mat",266667],
            //["Mrshounka_jeep_blinde_rouge",266667],
            //["Mrshounka_jeep_blinde_rouge_mat",266667],

            //["shounka_gt",300000],
            //["shounka_gt_noir",300000],
            //["shounka_gt_bleufonce",300000],
            //["shounka_gt_rouge",300000],
            //["shounka_gt_jaune",300000],
            //["shounka_gt_rose",300000],
            //["shounka_gt_grise",300000],
            //["shounka_gt_violet",300000],
            //["shounka_gt_orange",300000],

            //["Mrshounka_agera_p",400000],
            //["Mrshounka_agera_p_noir",400000],
            //["Mrshounka_agera_p_bleu",400000],
            //["Mrshounka_agera_p_jaune",400000],

			//["shounka_limo_civ",650000],

			//["Mrshounka_92_civ",666666],

            //["Mrshounka_veneno_c",800000],
            //["Mrshounka_veneno_c_noir",800000],
            //["Mrshounka_veneno_c_bleu",800000],
            //["Mrshounka_veneno_c_jaune",800000],

            //["Mrshounka_pagani_c",933333],
            //["Mrshounka_pagani_c_noir",933333],
            //["Mrshounka_pagani_c_bleufonce",933333],
            //["Mrshounka_pagani_c_rouge",933333],
            //["Mrshounka_pagani_c_jaune",933333],
            //["Mrshounka_pagani_c_rose",933333],
            //["Mrshounka_pagani_c_grise",933333],
            //["Mrshounka_pagani_c_violet",933333],
            //["Mrshounka_pagani_c_orange",933333],

            //["Mrshounka_lykan_c",5333333],
            //["Mrshounka_lykan_c_noir",5333333],
            //["Mrshounka_lykan_c_bleufonce",5333333],
            //["Mrshounka_lykan_c_rouge",5333333],
            //["Mrshounka_lykan_c_jaune",5333333],
            //["Mrshounka_lykan_c_rose",5333333],
            //["Mrshounka_lykan_c_grise",5333333],
            //["Mrshounka_lykan_c_violet",5333333],
            //["Mrshounka_lykan_c_orange",5333333]



                ];
            };
            default
            {
                _return =
                [
                ];
            };
        };
    };

    case "cop_car":
    {
        switch(__GETC__(life_coplevel)) do
        {
            case 1 : //RÃƒÆ’Ã‚Â©serviste
            {
				_return =
				[
					["B_Quadbike_01_F", 5000]
					//["Mrshounka_a3_308_gend",13333] // Gendarme
				];
            };
            case 2 : //Gendarme
            {
				_return =
				[
					["B_Quadbike_01_F", 5000],
					//["Mrshounka_ducati_police_p",10000], // Gendarme
					//["Mrshounka_a3_308_gend",13333], // Gendarme
					//["Mrshounka_a3_rs_gend",16666], // Adjudant
					["C_Offroad_02_unarmed_F",20000],
                              ["I_C_Offroad_02_unarmed_F", 25000],
					["B_T_LSV_01_unarmed_F",33500]
				];
            };
            case 3 : //adjudant
            {
				_return =
				[
					["B_Quadbike_01_F", 5000],
					//["Mrshounka_ducati_police_p",10000], // Gendarme
					//["Mrshounka_a3_308_gend",13333], // Gendarme
					//["Mrshounka_a3_rs_gend",16666], // Adjudant
					//["shounka_a3_gendsprinter",20000], // Adjudant
					["C_Offroad_02_unarmed_F",20000],
                              ["I_C_Offroad_02_unarmed_F", 25000],

					//["shounka_a3_508gend",26666], // Lieutenant
					//["Mrshounka_bmw_gend",33333], // Lieutenant

					["B_T_LSV_01_unarmed_F",33500]
				];
            };
            case 4 : //Lieutenant
            {
				_return =
				[
					["B_Quadbike_01_F", 5000],
					//["Mrshounka_ducati_police_p",10000], // Gendarme
					//["Mrshounka_a3_308_gend",13333], // Gendarme
					//["Mrshounka_a3_rs_gend",16666], // Adjudant
					//["shounka_a3_gendsprinter",20000], // Adjudant
					["C_Offroad_02_unarmed_F",20000],
                              ["I_C_Offroad_02_unarmed_F", 25000],

					//["shounka_a3_508gend",26666], // Lieutenant
					//["Mrshounka_bmw_gend",33333], // Lieutenant

					["B_T_LSV_01_unarmed_F",33500],
					//["shounka_a3_audiq7_v2_gendarmerie",53333], // Major

					["I_MRAP_03_F",200000]

					//CIVIL
					//["Mrshounka_rs4_civ",17000],
					//["Mrshounka_rs4_civ_noir",17000],
					//["Mrshounka_rs4_civ_bleufonce",17000],
					//["Mrshounka_rs4_civ_rouge",17000],
					//["Mrshounka_rs4_civ_jaune",17000],
					//["Mrshounka_rs4_civ_rose",17000],
					//["Mrshounka_rs4_civ_grise",17000],
					//["Mrshounka_rs4_civ_violet",17000],
					//["Mrshounka_rs4_civ_orange",17000]
				];
            };
            case 5 : //Major
            {
				_return =
				[
					["B_Quadbike_01_F", 5000],
					//["Mrshounka_ducati_police_p",10000], // Gendarme
					//["Mrshounka_a3_308_gend",13333], // Gendarme
					//["Mrshounka_a3_rs_gend",16666], // Adjudant
					//["shounka_a3_gendsprinter",20000], // Adjudant
					["C_Offroad_02_unarmed_F",20000],
                              ["I_C_Offroad_02_unarmed_F", 25000],

					//["shounka_a3_508gend",26666], // Lieutenant
					//["Mrshounka_bmw_gend",33333], // Lieutenant

					["B_T_LSV_01_unarmed_F",33500],
					//["shounka_a3_audiq7_v2_gendarmerie",53333], // Major
					//["Mrshounka_agera_gend_p",66666], // Colonel

					["I_MRAP_03_F",200000]

					//CIVIL
					//["Mrshounka_rs4_civ",17000],
					//["Mrshounka_rs4_civ_noir",17000],
					//["Mrshounka_rs4_civ_bleufonce",17000],
					//["Mrshounka_rs4_civ_rouge",17000],
					//["Mrshounka_rs4_civ_jaune",17000],
					//["Mrshounka_rs4_civ_rose",17000],
					//["Mrshounka_rs4_civ_grise",17000],
					//["Mrshounka_rs4_civ_violet",17000],
					//["Mrshounka_rs4_civ_orange",17000],

					//["Mrshounka_twingo_p",26000],
					//["Mrshounka_twingo_p_noir",26000],
					//["Mrshounka_twingo_p_bf",26000],
					//["Mrshounka_twingo_p_r",26000],
					//["Mrshounka_twingo_p_j",26000],
					//["Mrshounka_twingo_p_rose",26000],
					//["Mrshounka_twingo_p_g",26000],
					//["Mrshounka_twingo_p_v",26000],
					//["Mrshounka_twingo_p_o",26000]
				];
            };
            case 6 : //Colonel
            {
				_return =
				[
					["B_Quadbike_01_F", 5000],
					//["Mrshounka_ducati_police_p",10000], // Gendarme
					//["Mrshounka_a3_308_gend",13333], // Gendarme
					//["Mrshounka_a3_rs_gend",16666], // Adjudant
					//["shounka_a3_gendsprinter",20000], // Adjudant
					["C_Offroad_02_unarmed_F",20000],
                              ["I_C_Offroad_02_unarmed_F", 25000],

					//["shounka_a3_508gend",26666], // Lieutenant
					//["Mrshounka_bmw_gend",33333], // Lieutenant

					["B_T_LSV_01_unarmed_F",33500],
					//["shounka_a3_audiq7_v2_gendarmerie",53333], // Major
					//["Mrshounka_agera_gend_p",66666], // Colonel

					["I_MRAP_03_F",200000]

					//CIVIL
					//["Mrshounka_rs4_civ",17000],
					//["Mrshounka_rs4_civ_noir",17000],
					//["Mrshounka_rs4_civ_bleufonce",17000],
					//["Mrshounka_rs4_civ_rouge",17000],
					//["Mrshounka_rs4_civ_jaune",17000],
					//["Mrshounka_rs4_civ_rose",17000],
					//["Mrshounka_rs4_civ_grise",17000],
					//["Mrshounka_rs4_civ_violet",17000],
					//["Mrshounka_rs4_civ_orange",17000],

					//["Mrshounka_twingo_p",26000],
					//["Mrshounka_twingo_p_noir",26000],
					//["Mrshounka_twingo_p_bf",26000],
					//["Mrshounka_twingo_p_r",26000],
					//["Mrshounka_twingo_p_j",26000],
					//["Mrshounka_twingo_p_rose",26000],
					//["Mrshounka_twingo_p_g",26000],
					//["Mrshounka_twingo_p_v",26000],
					//["Mrshounka_twingo_p_o",26000],

					//["Mrshounka_megane_rs_2015_civ",60000],
					//["Mrshounka_megane_rs_2015_noir",60000],
					//["Mrshounka_megane_rs_2015_bleufonce",60000],
					//["Mrshounka_megane_rs_2015_rouge",60000],
					//["Mrshounka_megane_rs_2015_jaune",60000],
					//["Mrshounka_megane_rs_2015_rose",60000],
					//["Mrshounka_megane_rs_2015_grise",60000],
					//["Mrshounka_megane_rs_2015_violet",60000],
					//["Mrshounka_megane_rs_2015_orange",60000]

				];
            };
            case 7 : //GÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©ral
            {
				_return =
				[
					["O_T_MBT_02_cannon_ghex_F", 1],

					["B_Quadbike_01_F", 5000],
					//["Mrshounka_ducati_police_p",10000], // Gendarme
					//["Mrshounka_a3_308_gend",13333], // Gendarme
					//["Mrshounka_a3_rs_gend",16666], // Adjudant
					//["shounka_a3_gendsprinter",20000], // Adjudant
					["C_Offroad_02_unarmed_F",20000],
                              ["I_C_Offroad_02_unarmed_F", 25000],

					//["DAR_TahoePoliceDet",20000], //
					//["DAR_ExplorerPoliceStealth",24000], //
					//["shounka_a3_508gend",26666], // Lieutenant
					//["Mrshounka_bmw_gend",33333], // Lieutenant
					["B_T_LSV_01_unarmed_F",33500],
					//["DAR_ChargerPoliceStateSlick",33500], //
					//["DAR_ChargerPoliceState",40000], //
					//["shounka_a3_audiq7_v2_gendarmerie",53333], // Major

					//["Mrshounka_cherokee_noir",60000], //
					//["Mrshounka_cherokee_noir_mat",60000], //
					//["Mrshounka_agera_gend_p",66666], // Colonel

					["I_MRAP_03_F",200000]

					//CIVIL
					//["Mrshounka_rs4_civ",17000],
					//["Mrshounka_rs4_civ_noir",17000],
					//["Mrshounka_rs4_civ_bleufonce",17000],
					//["Mrshounka_rs4_civ_rouge",17000],
					//["Mrshounka_rs4_civ_jaune",17000],
					//["Mrshounka_rs4_civ_rose",17000],
					//["Mrshounka_rs4_civ_grise",17000],
					//["Mrshounka_rs4_civ_violet",17000],
					//["Mrshounka_rs4_civ_orange",17000],

					//["Mrshounka_twingo_p",26000],
					//["Mrshounka_twingo_p_noir",26000],
					//["Mrshounka_twingo_p_bf",26000],
					//["Mrshounka_twingo_p_r",26000],
					//["Mrshounka_twingo_p_j",26000],
					//["Mrshounka_twingo_p_rose",26000],
					//["Mrshounka_twingo_p_g",26000],
					//["Mrshounka_twingo_p_v",26000],
					//["Mrshounka_twingo_p_o",26000],

					//["Mrshounka_megane_rs_2015_civ",60000],
					//["Mrshounka_megane_rs_2015_noir",60000],
					//["Mrshounka_megane_rs_2015_bleufonce",60000],
					//["Mrshounka_megane_rs_2015_rouge",60000],
					//["Mrshounka_megane_rs_2015_jaune",60000],
					//["Mrshounka_megane_rs_2015_rose",60000],
					//["Mrshounka_megane_rs_2015_grise",60000],
					//["Mrshounka_megane_rs_2015_violet",60000],
					//["Mrshounka_megane_rs_2015_orange",60000]

				];
            };
            case 8 : //GIGN
            {
				_return =
				[
					["B_Quadbike_01_F", 5000],
					//["Mrshounka_ducati_police_p",10000], // Gendarme
					//["Mrshounka_a3_308_gend",13333], // Gendarme
					//["Mrshounka_a3_rs_gend",16666], // Adjudant
					//["shounka_a3_gendsprinter",20000], // Adjudant
					["C_Offroad_02_unarmed_F",20000],
					//["DAR_TahoePoliceDet",20000], //
					//["DAR_ExplorerPoliceStealth",24000], //
					//["shounka_a3_508gend",26666], // Lieutenant
					//["Mrshounka_bmw_gend",33333], // Lieutenant

					["B_T_LSV_01_unarmed_F",33500],
					//["DAR_ChargerPoliceStateSlick",33500], //
					//["DAR_ChargerPoliceState",40000], //
					//["shounka_a3_audiq7_v2_gendarmerie",53333], // Major

					//["Mrshounka_cherokee_noir",60000], //
					//["Mrshounka_cherokee_noir_mat",60000], //
					//["Mrshounka_agera_gend_p",66666], // Colonel

					["I_MRAP_03_F",200000]
				];
            };
        };
    };

    case "cop_air":
    {
        switch(__GETC__(life_coplevel)) do
        {
            case 1 : //RÃƒÆ’Ã‚Â©serviste
            {
                if(__GETC__(life_donator) > 0) then
                {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333]
                    ];
                } else {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000]
                    ];
                };
            };
            case 2 : //Gendarme
            {
                if(__GETC__(life_donator) > 0) then
                {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333]
                    ];
                } else {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000]
                    ];
                };
            };
            case 3 : //Adjudant
            {
                if(__GETC__(life_donator) > 0) then
                {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333]
                    ];
                } else {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000]
                    ];
                };
            };
            case 4 : //Lieutenant
            {
                _return =
                [
                    ["B_Heli_Light_01_F",142000],
                    ["O_Heli_Light_02_unarmed_F",233333]
                ];
            };
            case 5 : //Major
            {
                if(__GETC__(life_donator) > 0) then
                {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333],
                        ["I_Heli_light_03_unarmed_F",245000],
                        ["B_Heli_Transport_03_unarmed_F",200000]
                    ];
                } else {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333]
                    ];
                };
            };
            case 6 : //Colonel
            {
                if(__GETC__(life_donator) > 0) then
                {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333],
                        ["I_Heli_light_03_unarmed_F",245000],
                        ["B_Heli_Transport_03_unarmed_F",200000]
                    ];
                } else {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333],
                        ["B_Heli_Transport_03_unarmed_F",200000]
                    ];
                };
            };
            case 7 : //GÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©ral
            {
                if(__GETC__(life_donator) > 0) then
                {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333],
                        ["I_Heli_light_03_unarmed_F",245000],
                        ["B_Heli_Transport_01_F",225000],
                        ["B_Heli_Transport_03_unarmed_F",200000]
                    ];
                } else {
                    _return =
                    [
                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333],
                        ["I_Heli_light_03_unarmed_F",245000],
                        ["B_Heli_Transport_01_F",225000],
                        ["B_Heli_Transport_03_unarmed_F",200000]
                    ];
                };
            };
            case 7 : //GIGN
            {
				_return =
				[

				];
            };
            default
            {
                _return =
                [
                ];
            };
        };
    };

    case "cop_ship":
    {
        _return =
        [
            ["C_Boat_Civil_01_police_F",20000],
            ["C_Rubberboat",3000],
            ["O_SDV_01_F",100000],
            ["B_Boat_Armed_01_minigun_F",250000]
        ];
    };

    case "depan_car":
    {
    };

    case "med_shop":
    {
        switch(__GETC__(life_mediclevel)) do
        {
            case 1 :
            {
                _return =
                [
                    ["B_Quadbike_01_F", 3333],
                    ["C_Offroad_01_F", 6667],
                    ["C_Hatchback_01_F", 10000],
                    ["C_SUV_01_F", 13333],
                    ["C_Van_01_box_F", 23333]
                ];
            };
            case 2 :
            {
                _return =
                [
                    ["B_Quadbike_01_F", 3333],
                    ["C_Offroad_01_F", 6667],
                    ["C_Hatchback_01_F", 10000],
                    ["C_SUV_01_F", 13333],
                    ["C_Van_01_box_F", 23333]
                ];
            };
            case 3 :
            {
                _return =
                [
                    ["B_Quadbike_01_F", 3333],
                    ["C_Offroad_01_F", 6667],
                    ["C_Hatchback_01_F", 10000],
                    ["C_SUV_01_F", 13333],
                    ["C_Van_01_box_F", 23333]
				];
            };
            case 4 :
            {
                _return =
                [
                    ["B_Quadbike_01_F", 3333],
                    ["C_Offroad_01_F", 6667],
                    ["C_Hatchback_01_F", 10000],
                    ["C_SUV_01_F", 13333],
                    ["C_Van_01_box_F", 23333]
                ];
            };
            default
            {
                _return =
                [
                ];
            };
        };
    };

    case "med_air_hs":
    {
        switch(__GETC__(life_mediclevel)) do
        {
            case 1 :
            {
                _return =
                [
                    ["C_Heli_Light_01_civil_F", 60000],
                    ["I_Heli_Transport_02_F", 100000]
                ];
            };
            case 2 :
            {
                _return =
                [
                    ["C_Heli_Light_01_civil_F", 60000],
                    ["I_Heli_Transport_02_F", 100000]
                ];
            };
            case 3 :
            {
                _return =
                [
                    ["C_Heli_Light_01_civil_F", 60000],
                    ["I_Heli_Transport_02_F", 100000]
                ];
            };
            case 4 :
            {
                _return =
                [
                    ["C_Heli_Light_01_civil_F", 60000],
                    ["I_Heli_Transport_02_F", 100000]
                ];
            };
            default
            {
                _return =
                [
                ];
            };
        };
    };
};
_return;