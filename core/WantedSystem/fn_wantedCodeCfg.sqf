/*
	Filename: fn_wantedCodeCfg.sqf
	Author: Komodo

	Description: returns title & description of wanted codes.
*/
private ["_code","_type"];
_code = [_this,0,"",[""]] call BIS_fnc_param;

switch(_code) do
{
    case "187V": {_type = ["Homicide (véhicule)",0]};
    case "187": {_type = ["Homicide",400000]};
    case "187T": {_type = ["Tentative Homicide",150000]};
    case "188": {_type = ["Homicide sur Agent",400000]};
    case "188T": {_type = ["Tentative d'homicide sur Agent",400000]};
    case "261": {_type = ["Vol",10000]};
    case "261A": {_type = ["Tentative de vol",5000]};
    case "215": {_type = ["Tentative de vol de véhicule",20000]};
    case "213": {_type = ["Utilisation illégal d'explosifs",10000]};
    case "211": {_type = ["Braquage à main armée",20000]};
    case "208": {_type = ["Séquéstration de Civil",50000]};
    case "209": {_type = ["Séquéstration de Gendarme",70000]};
    case "216": {_type = ["Tentative de démenottage",10000]};
    case "207": {_type = ["Kidnapping",50000]};
	case "207A": {_type = ["Tentative de kidnapping",10000]};
    case "480": {_type = ["Délit de fuite",15000]};
    case "481": {_type = ["Possession de drogue (prime)",20000]};
    case "482": {_type = ["Distribution de Drogue",40000]};
    case "483": {_type = ["Trafic de Drogues",75000]};
    case "487": {_type = ["Vol de véhicule",35000]};
    case "488": {_type = ["Larcin",700]};
    case "489": {_type = ["Crochettage de Menottes (prime)",30000]};
    case "490": {_type = ["Consommation de Stupéfiants", 20000]};
    case "491": {_type = ["Stationnement Gênant", 500]};
    case "492": {_type = ["Conduite Dangereuse", 1000]};
    case "501": {_type = ["Sabotage",40000]};
    case "901": {_type = ["Evasion de prison",50000]};
    case "919": {_type = ["Organ Dealing",20000]};
	default {_type = [];};
};

_type;