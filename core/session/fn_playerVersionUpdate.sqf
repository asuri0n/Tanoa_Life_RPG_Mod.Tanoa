/*
	Filename: fn_playerVersionUpdate.sqf
	Author: Komodo

	Description:
	- version 1: 06.03.2015 - origin
	- version 2: 07.03.2015 - Licenses Removed
	    case "boat": {1000}; //Boating license cost
        case "pilot": {25000}; //Pilot/air license cost
        case "gun": {100000}; //Firearm/gun license cost
        case "dive": {2000}; //Diving license cost
        case "oil": {10000}; //Oil processing license cost
        case "cair": {15000}; //Cop Pilot License cost
        case "swat": {35000}; //Swat License cost
        case "cg": {20000}; //Coast guard license cost
        case "heroin": {25000}; //Heroin processing license cost
        case "marijuana": {19500}; //Marijuana processing license cost
        case "medmarijuana": {1500}; //Medical Marijuana processing license cost
        case "gang": {10000}; //Gang license cost
        case "rebel": {10000000}; //Rebel license cost
        case "truck": {20000}; //Truck license cost
        case "diamond": {35000};
        case "salt": {12000};
        case "cocaine": {30000};
        case "sand": {14500};
        case "iron": {9500};
        case "copper": {8000};
        case "cement": {6500};
        case "mair": {15000};
        case "meth": {175000};
        case "archeologie": {1000000};
        //case "depanneur": {40000};
        case "home": {100000}; // license proprietaire
        case "papiers": {50000}; //papiers
        case "stiller":{30000};
        case "liquor":{100000};
        case "bottler":{100000};
        case "mash":{100000};
        case "gangster":{2000000};
        case "luxecar":{15000};
        case "busdriver":{100000}; //Ajout prix licence busdriver
        case "bountyhunter": {500000}; //added by Ladislas 09/11/2014
        case "bac":{100000}; //osef mais on sait jamais
        case "pressjuice":{10000};
        case "wine":{20000};
        case "moonshine":{50000};
        case "applecompote":{6000};
        case "peachcompote":{6000};
        case "presse":{99999999};
        case "turtle":{2000000};
*/

if (invo_player_version == 2) exitWith {diag_log "INVO_DEBUG - playerVersionUpdate - Player Version OK";};
diag_log format["INVO_DEBUG - playerVersionUpdate - Player Version: %1", invo_player_version];

if (invo_player_version <= 1) then
{
	if (license_civ_air) then {license_civ_air = false; life_dabliquide = life_dabliquide + 25000; ["playerUpdate", true, 25000] call life_fnc_antiCheatCash;};
	if (license_civ_oil) then {license_civ_oil = false; life_dabliquide = life_dabliquide + 10000; ["playerUpdate", true, 10000] call life_fnc_antiCheatCash;};
	if (license_civ_dive) then {license_civ_dive = false; life_dabliquide = life_dabliquide + 2000; ["playerUpdate", true, 2000] call life_fnc_antiCheatCash;};
	if (license_civ_heroin) then {license_civ_heroin = false; life_dabliquide = life_dabliquide + 25000; ["playerUpdate", true, 25000] call life_fnc_antiCheatCash;};
	if (license_civ_marijuana) then {license_civ_marijuana = false; life_dabliquide = life_dabliquide + 19500; ["playerUpdate", true, 19500] call life_fnc_antiCheatCash;};
	if (license_civ_diamond) then {license_civ_diamond = false; life_dabliquide = life_dabliquide + 35000; ["playerUpdate", true, 35000] call life_fnc_antiCheatCash;};
	if (license_civ_salt) then {license_civ_salt = false; life_dabliquide = life_dabliquide + 12000; ["playerUpdate", true, 12000] call life_fnc_antiCheatCash;};
	if (license_civ_coke) then {license_civ_coke = false; life_dabliquide = life_dabliquide + 30000; ["playerUpdate", true, 30000] call life_fnc_antiCheatCash;};
	if (license_civ_meth) then {license_civ_meth = false; life_dabliquide = life_dabliquide + 175000; ["playerUpdate", true, 175000] call life_fnc_antiCheatCash;};
	if (license_civ_archeologie) then {license_civ_archeologie = false; life_dabliquide = life_dabliquide + 1000000; ["playerUpdate", true, 1000000] call life_fnc_antiCheatCash;};
	if (license_civ_luxecar) then {license_civ_luxecar = false; life_dabliquide = life_dabliquide + 15000; ["playerUpdate", true, 15000] call life_fnc_antiCheatCash;};
	if (license_civ_moonshine) then {license_civ_moonshine = false; life_dabliquide = life_dabliquide + 50000; ["playerUpdate", true, 50000] call life_fnc_antiCheatCash;};
	if (license_civ_turtle) then {license_civ_turtle = false; life_dabliquide = life_dabliquide + 2000000; ["playerUpdate", true, 2000000] call life_fnc_antiCheatCash;};
};

invo_player_version = 2;