/*
	Author: Komodo
	Filename: fn_carryLoadCfg.sqf

	Description: Created to speed up execution of weight capacity on player
*/
private["_bp","_cfg","_load"];

_bp = backpack player;

if(_bp == "") exitWith
{
	life_maxWeight = life_maxWeightT;
};

_cfg = getNumber(configFile >> "CfgVehicles" >> (_bp) >> "maximumload");
_load = round(_cfg / 8);

switch (_bp) do {
    case "B_AssaultPack_blk": {_load=10;};
    case "B_AssaultPack_cbr": {_load=10;};
    case "B_AssaultPack_khk": {_load=10;};
    case "B_AssaultPack_sgg": {_load=10;};
    case "B_AssaultPack_rgr": {_load=10;};
    case "B_AssaultPack_Kerry": {_load=10;};
    case "B_mas_AssaultPack_wint_AA": {_load=10;};
	
    case "B_FieldPack_ocamo": {_load=30;};
    case "B_FieldPack_cbr": {_load=30;};
    case "B_FieldPack_blk": {_load=30;};
    case "B_Kitbag_mcamo": {_load=30;};
    case "B_Respawn_Sleeping_bag_F": {_load=30;};
    case "B_Respawn_Sleeping_bag_blue_F": {_load=30;};
	
    case "B_Kitbag_sgg": {_load=35;};
    case "B_Kitbag_cbr": {_load=35;};
    case "B_Kitbag_rgr": {_load=35;};
    case "B_mas_Kitbag_black": {_load=35;};
	
    case "B_Bergen_sgg": {_load=45;};
    case "B_TacticalPack_ocamo": {_load=45;};
    case "B_TacticalPack_oli": {_load=45;};
	
    case "B_Carryall_oucamo": {_load=60;};
    case "B_Carryall_ocamo": {_load=60;};
    case "B_Carryall_cbr": {_load=60;};
    case "B_Carryall_khk": {_load=60;};
    case "B_Carryall_mcamo": {_load=60;};
    case "B_Carryall_oli": {_load=60;};
    case "B_Respawn_TentA_F": {_load=60;};
	
	case "B_Bergen_hex_F": {_load=70;};
	case "B_Bergen_dgtl_F": {_load=70;};
	case "B_Bergen_mcamo_F": {_load=70;};
	
    case "B_Respawn_TentA_F": {_load=60;};
	
	case "tf_anprc155": {_load=60;};
	case "tf_anprc155_coyote": {_load=60;};
	case "tf_rf7800str_2": {_load=60;};
};

life_maxWeight = life_maxWeightT + _load;
