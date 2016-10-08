/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
//["Traitement"] spawn life_fnc_spotShop;

if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action depuis le véhicule." };
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_oldItemName","_countAllWest","_2var","_oldItem2","_oldVal2"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
_error = false;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "wood": {["boisp","planchep",1200,"Transformation du bois","Bois",false, false];};
	case "gold": {["goldp","goldbarp",1200,"Transformation de l'or","Minerai d'or",false, false];};
	case "clay": {["clayp","briquep",1200,"Transformation de l'argile","Argile",false, false];};
	case "diamant": {["diamantp","diamantpurp",1200,"Transformation du diamant","Minerai de diamant",false, false];};
	case "iron": {["ironorep","ironp",1120,"Fonte du Fer","Minerai de Fer",false, false]};
	case "powder": {["charbonp","poudrenoirp",1200,"Traitement charbon",false,false]};
	case "uraniump1": {["uraniump1","uraniump2",6000,"Nettoyage de l'Uranium","Uranium Nettoyé",false, false]};
	case "uraniump2": {["uraniump2","uraniump3",6000,"Dissolution Uranium Légal",false,true,"puranium"]};
	case "uraniump3": {["uraniump3","uraniump4",6000,"Separation Uranium Légal",false,false, false]};
	case "uraniump4": {["uraniump4","uraniump",6000,"Séchage Uranium Légal",false,false, false]};
	case "oil": {["oilpy","plastiquep",1500,"Transformation du pétrole","Plastique",false,false]};
	case "lin": {["linp","tissup",1200,"Transformation du lin","Lin",false, false];};
	case "cocaine": {["cocainp","cocainpurp",1500,"Traitement de la Cocaïne","Feuille de Coca",false, false]};
	case "marijuana": {["marip","maripurp",500,"Traitement de la Marijuana","Chanvre",false, false]};
	case "heroin": {["heroinpy","heroinpurp",1720,"Traitement de l'Héroïne","Graine de pavot",false, false]};
	case "meth": {["kitmeth","poudrehydroxyde",2500,"Traitement de la Meth","Poudre Hydroxyde Sodium",false, false]};
	case "meth1": {["poudrehydroxyde","crystalmeth",3000,"Traitement de la Poudre Hydroxyde","Cristal de Meth",false, false]};
	case "meth2": {["crystalmeth","crystalmethpur",3500,"Purification Cristal de Meth","Cristal de Meth Pur",false, false]};
	case "archeologie": {["archeologieillegale","archeologie",2000,"Légalisation des ossements","Ossements Légaux",false, false]};
	case "organ": {["organ","organp",2000,"Reconditionnement des organes","Organes enpaquetés",false, false]};

	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {hint "Tu n'as pas les ingrédients nécessaires"};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_oldItemName = _itemInfo select 4;
_2var = _itemInfo select 5;
_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

// Minimum cops ?
/*
_west = playersNumber west;
if(( _oldItem == "cocainp" OR _oldItem == "heroinpy" OR _oldItem == "uraniump1" OR _oldItem == "uraniump2" OR _oldItem == "uraniump3" OR _oldItem == "uraniump4" OR _oldItem == "organ") && _west == 0) exitWith
{
	hint "Il n'y a pas de gendarmes de connecté. Stocker dans votre maison et réitérer plus tard cette tentative...";
	5 cutText ["","PLAIN"];
};
*/

// If he has the required license
if(_hasLicense) then
{
	//2vars
	if(_2var) then {
		_oldItem2 = _itemInfo select 6;
		_oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle);
	};

	_cost = _cost * _oldVal;
	//Some more checks
	if(_oldVal == 0) exitWith {};

	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	life_is_processing = true;


	while{true} do {
		sleep 0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {life_is_processing = false;};
	};

	if(player distance _vendor > 10) exitWith {hint "Tu dois rester dans un rayon de 10 mètres pour effectuer le traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	if(_2var) then
	{
		([false,_oldItem2,_oldVal2] call life_fnc_handleInv); //delete the second items (for example Iron)
	};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	//Ajout de Sky pour différencier le genre
	if(_oldItem == "cocaine" OR _oldItem == "cannabis" OR _oldItem == "poudrehydroxyde") exitWith {titleText[format["Tu as transformé la %1 en %2",_oldItemName,_itemName],"PLAIN"]; life_is_processing = false;};
	if(_oldItem == "heroinu") exitWith {titleText[format["Tu as transformé l'%1 en %2",_oldItemName,_itemName],"PLAIN"]; life_is_processing = false;};
	if(_oldItem == "diamond") exitWith {titleText[format["Tu as transformé %1 %2 en %3",_oldVal,_oldItemName,_itemName],"PLAIN"]; life_is_processing = false;};
	//Fin ajout
	titleText[format["Tu as transformé %1 %3 en %2",_oldVal,_itemName,_oldItemName],"PLAIN"];
	life_is_processing = false;

} else
{
	hint format["Tu n'as pas la license requise :/"];
	life_is_processing = false;
};