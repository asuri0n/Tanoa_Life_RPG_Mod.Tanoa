/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine

	Description	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "wood": {_var = "license_civ_bucheron"};
			case "gold": {_var = "license_civ_joaillier"};
			case "clay": {_var = "license_civ_brique"};
			case "diamant": {_var = "license_civ_diamantaire"};
			case "iron": {_var = "license_civ_iron"};
			case "lin": {_var = "license_civ_tissu"};
			case "oil": {_var = "license_civ_plastique"};
			case "powder": {_var = "license_civ_poudre"};
			case "charbonp": {_var = "license_civ_poudre"};
			case "souffrep": {_var = "license_civ_poudre"};
			case "heroin": {_var = "license_civ_heroine"};
			case "marijuana": {_var = "license_civ_canabis"};
			case "cocaine": {_var = "license_civ_cocaine"};
			case "uraniump": {_var = "license_civ_uranium"};
			case "uraniump1": {_var = "license_civ_uranium"};
			case "uraniump2": {_var = "license_civ_uranium"};
			case "uraniump3": {_var = "license_civ_uranium"};
			case "uraniump4": {_var = "license_civ_uranium"};
			case "archeologie": {_var = "license_civ_archeologie"};
			case "organ": {_var = "license_civ_organ"};

			case "driver": {_var = "license_civ_driver"}; //Drivers License cost
			case "boat": {_var = "license_civ_boat"}; //Boating license cost
			case "pilot": {_var = "license_civ_air"}; //Pilot/air license cost
			case "gun": {_var = "license_civ_gun"}; //Firearm/gun license cost
			case "dive": {_var = "license_civ_dive"}; //Diving license cost
			case "oil": {_var = "license_civ_oil"}; //Oil processing license cost
			case "cair": {_var = "license_cop_air"}; //Cop Pilot License cost
			case "swat": {_var = "license_cop_swat"}; //Swat License cost
			case "cg": {_var = "license_cop_cg"}; //Coast guard license cost
			//case "heroin": {_var = "license_civ_heroin"}; //Heroin processing license cost
			//case "marijuana": {_var = "license_civ_marijuana"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "gang": {_var = "license_civ_gang"}; //Gang license cost
			case "rebel": {_var = "license_civ_rebel"}; //Rebel License
			case "truck":{_var = "license_civ_truck"}; //Truck License
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			//case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "copper": {_var = "license_civ_copper"};
			case "cement": {_var = "license_civ_cement"};
			case "ambulance": {_var = "license_civ_ambulance"};
			//case "depanneur": {_var = "license_civ_depanneur"};
			case "meth": {_var = "license_civ_meth"};
			case "meth1": {_var = "license_civ_meth"};
			case "meth2": {_var = "license_civ_meth"};
			case "mair": {_var = "license_med_air"};
			case "home": {_var = "license_civ_home"};
			case "papiers": {_var = "license_civ_papiers"};
			case "bornholm": {_var = "license_civ_bornholm"};
			case "liquor": {_var = "license_civ_liquor"};
			case "beer": {_var = "license_civ_liquor"};
			case "stiller": {_var = "license_civ_stiller"};
			case "whiskey": {_var = "license_civ_stiller"};
			case "moonshine": {_var = "license_civ_moonshine"};
			case "mash": {_var = "license_civ_stiller"};
			case "bottledshine": {_var = "license_civ_bottler"};
			case "bottledbeer": {_var = "license_civ_bottler"};
			case "bottledwhiskey": {_var = "license_civ_bottler"};
			case "bottler": {_var = "license_civ_bottler"};
			case "glassbottle": {_var = "license_civ_bottler"};
			case "gangster": {_var = "license_civ_gangster"};
			case "luxecar": {_var = "license_civ_luxecar"};
			case "busdriver": {_var = "license_civ_busDriver"};
			case "bountyhunter": {_var = "license_civ_bounty_hunter"}; //added by Ladislas 09/11/2014
			case "bac": {_var = "license_cop_bac"}; //Ajout licence bac 11/10/14 Jo
			case "wine": {_var = "license_civ_wine"};
			case "pressjuice": {_var = "license_civ_pressjuice"};
			case "applecompote": {_var = "license_civ_applecompote"};
			case "peachcompote": {_var = "license_civ_peachcompote"};
			case "presse": {_var = "license_civ_presse"};
			case "xxx": {_var = "license_civ_xxx"};
			case "wt": {_var = "license_civ_wt"};
			case "turtle": {_var = "license_civ_turtle"};
			case "sscp": {_var = "license_civ_sscp"};
			case "ef": {_var = "license_civ_ef"};
			case "umb": {_var = "license_civ_umb"};


			case "permrebel": {_var = "license_civ_permrebel"};
			case "cop_leger": {_var = "license_cop_fusiller_leger"};
			case "cop_medecin": {_var = "license_cop_medecin"};
			case "cop_lourd": {_var = "license_cop_fusiller_lourd"};
			case "cop_precision": {_var = "license_cop_tireur_precision"};
			case "cop_elite": {_var = "license_cop_tireur_elite"};

			case "bonbeur": {_var = "license_civ_bonbeur"};
			case "natiosecuri": {_var = "license_civ_natiosecuri"};

			case "transport": {_var = "license_civ_busDriver"}; //WearlDStyLz
			default {_var = ""};
		};
	};

	case 1:
	{
		switch (_type) do
		{
			case "license_med_air": {_var = "mair"};
			case "license_civ_driver": {_var = "driver"}; //Drivers License cost
			case "license_civ_boat": {_var = "boat"}; //Boating license cost
			case "license_civ_air": {_var = "pilot"}; //Pilot/air license cost
			case "license_civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "license_civ_dive": {_var = "dive"}; //Diving license cost
			case "license_civ_oil": {_var = "oil"}; //Oil processing license cost
			case "license_cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "license_cop_swat": {_var = "swat"}; //Swat License cost
			case "license_cop_cg": {_var = "cg"}; //Coast guard license cost
			case "license_civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "license_civ_gang": {_var = "gang"}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel"}; //Rebel License
			case "license_civ_truck":{_var = "truck"}; //Truck License
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_cement": {_var = "cement"};
			case "license_civ_ambulance": {_var = "ambulance"};
			//case "license_civ_depanneur": {_var = "depanneur"};
 			case "license_civ_home": {_var = "home"};
			case "license_civ_meth": {_var = "meth"};
			case "license_civ_archeologie": {_var = "archeologie"};
			case "license_civ_papiers": {_var = "papiers"};
			case "license_civ_bornholm": {_var = "bornholm"};
			case "license_civ_gangster": {_var = "gangster"}; //Rebel License
			case "license_civ_luxecar": {_var = "luxecar"};
			case "license_civ_busDriver": {_var = "busdriver"};
			case "license_civ_bounty_hunter": {_var = "bountyhunter"}; //added by Ladislas 09/11/2014
			case "license_cop_bac": {_var = "bac"}; //Ajout licence bac 11/10/14 Jo
			case "license_civ_stiller": {_var = "stiller"};
			case "license_civ_liquor": {_var = "liquor"};
			case "license_civ_wine": {_var = "wine"};
			case "license_civ_applecompote": {_var = "applecompote"};
			case "license_civ_peachcompote": {_var = "peachcompote"};
			case "license_civ_presse": {_var = "presse"};
			case "license_civ_xxx": {_var = "xxx"};
			case "license_civ_wt": {_var = "wt"};
			case "license_civ_sscp": {_var = "sscp"};
			case "license_civ_ef": {_var = "ef"};
			case "license_civ_umb": {_var = "umb"};
			case "license_civ_turtle": {_var = "turtle"};
			/*
			case "license_cop_fusiller_leger": {_var = "cop_leger"};
			case "license_cop_medecin": {_var = "cop_medecin"};
			case "license_cop_fusiller_lourd": {_var = "cop_lourd"};
			case "license_cop_tireur_precision": {_var = "cop_precision"};
			case "license_cop_tireur_elite": {_var = "cop_elite"};
			*/

			case "license_civ_permrebel": {_var = "permrebel"};
			case "license_civ_organ": {_var = "organ"};


			case "license_civ_bucheron": {_var = "wood"};
			case "license_civ_joaillier": {_var = "gold"};
			case "license_civ_brique": {_var = "clay"};
			case "license_civ_diamantaire": {_var = "diamant"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_tissu": {_var = "lin"};
			case "license_civ_plastique": {_var = "oil"};
			case "license_civ_poudre": {_var = "powder"};
			case "license_civ_heroine": {_var = "heroin"};
			case "license_civ_canabis": {_var = "marijuana"};
			case "license_civ_cocaine": {_var = "cocaine"};
			case "license_civ_uranium": {_var = "uraniump"};
			case "license_civ_archeologie": {_var = "archeologie"};
			case "license_civ_organ": {_var = "organ"};

			case "license_civ_bonbeur": {_var = "bonbeur"};
			case "license_civ_natiosecuri": {_var = "natiosecuri"};


			default {_var = ""};
		};
	};
};
_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;
