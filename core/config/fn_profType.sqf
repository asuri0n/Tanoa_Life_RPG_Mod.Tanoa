/*
	File: fn_profType
	Author: Jacob "PapaBear" Tyler 
	Description:Text changing
*/
//convert name to prof name
_type = [_this,0,"",[""]] call BIS_fnc_param; 
if(_type == "" ) exitWith {[]}; 
_profName = "";
switch ( _type ) do {
	//text to license
	case "heroinpy":{
		_profName = "Heroine_Prof"; 
	};
	case "heroinpurp":{
		_profName = "Heroine_Prof"; 
	};
	case "cocainp": { 
		_profName = "Cocaine_Prof";
	};
	case "cocainpurp": { 
		_profName = "Cocaine_Prof";
	};
	case "marip": { 
		_profName = "Canabis_Prof";
	};
	case "maripurp": { 
		_profName = "Canabis_Prof";
	};
	case "uraniump1": { 
		_profName = "Uranium_Prof";
	};	
	case "uraniump": { 
		_profName = "Uranium_Prof";
	};
	case "fish": {
		_profName = "Peche_Prof"; 
	};
	case "boisp": { 
		_profName = "Bucheron_Prof";
	};
	case "planchep": { 
		_profName = "Bucheron_Prof";
	};
	case "linp": {
		_profName = "Tissu_Prof";
	};
	case "tissup": {
		_profName = "Tissu_Prof";
	};
	case "souffrep": { 
		_profName = "Poudre_Prof";
	};
	case "charbonp": { 
		_profName = "Poudre_Prof";
	};
	case "poudrenoirp": { 
		_profName = "Poudre_Prof";
	};
	case "clayp": { 
		_profName = "Brique_Prof";
	};
	case "briquep": { 
		_profName = "Brique_Prof";
	};
	case "oilpy": { 
		_profName = "Plastique_Prof";
	};
	case "oilpy": { 
		_profName = "Plastique_Prof";
	};
	case "goldp": { 
		_profName = "Joaillier_Prof";
	};
	case "diamantp": { 
		_profName = "Diamantaire_Prof"; 
	};
	case "diamantpurp": { 
		_profName = "Diamantaire_Prof"; 
	};
	case "ironorep": { 
		_profName = "Forgeron_Prof"; 
	};
	case "ironp": { 
		_profName = "Forgeron_Prof"; 
	};
	
	//license to text
	case "Heroine_Prof": {
		_profName = "Heroine"; 
	};
	case "Cocaine_Prof": { 
		_profName = "Cocaine";
	};
	case "Canabis_Prof": { 
		_profName = "Canabis";
	};
	case "Uranium_Prof": { 
		_profName = "Uranium"; 
	};
	case "Peche_Prof": { 
		_profName = "Pêche";
	};
	case "Bucheron_Prof": {
		_profName = "Bois"; 
	};
	case "Tissu_Prof": { 
		_profName = "Lin";
	};
	case "Poudre_Prof": { 
		_profName = "Poudre";
	};
	case "Brique_Prof": { 
		_profName = "Argile";
	};
	case "Plastique_Prof": { 
		_profName = "Pétrole";
	};
	case "Joaillier_Prof": { 
		_profName = "Or"; 
	};
	case "Diamantaire_Prof": { 
		_profName = "Diamond"; 
	};
	case "Forgeron_Prof": { 
		_profName = "Fer"; 
	};
	default{""};
};   


diag_log "------------------- Prof Type ------------------";
diag_log format["_profName: %1",_profName];
diag_log format["_type: %1",_type];
diag_log "------------------------------------------------";

	
_profName;
