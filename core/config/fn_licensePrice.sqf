/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	// news

	case "wood": {2000};
	case "gold": {100000};
	case "clay": {20000};
	case "diamant": {200000};	
	case "iron": {50000};			
	case "lin": {10000};
	case "oil": {35000};
	case "powder": {40000};
	case "charbonp": {0};
	case "souffrep": {0};		
	case "heroin": {675000};
	case "marijuana": {300000};
	case "cocaine": {800000};		
	case "uraniump": {1200000};
	case "archeologie": {1000000};
	case "organ": {2500000};	
			
	//LICENCES
	case "driver": {2500}; //Drivers License cost
	case "boat": {35000}; //Boating license cost
	case "pilot": {200000}; //Pilot/air license cost
	case "gun": {50000}; //Firearm/gun license cost
	case "dive": {20000}; //Diving license cost
	case "gang": {10000}; //Gang license cost
	case "truck": {100000}; //Truck license cost
	case "mair": {50000};
	
	//RESSOURCES
	case "pressjuice": {0};
	case "applecompote": {0};
	case "peachcompote": {0};
	case "iron": {0};
	case "copper": {0};
	case "cement": {0};
	case "sand": {0};
	case "salt": {0};
	case "wine":{0};	
	case "oil": {0};
	case "diamond": {0};	
	case "moonshine": {0};
	case "turtle": {0};
	case "meth": {0};		
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "rebel": {1500000}; //Rebel license cost	
	case "home": {150000}; // license proprietaire
	case "stiller":{30000};
	case "liquor":{100000};
	case "bottler":{100000};
	case "mash":{100000};
	case "gangster":{1000000};
	case "luxecar":{15000};	
	case "busdriver":{50000}; //Ajout prix licence busdriver
	case "bountyhunter": {500000}; //added by Ladislas 09/11/2014
	
	//CLANS
	case "presse":{0};
	case "xxx":{0};
	case "sscp":{0};
	case "ef":{0};
	case "wt":{0};	
	case "permrebel":{0};	
	case "bac":{0};
	case "umb":{0};	
	
	//COP
	case "cop_leger": {30000};
	case "cop_lourd": {80000};
	case "cop_precision": {100000};
	case "cop_elite": {120000};	
	case "cair": {50000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {20000}; //Coast guard license cost	
};