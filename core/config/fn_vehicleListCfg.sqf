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
    case "kart_shop": // [REVIEWED]
    {
        _return =
        [
            ["C_Kart_01_F",15000],
            ["C_Kart_01_Fuel_F",15000],
            ["C_Kart_01_Blu_F",15000],
            ["C_Kart_01_Red_F",15000],
            ["C_Kart_01_Vrana_F",15000]
        ];
    };

    case "civ_car": // [REVIEWED]
    {
        _return =
        [
            ["B_Quadbike_01_F",2500],
            ["C_Hatchback_01_F",30000],
            ["C_Offroad_01_F", 40000],
            ["C_SUV_01_F", 50000],
            ["C_Van_01_box_F",70000],
            ["C_Van_01_transport_F",80000],
            ["I_C_Van_01_transport_F",80000],
            ["I_C_Van_01_transport_brown_F",80000],
            ["I_C_Van_01_transport_olive_F",80000],
            ["C_Hatchback_01_sport_F",100000],
            ["C_Offroad_02_unarmed_F",50000]
        ];
    };

    case "civ_truck": // [REVIEWED]
    {
        _return =
        [
            // zamak
            ["O_Truck_02_transport_F",200000],
            ["O_Truck_02_covered_F",250000],
            ["O_Truck_02_fuel_F",300000],
            // Tempest
            ["O_Truck_03_transport_F",350000],
            ["O_Truck_03_covered_F",400000],
            ["O_Truck_03_fuel_F",450000],
            ["O_Truck_03_ammo_F",500000],
            // HEMTT
            ["B_Truck_01_transport_F",666667],
            ["B_Truck_01_covered_F",800000],
            ["B_Truck_01_fuel_F",1000000],
            ["B_Truck_01_box_F",1333334],
            // Spécial
            ["O_Truck_03_device_F",1333000],
            ["O_Truck_02_Ammo_F",5000000]
        ];
    };

    case "civ_air": // [REVIEWED]
    {
        _return =
        [
            ["C_Heli_Light_01_civil_F",553000],
            ["O_Heli_Light_02_unarmed_F",750000],
            ["I_Heli_Transport_02_F",1500000]
        ];
    };

    case "civ_plane": // [REVIEWED]
    {
        _return =
        [
            ["C_Plane_Civil_01_F",750000],
            ["C_Plane_Civil_01_F",1000000]
        ];
    };

    case "civ_ship": // [REVIEWED]
    {
        _return =
        [
            ["C_Rubberboat",10000],
            ["C_Boat_Civil_01_F",40000],
            ["C_Scooter_Transport_01_F",33000],
            ["C_Boat_Transport_02_F",75000]
        ];
    };

    case "reb_car": // [REVIEWED]
    {
        _return =
        [
            ["B_Quadbike_01_F",3000],
            ["B_G_Offroad_01_F",40000],
            ["C_SUV_01_F",50000],
            ["O_LSV_02_unarmed_F",700000],
            ["B_G_Offroad_01_armed_F",750000],
            ["B_CTRG_LSV_01_light_F",750000],
            ["O_MRAP_02_F",1300000],
            ["I_MRAP_03_F",1600000],
            ["O_Truck_02_Ammo_F",5000000]
        ];
    };

    case "reb_air": // [REVIEWED]
    {
        _return =
        [
            ["B_Heli_Light_01_F",750000],
            ["C_Heli_Light_01_civil_F",850000],
            ["O_Heli_Light_02_unarmed_F",1250000],
            ["O_Heli_Light_02_v2_F",1500000],
            ["I_Heli_Transport_02_F",1500000],
            ["O_Heli_Transport_04_covered_F",2500000],
            ["O_Heli_Transport_04_F",5500000]
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
			["I_Heli_Transport_02_F",333333]
                ];
            };
        };
    };

    case "cop_car":
    {
        switch(__GETC__(life_coplevel)) do
        {
            case 1 : //Reserviste
            {
			_return =
			[
				["B_Quadbike_01_F", 5000],
				["C_Offroad_01_F", 20000]
			];
            };
            case 2 : //Gendarme
            {
			_return =
			[
				["B_Quadbike_01_F", 5000],
				["C_Offroad_01_F", 20000],
				["C_Offroad_02_unarmed_F",20000],
				["B_T_LSV_01_unarmed_F",33500]
			];
            };
            case 3 : //adjudant
            {
			_return =
			[
				["B_Quadbike_01_F", 5000],
				["C_Offroad_01_F", 20000],
				["C_Offroad_02_unarmed_F",20000],
				["B_T_LSV_01_unarmed_F",33500]
			];
            };
            case 4 : //Lieutenant
            {
			_return =
			[
				["B_Quadbike_01_F", 5000],
				["C_Offroad_01_F", 20000],
				["C_Offroad_02_unarmed_F",20000],
				["B_T_LSV_01_unarmed_F",33500],
				["I_MRAP_03_F",200000]
			];
            };
            case 5 : //Major
            {
			_return =
			[
				["B_Quadbike_01_F", 5000],
				["C_Offroad_01_F", 20000],
				["C_Offroad_02_unarmed_F",20000],
				["B_T_LSV_01_unarmed_F",33500],
				["I_MRAP_03_F",200000]
			];
            };
            case 6 : //Colonel
            {
			_return =
			[
				["B_Quadbike_01_F", 5000],
				["C_Offroad_01_F", 20000],
				["C_Offroad_02_unarmed_F",20000],
				["B_T_LSV_01_unarmed_F",33500],
				["I_MRAP_03_F",200000]
			];
            };
            case 7 : //Général
            {
			_return =
			[
				["O_T_MBT_02_cannon_ghex_F", 1],
				["B_Quadbike_01_F", 5000],
				["C_Offroad_01_F", 20000],
				["C_Offroad_02_unarmed_F",20000],
				["B_T_LSV_01_unarmed_F",33500],
				["I_MRAP_03_F",200000]
			];
            };
            case 8 : //GIGN
            {
			_return =
			[
				["B_Quadbike_01_F", 5000],
				["C_Offroad_02_unarmed_F",20000],
				["B_T_LSV_01_unarmed_F",33500],
				["I_MRAP_03_F",200000]
			];
            };
        };
    };

    case "cop_air":
    {
        switch(__GETC__(life_coplevel)) do
        {
            case 1 : //Réserviste
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
                        ["B_UAV_AI",1],
                        ["gunner",1],

                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333],
                        ["I_Heli_light_03_unarmed_F",245000],
                        ["B_Heli_Transport_01_F",225000],
                        ["B_Heli_Transport_03_unarmed_F",200000],
                        ["B_T_VTOL_01_infantry_F",300000]
                    ];
                } else {
                    _return =
                    [
                        ["B_UAV_AI",1],
                        ["gunner",1],

                        ["B_Heli_Light_01_F",142000],
                        ["O_Heli_Light_02_unarmed_F",233333],
                        ["I_Heli_light_03_unarmed_F",245000],
                        ["B_Heli_Transport_01_F",225000],
                        ["B_Heli_Transport_03_unarmed_F",200000],
                        ["B_T_VTOL_01_infantry_F",300000]
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
            ["C_Rubberboat",5000],
            ["C_Boat_Civil_01_police_F",20000],
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
                    ["C_Offroad_01_F", 10800],
                    ["C_SUV_01_F", 26000],
                    ["C_Van_01_box_F", 40000],
                    ["C_Hatchback_01_F", 50000],
                    ["O_T_Truck_03_medical_ghex_F",50000]
                ];
            };
            case 2 :
            {
                _return =
                [
                    ["C_Offroad_01_F", 10800],
                    ["C_SUV_01_F", 26000],
                    ["C_Van_01_box_F", 40000],
                    ["C_Hatchback_01_F", 50000],
                    ["O_T_Truck_03_medical_ghex_F",50000]
                ];
            };
            case 3 :
            {
                _return =
                [
                    ["C_Offroad_01_F", 10800],
                    ["C_SUV_01_F", 26000],
                    ["C_Van_01_box_F", 40000],
                    ["C_Hatchback_01_F", 50000],
                    ["O_T_Truck_03_medical_ghex_F",50000]
                ];
            };
            case 4 :
            {
                  _return =
                  [
                        ["C_Offroad_01_F", 10800],
                        ["C_SUV_01_F", 26000],
                        ["C_Van_01_box_F", 40000],
                        ["C_Hatchback_01_F", 50000],
                        ["O_T_Truck_03_medical_ghex_F",50000]
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
                    ["C_Heli_Light_01_civil_F",60000],
                    ["I_Heli_Transport_02_F",80000]
                ];
            };
            case 2 :
            {
                _return =
                [
                    ["C_Heli_Light_01_civil_F",60000],
                    ["I_Heli_Transport_02_F",80000]
                ];
            };
            case 3 :
            {
                _return =
                [
                    ["C_Heli_Light_01_civil_F",60000],
                    ["I_Heli_Transport_02_F",80000]
                ];
            };
            case 4 :
            {
                _return =
                [
                    ["C_Heli_Light_01_civil_F",60000],
                    ["I_Heli_Transport_02_F",80000]
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